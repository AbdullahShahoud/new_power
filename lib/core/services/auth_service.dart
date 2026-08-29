import 'package:flutter/material.dart';

import '../../features/auth/data/models/logout_request.dart';
import '../di/dependency_injection.dart';
import '../../features/notifications/data/repo/push_service.dart';
import '../helpers/secure_storage_helper.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

/// Owns token persistence, refresh, logout and authentication-state checks.
/// Scoped to what auth.md actually documents — no wallet/notification/socket
/// cleanup here, those belong to their own (currently unbuilt) modules.
class AuthService {
  final ApiService _apiService;

  AuthService(this._apiService);

  /// Flag to track if logout happened during refresh token attempt
  /// Used during startup to distinguish between network errors and auth failures
  static bool _tokenExpiredDuringRefresh = false;

  /// Absolute time at which the server-side rate limit on the refresh
  /// endpoint (10/2min, auth.md) expires. Set when DioFactory observes a 429
  /// on the refresh call. The startup error screen reads this to disable the
  /// retry button and show a live countdown.
  static DateTime? _refreshRateLimitedUntil;

  static void markRefreshRateLimited(int retryAfterSeconds) {
    if (retryAfterSeconds <= 0) return;
    _refreshRateLimitedUntil = DateTime.now().add(
      Duration(seconds: retryAfterSeconds),
    );
  }

  static int refreshRateLimitRemainingSeconds() {
    final until = _refreshRateLimitedUntil;
    if (until == null) return 0;
    final diff = until.difference(DateTime.now()).inSeconds;
    return diff > 0 ? diff : 0;
  }

  static void clearRefreshRateLimit() {
    _refreshRateLimitedUntil = null;
  }

  // ===================== Token Management =====================

  /// Refresh access token using the unified refresh path in DioFactory.
  ///
  /// Delegates to [DioFactory.refreshTokenUnified] which uses the same
  /// Completer-based locking as the interceptor, so proactive refresh (e.g.
  /// on app resume) and reactive refresh (on 401) never race each other.
  ///
  /// Returns true if successful, false if token is invalid or refresh fails.
  Future<bool> refreshAccessToken() async {
    final refreshToken = await SecureStorageHelper.readSafe(
      key: SecureStorageHelper.refreshToken,
    );

    if (refreshToken == null || refreshToken.isEmpty) {
      debugPrint('[AuthService] No refresh token found');
      return false;
    }

    try {
      final newAccessToken = await DioFactory.refreshTokenUnified();

      if (newAccessToken == null) {
        final tokenStillExists = await SecureStorageHelper.readSafe(
          key: SecureStorageHelper.refreshToken,
        );
        if (tokenStillExists == null || tokenStillExists.isEmpty) {
          // Token was cleared (by the interceptor's 401 handling) → auth failure
          debugPrint('[AuthService] Token expired — cleared by refresh');
          _tokenExpiredDuringRefresh = true;
        } else {
          _tokenExpiredDuringRefresh = false;
          debugPrint('[AuthService] refreshAccessToken failed (network)');
        }
        return false;
      }

      debugPrint('[AuthService] Token refresh successful');
      _tokenExpiredDuringRefresh = false;
      return true;
    } catch (e) {
      debugPrint('[AuthService] refreshAccessToken error: $e');
      _tokenExpiredDuringRefresh = false;
      return false;
    }
  }

  /// Check if token expired during last refresh attempt
  /// Used by the startup router to decide between login and the retry screen
  static bool wasTokenExpired() => _tokenExpiredDuringRefresh;

  /// Clear the token expiration flag for next startup
  static void clearTokenExpiredFlag() {
    _tokenExpiredDuringRefresh = false;
  }

  /// Persist a fresh token pair and its expiry, computed from the
  /// `expiresIn`/`refreshExpiresIn` seconds auth.md's `Tokens` shape returns.
  static Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
    required int expiresIn,
    int? refreshExpiresIn,
  }) async {
    await SecureStorageHelper.save(
      key: SecureStorageHelper.accessToken,
      value: accessToken,
    );
    await SecureStorageHelper.save(
      key: SecureStorageHelper.refreshToken,
      value: refreshToken,
    );

    final now = DateTime.now();
    await SecureStorageHelper.save(
      key: SecureStorageHelper.accessTokenExpiresAt,
      value: now.add(Duration(seconds: expiresIn)).toIso8601String(),
    );
    // Fall back to auth.md's documented default (7 days = 604800s) if the
    // server omits refreshExpiresIn, so isRefreshTokenExpired() always has a
    // date to compare against.
    await SecureStorageHelper.save(
      key: SecureStorageHelper.refreshTokenExpiresAt,
      value: now
          .add(Duration(seconds: refreshExpiresIn ?? 604800))
          .toIso8601String(),
    );

    _tokenExpiredDuringRefresh = false;
  }

  /// Check if the access token is expired or about to expire.
  /// Uses a 30-second buffer to proactively refresh before actual expiry.
  static Future<bool> isAccessTokenExpired() async {
    try {
      final expiresAtStr = await SecureStorageHelper.readSafe(
        key: SecureStorageHelper.accessTokenExpiresAt,
      );
      if (expiresAtStr == null) return true;
      final expiresAt = DateTime.parse(expiresAtStr);
      return DateTime.now().isAfter(
        expiresAt.subtract(const Duration(seconds: 30)),
      );
    } catch (_) {
      return true;
    }
  }

  /// Check if the refresh token is expired.
  static Future<bool> isRefreshTokenExpired() async {
    try {
      final expiresAtStr = await SecureStorageHelper.readSafe(
        key: SecureStorageHelper.refreshTokenExpiresAt,
      );
      if (expiresAtStr == null) return true;
      final expiresAt = DateTime.parse(expiresAtStr);
      return DateTime.now().isAfter(expiresAt);
    } catch (_) {
      return true;
    }
  }

  Future<String?> getAccessToken() async {
    return SecureStorageHelper.readSafe(key: SecureStorageHelper.accessToken);
  }

  Future<String?> getRefreshToken() async {
    return SecureStorageHelper.readSafe(key: SecureStorageHelper.refreshToken);
  }

  // ===================== Auth Status =====================

  Future<bool> hasRefreshToken() async {
    final token = await SecureStorageHelper.readSafe(
      key: SecureStorageHelper.refreshToken,
    );
    return token != null && token.isNotEmpty;
  }

  // ===================== Logout =====================

  /// POST /auth/logout (best-effort) then clear local session state
  /// regardless of the server call's outcome, and reset DI so every Cubit's
  /// in-memory state is cleared too.
  Future<void> logout() async {
    // ⚠️ Order matters: `DELETE /device/fcm-token` needs a **valid access
    // token**, so it has to run before `/auth/logout` revokes the session.
    // Skipping it leaves the device receiving pushes for an account that is
    // no longer signed in — the token stays bound server-side until Firebase
    // happens to report it as stale.
    //
    // Best-effort like the logout call itself: a failure here must never
    // strand the user in a signed-in state they asked to leave.
    try {
      await getIt<PushService>().dispose();
    } catch (_) {
      // Push was never available, or the call failed. Logging out is still
      // the priority.
    }

    try {
      final refreshToken = await getRefreshToken();
      await _apiService.logout(LogoutRequest(refreshToken: refreshToken));
    } catch (_) {
      // Best-effort — local cleanup below always runs regardless.
    }
    await _clearLocalSession();
    // Awaited: this drops and rebuilds the session scope, and the login
    // screen resolves dependencies out of it the moment we return.
    await resetGetIt();
  }

  Future<void> _clearLocalSession() async {
    await SecureStorageHelper.delete(key: SecureStorageHelper.accessToken);
    await SecureStorageHelper.delete(key: SecureStorageHelper.refreshToken);
    await SecureStorageHelper.delete(
      key: SecureStorageHelper.accessTokenExpiresAt,
    );
    await SecureStorageHelper.delete(
      key: SecureStorageHelper.refreshTokenExpiresAt,
    );
    await SecureStorageHelper.delete(key: SecureStorageHelper.verificationId);
  }
}
