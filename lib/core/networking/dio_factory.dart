import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../config/feature_flags.dart';
import '../routing/navigation_key.dart';
import '../helpers/secure_storage_helper.dart';
import '../routing/routes.dart';
import '../services/device_service.dart';
import 'api_constants.dart';

/// Builds and owns the app's two Dio instances (see auth.md / README1.md):
///
///  - [getAuthDio] — register, login, verify-otp, resend-verification,
///    refresh, logout, me, forgot/reset-password. Public auth endpoints skip
///    the Authorization header; every request gets `X-Device-Id`.
///  - [getAppDio] — everything future (KYC, wallet, territories, ...). Not
///    consumed by anything yet, but shares the same auth/refresh/offline-queue
///    infrastructure so a new feature module can start using it immediately.
///
/// Both share one configuration builder and one interceptor factory — the
/// token-refresh single-flight lock, the offline queue and the logging setup
/// are Single-Source-of-Truth, not duplicated per instance.
class DioFactory {
  DioFactory._();

  static Dio? _authDio;
  static Dio? _appDio;
  static Dio? _refreshDio;

  // ─── Completer-based token refresh locking (race condition prevention) ──
  /// Instead of a boolean flag checked after async operations, use a Completer
  /// to ensure only ONE token refresh API call happens even with several
  /// concurrent 401s. All concurrent requests wait for the same result.
  static Completer<String>? _tokenRefreshCompleter;

  // ─── Offline queue ────────────────────────────────────────────────────────
  static final List<_OfflineRequest> _offlineQueue = [];

  /// Max time a request will wait for internet before being rejected.
  static const Duration _offlineQueueTimeout = Duration(minutes: 3);

  /// Maximum number of requests that can be held in the offline queue.
  static const int _maxOfflineQueueSize = 3;

  /// Public/refresh-only auth endpoints — never get an Authorization header.
  /// `login`/`register`/etc. don't have a token yet; `refresh` explicitly
  /// must not send one (auth.md: "do not send an Authorization header").
  static const _noAuthHeaderEndpoints = [
    ApiConstants.registerUser,
    ApiConstants.loginUser,
    ApiConstants.verifyOtp,
    ApiConstants.requestVerification,
    ApiConstants.resendVerification,
    ApiConstants.forgotPassword,
    ApiConstants.resetPassword,
    ApiConstants.refreshToken,
  ];

  // ─── Replay attack protection (kept as a stub, unchanged) ────────────────
  static String _generateNonce() {
    final random = Random.secure();
    final values = List<int>.generate(16, (i) => random.nextInt(256));
    return values.map((x) => x.toRadixString(16).padLeft(2, '0')).join();
  }

  static Future<void> _addReplayProtectionHeaders(
    RequestOptions options,
  ) async {
    // options.headers['X-Request-Nonce'] = _generateNonce();
    // options.headers['X-Request-Timestamp'] = await _getTimestamp();
  }

  static void _ensureRefreshDioInitialized() {
    if (_refreshDio == null) {
      _refreshDio = Dio();
      const refreshTimeOut = Duration(seconds: 60);
      _refreshDio!
        ..options.baseUrl = ApiConstants.baseUrl
        ..options.connectTimeout = refreshTimeOut
        ..options.receiveTimeout = refreshTimeOut
        ..options.headers = {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        };

      _refreshDio?.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            await _addReplayProtectionHeaders(options);
            return handler.next(options);
          },
        ),
      );
    }
  }

  /// Shared base config applied to every Dio instance we build.
  static void _configureCommon(Dio dio, Duration timeout) {
    dio.options.baseUrl = ApiConstants.baseUrl;
    dio.options.connectTimeout = timeout;
    dio.options.receiveTimeout = timeout;
    dio.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(requestBody: true, responseBody: true, compact: true),
      );
    }
    dio.interceptors.add(createCommonInterceptor(dio));
  }

  /// Dio instance for `/auth/*` calls.
  static Dio getAuthDio() {
    _ensureRefreshDioInitialized();
    if (_authDio == null) {
      _authDio = Dio();
      _configureCommon(_authDio!, const Duration(seconds: 20));
    }
    return _authDio!;
  }

  /// Dio instance for every future non-auth module.
  static Dio getAppDio() {
    _ensureRefreshDioInitialized();
    if (_appDio == null) {
      _appDio = Dio();
      _configureCommon(_appDio!, const Duration(seconds: 30));
    }
    return _appDio!;
  }

  // ══════════════════════════════════════════════════════════════════════════
  // Offline Queue — save request, retry when internet returns
  // ══════════════════════════════════════════════════════════════════════════

  /// Add a failed request to the offline queue and start watching connectivity.
  static void _enqueueOfflineRequest(
    DioException error,
    ErrorInterceptorHandler handler,
    Dio source,
  ) {
    // Only queue idempotent read-only requests. Retrying POST/PUT/DELETE/PATCH
    // after reconnect risks duplicate side effects.
    final method = error.requestOptions.method.toUpperCase();
    if (method != 'GET' && method != 'HEAD') {
      handler.next(error);
      return;
    }

    if (_offlineQueue.length >= _maxOfflineQueueSize) {
      // Queue is full — reject immediately rather than silently dropping.
      handler.next(
        DioException(
          requestOptions: error.requestOptions,
          type: DioExceptionType.connectionError,
          message: 'Offline queue is full. Please retry when online.',
        ),
      );
      return;
    }

    _offlineQueue.add(
      _OfflineRequest(
        requestOptions: error.requestOptions,
        handler: handler,
        enqueuedAt: DateTime.now(),
        sourceDio: source,
      ),
    );

    _showNoInternetBanner();
  }

  /// Show a persistent snackbar telling the user the request will be retried.
  static void _showNoInternetBanner() {
    final context = navigatorKey.currentContext;
    if (context == null) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Row(
          children: [
            Icon(Icons.wifi_off, color: Colors.white, size: 18),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                'No internet — request will be resent automatically.',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xFFE53935),
        duration: Duration(minutes: 3), // dismissed programmatically
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  /// Dismiss the no-internet banner and show a reconnected banner.
  static void _showReconnectedBanner() {
    final context = navigatorKey.currentContext;
    if (context == null) return;

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Row(
          children: [
            Icon(Icons.wifi, color: Colors.white, size: 18),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                'Connection restored resending request…',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xFF43A047),
        duration: Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  /// Retry every queued offline request now that the internet is back.
  static Future<void> _retryOfflineQueue() async {
    final requests = List<_OfflineRequest>.from(_offlineQueue);
    _offlineQueue.clear();

    _showReconnectedBanner();

    for (final request in requests) {
      if (DateTime.now().difference(request.enqueuedAt) >
          _offlineQueueTimeout) {
        request.handler.next(
          DioException(
            requestOptions: request.requestOptions,
            type: DioExceptionType.connectionError,
            message: 'Request timed out while waiting for internet.',
          ),
        );
        continue;
      }

      final currentToken = await SecureStorageHelper.readSafe(
        key: SecureStorageHelper.accessToken,
      );

      if (currentToken == null || currentToken.isEmpty) {
        // User logged out while offline — reject queued request
        _logSecurityEvent(
          'OFFLINE_QUEUE_REJECTED',
          request.requestOptions.path,
          'User session expired. Please login again.',
        );
        request.handler.next(
          DioException(
            requestOptions: request.requestOptions,
            type: DioExceptionType.unknown,
            message: 'User session expired. Please login again.',
            error: 'SESSION_EXPIRED',
          ),
        );
        continue;
      }

      try {
        request.requestOptions.extra['isOfflineRetry'] = true;
        final response = await request.sourceDio.fetch(request.requestOptions);
        request.handler.resolve(response);
      } catch (e) {
        if (e is DioException) {
          request.handler.next(e);
        } else {
          request.handler.next(
            DioException(requestOptions: request.requestOptions, error: e),
          );
        }
      }
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // Unified Token Refresh — Single Source of Truth
  // ══════════════════════════════════════════════════════════════════════════

  /// Public entry point for proactive token refresh (e.g. on app resume).
  ///
  /// Uses the same Completer-based locking as the interceptor so that only
  /// ONE refresh request is ever in-flight at a time. Returns the new access
  /// token on success, null on failure.
  static Future<String?> refreshTokenUnified() async {
    _ensureRefreshDioInitialized();

    if (_tokenRefreshCompleter != null) {
      try {
        final token = await _tokenRefreshCompleter!.future.timeout(
          const Duration(seconds: 15),
        );
        debugPrint(
          '[DioFactory] Proactive refresh: piggy-backed on in-flight refresh',
        );
        return token;
      } catch (_) {
        return null;
      }
    }

    _tokenRefreshCompleter = Completer<String>();
    // Suppress "unhandled async error" when completeError fires with no
    // concurrent waiters — concurrent callers still get it via their own
    // await + try-catch on the same future.
    _tokenRefreshCompleter!.future.ignore();

    try {
      final refreshTokenStr = await SecureStorageHelper.readSafe(
        key: SecureStorageHelper.refreshToken,
      );
      if (refreshTokenStr == null || refreshTokenStr.isEmpty) {
        _tokenRefreshCompleter!.completeError('No refresh token');
        _tokenRefreshCompleter = null;
        return null;
      }

      // auth.md: X-Device-Id is still required on /auth/refresh and must
      // match the refresh token's device; no Authorization header is sent.
      final deviceId = await DeviceIdentityService.getOrCreateDeviceId();
      final refreshResponse = await _refreshDio!.post(
        ApiConstants.refreshToken,
        data: {'refreshToken': refreshTokenStr},
        options: Options(headers: {'X-Device-Id': deviceId}),
      );

      if (refreshResponse.statusCode == 200 &&
          refreshResponse.data is Map<String, dynamic>) {
        final data = refreshResponse.data as Map<String, dynamic>;
        final newAccessToken = data['data']?['accessToken']?.toString();
        final newRefreshToken = data['data']?['refreshToken']?.toString();
        final expiresIn = data['data']?['expiresIn'];
        final refreshExpiresIn = data['data']?['refreshExpiresIn'];

        if (newAccessToken != null && newAccessToken.isNotEmpty) {
          if (newRefreshToken != null && newRefreshToken.isNotEmpty) {
            await SecureStorageHelper.save(
              key: SecureStorageHelper.refreshToken,
              value: newRefreshToken,
            );
          }

          await SecureStorageHelper.save(
            key: SecureStorageHelper.accessToken,
            value: newAccessToken,
          );

          if (expiresIn is int) {
            final now = DateTime.now();
            await SecureStorageHelper.save(
              key: SecureStorageHelper.accessTokenExpiresAt,
              value: now.add(Duration(seconds: expiresIn)).toIso8601String(),
            );
            await SecureStorageHelper.save(
              key: SecureStorageHelper.refreshTokenExpiresAt,
              value: now
                  .add(
                    Duration(
                      seconds: refreshExpiresIn is int
                          ? refreshExpiresIn
                          : 604800, // 7 days, matches auth.md's example
                    ),
                  )
                  .toIso8601String(),
            );
          }

          _tokenRefreshCompleter!.complete(newAccessToken);
          _tokenRefreshCompleter = null;

          debugPrint('[DioFactory] Unified token refresh successful');
          return newAccessToken;
        }
      }

      _tokenRefreshCompleter!.completeError('Refresh failed');
      _tokenRefreshCompleter = null;
      return null;
    } catch (e) {
      // 429: server-declared rate limit on the refresh endpoint (10/2min).
      // Surface it through the same RateLimiter the rest of the app uses so
      // the UI has one consistent countdown source.
      if (e is DioException && e.response?.statusCode == 429) {
        final retryAfterHeader = e.response?.headers.value('Retry-After');
        final retryAfterSeconds = int.tryParse(retryAfterHeader ?? '') ?? 60;
        _logSecurityEvent(
          'REFRESH_RATE_LIMITED',
          ApiConstants.refreshToken,
          'Rate limited — retry after ${retryAfterSeconds}s',
        );
      }

      final isNetworkError =
          e is DioException &&
          (e.type == DioExceptionType.connectionError ||
              e.type == DioExceptionType.connectionTimeout ||
              e.type == DioExceptionType.sendTimeout ||
              e.type == DioExceptionType.receiveTimeout);

      // 401 from /auth/refresh means the refresh token itself is invalid,
      // revoked, or reused (auth.md: AUTH_INVALID_REFRESH_TOKEN /
      // AUTH_INVALID_TOKEN_TYPE / DEVICE_ID_MISMATCH / AUTH_INVALID_CREDENTIALS
      // — reuse specifically terminates every session on every device).
      // Clear local tokens so the caller recognises this as an auth failure.
      final isAuthFailure =
          e is DioException &&
          (e.response?.statusCode == 401 || e.response?.statusCode == 403);

      if (isAuthFailure) {
        final code = _extractErrorCode(e.response);
        if (code == 'AUTH_INVALID_REFRESH_TOKEN') {
          _logSecurityEvent(
            'REFRESH_TOKEN_REUSE_DETECTED',
            ApiConstants.refreshToken,
            'Server reports refresh-token reuse — all sessions terminated',
          );
        }
        try {
          await SecureStorageHelper.delete(
            key: SecureStorageHelper.refreshToken,
          );
          await SecureStorageHelper.delete(
            key: SecureStorageHelper.accessToken,
          );
        } catch (_) {}
      }

      _logSecurityEvent(
        isNetworkError ? 'TOKEN_REFRESH_NETWORK_ERROR' : 'TOKEN_REFRESH_ERROR',
        'refresh_endpoint',
        'Unified refresh failed: $e',
      );

      try {
        _tokenRefreshCompleter!.completeError(e);
      } catch (_) {} // Completer may already be completed
      _tokenRefreshCompleter = null;
      return null;
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // Common Interceptor Logic (DRY Principle - Single Source of Truth)
  // ══════════════════════════════════════════════════════════════════════════

  /// Creates a reusable InterceptorsWrapper with full auth & error handling.
  /// Shared by [getAuthDio] and [getAppDio] so future modules automatically
  /// inherit the same token-refresh, offline-queue and security behaviour.
  static InterceptorsWrapper createCommonInterceptor(Dio targetDio) {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        // X-Device-Id is mandatory on every protected route, and harmless to
        // send on public ones (auth.md §2). Always attach it.
        final deviceId = await DeviceIdentityService.getOrCreateDeviceId();
        options.headers['X-Device-Id'] = deviceId;

        final isPublicOrRefresh = _noAuthHeaderEndpoints.contains(
          options.path,
        );
        if (!isPublicOrRefresh) {
          final token = await SecureStorageHelper.readSafe(
            key: SecureStorageHelper.accessToken,
          );
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
        }

        await _addReplayProtectionHeaders(options);
        return handler.next(options);
      },
      onError: (DioException error, handler) async {
        // ── No internet: queue the request and retry on reconnect ──────────
        // Suspended — see `FeatureFlags.offlineSyncEnabled`. With the queue
        // off, a connection error must propagate immediately: parking the
        // handler here is what makes a request hang for up to three minutes
        // waiting for a reconnect that nothing is now listening for.
        if (error.type == DioExceptionType.connectionError &&
            FeatureFlags.offlineSyncEnabled) {
          if (error.requestOptions.extra['isOfflineRetry'] == true) {
            return handler.next(error);
          }
          _enqueueOfflineRequest(error, handler, targetDio);
          return; // hold the handler — do NOT call next() yet
        }

        // 403 is **never** a reason to log out.
        //
        // This used to clear the tokens and bounce to the login screen for
        // any 403 on a protected route, which was a category error: 401
        // means "I don't know who you are", 403 means "I know exactly who
        // you are, and you may not do this". The session is valid in every
        // 403 this API produces.
        //
        // Concretely, it was throwing reps out of the app for ordinary
        // business refusals — registering a building outside their
        // territory (`PROJECT_OUTSIDE_OWN_TERRITORY`), confirming their own
        // outcome (`PROJECT_OUTCOME_SELF_CONFIRMATION`), or touching a
        // manager-only route. Those must surface as a message on the screen
        // that asked, which is what passing the error through does.
        //
        // The one 403 family that needs *routing* rather than a message is
        // the scope lockdown, and even the docs are explicit there: "Do not
        // log out." Its richer fields are stripped by the server's global
        // filter, so `message` is the only signal available.
        if (error.response?.statusCode == 403) {
          final message =
              (error.response?.data is Map
                      ? (error.response!.data as Map)['message']
                      : null)
                  as String? ??
              '';
          if (message.contains('must change your temporary password')) {
            _navigateToChangePassword();
          }
          return handler.next(error);
        }

        if (error.response?.statusCode != 401) {
          return handler.next(error);
        }

        final requestPath = error.response?.requestOptions.path;

        // Bypass refresh/public endpoints — 401 there means bad credentials
        // or an invalid refresh token, not an expired access token.
        if (_noAuthHeaderEndpoints.contains(requestPath)) {
          return handler.next(error);
        }

        // TOKEN_REUSE_DETECTED-style errors are handled inside
        // refreshTokenUnified() when it calls /auth/refresh directly; a 401
        // reaching here is always "this access token needs refreshing".

        if (_tokenRefreshCompleter != null) {
          try {
            final newAccessToken = await _tokenRefreshCompleter!.future.timeout(
              const Duration(seconds: 15),
            );

            if (error.requestOptions.data is FormData) {
              return _rejectStreamConsumed(error, handler);
            }

            error.requestOptions.headers['Authorization'] =
                'Bearer $newAccessToken';
            final retryResponse = await targetDio.fetch(error.requestOptions);
            return handler.resolve(retryResponse);
          } on TimeoutException catch (_) {
            // Refresh token timeout — transient, don't force logout.
            _logSecurityEvent(
              'TOKEN_REFRESH_TIMEOUT',
              error.response?.requestOptions.path ?? 'unknown',
              'Token refresh timed out after 15 seconds',
            );
            return handler.next(error);
          } catch (e) {
            final isNetworkError =
                e is DioException &&
                (e.type == DioExceptionType.connectionError ||
                    e.type == DioExceptionType.connectionTimeout ||
                    e.type == DioExceptionType.sendTimeout ||
                    e.type == DioExceptionType.receiveTimeout);
            if (!isNetworkError) {
              await _clearAuthTokens();
              _navigateToLogin();
            }
            _logSecurityEvent(
              'TOKEN_REFRESH_FAILED',
              error.response?.requestOptions.path ?? 'unknown',
              'Failed to refresh token: $e',
            );
            return handler.next(error);
          }
        }

        // ── Another refresh path (e.g. proactive refresh) may have already
        // rotated the token — compare and retry with the current one first.
        final failedToken = error.requestOptions.headers['Authorization']
            ?.toString()
            .replaceFirst('Bearer ', '');
        final currentStoredToken = await SecureStorageHelper.readSafe(
          key: SecureStorageHelper.accessToken,
        );
        if (currentStoredToken != null &&
            currentStoredToken.isNotEmpty &&
            failedToken != null &&
            currentStoredToken != failedToken) {
          if (error.requestOptions.data is FormData) {
            return _rejectStreamConsumed(error, handler);
          }
          try {
            error.requestOptions.headers['Authorization'] =
                'Bearer $currentStoredToken';
            final retryResponse = await targetDio.fetch(error.requestOptions);
            return handler.resolve(retryResponse);
          } catch (retryError) {
            if (retryError is DioException &&
                retryError.response?.statusCode == 401) {
              // Token in storage is also invalid, proceed with refresh below.
            } else {
              return handler.next(
                retryError is DioException
                    ? retryError
                    : DioException(
                        requestOptions: error.requestOptions,
                        error: retryError,
                      ),
              );
            }
          }
        }

        // ── Token refresh — delegate to unified refresh method ─────────────
        final newAccessToken = await refreshTokenUnified();

        if (newAccessToken == null) {
          final tokenGone = await SecureStorageHelper.readSafe(
            key: SecureStorageHelper.refreshToken,
          );
          if (tokenGone == null || tokenGone.isEmpty) {
            _navigateToLogin();
          }
          return handler.next(error);
        }

        if (error.requestOptions.data is FormData) {
          return _rejectStreamConsumed(error, handler);
        }

        error.requestOptions.headers['Authorization'] =
            'Bearer $newAccessToken';
        final retryResponse = await targetDio.fetch(error.requestOptions);
        return handler.resolve(retryResponse);
      },
    );
  }

  /// CRITICAL: a consumed FormData/MultipartFile stream cannot be retried —
  /// reject with a clear "retry needed" error instead of silently failing.
  static void _rejectStreamConsumed(
    DioException error,
    ErrorInterceptorHandler handler,
  ) {
    _logSecurityEvent(
      'REQUEST_STREAM_CONSUMED',
      error.response?.requestOptions.path ?? 'unknown',
      'MultipartFile stream already consumed. User must retry upload.',
    );
    handler.reject(
      DioException(
        requestOptions: error.requestOptions,
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: error.requestOptions,
          statusCode: 401,
          data: {
            'success': false,
            'message': 'Session refreshed. Please try uploading again.',
            'error': {'code': 'UPLOAD_RETRY_NEEDED', 'statusCode': 401},
          },
        ),
      ),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // Helpers
  // ══════════════════════════════════════════════════════════════════════════

  /// Extract error code from an error response envelope's `error.code`.
  static String? _extractErrorCode(Response? response) {
    try {
      if (response?.data is Map<String, dynamic>) {
        final data = response!.data as Map<String, dynamic>;
        if (data['error'] is Map<String, dynamic>) {
          final errorData = data['error'] as Map<String, dynamic>;
          return errorData['code']?.toString().toUpperCase();
        }
      }
    } catch (_) {}
    return null;
  }

  /// Clear the offline request queue (e.g. before a startup retry).
  ///
  /// Also cancels any in-flight token refresh so a fresh retry doesn't
  /// piggy-back on a Completer that's about to fail. The connectivity
  /// subscription is intentionally preserved — we still want auto-retry
  /// when the network returns.
  static Future<void> clearOfflineQueue() async {
    _offlineQueue.clear();

    if (_tokenRefreshCompleter != null) {
      if (!_tokenRefreshCompleter!.isCompleted) {
        try {
          _tokenRefreshCompleter!.completeError(
            'Cancelled by clearOfflineQueue',
          );
        } catch (_) {}
      }
      _tokenRefreshCompleter = null;
    }
  }

  /// Clear auth tokens for security violations (403, refresh-token reuse,
  /// etc). Mirrors AuthService.logout()'s token cleanup so a security-
  /// triggered forced logout leaves no residual sensitive state. Does NOT
  /// clear `deviceId` — that's a stable per-installation fingerprint, not a
  /// session credential.
  static Future<void> _clearAuthTokens() async {
    clearOfflineQueue();
    await Future.wait([
      SecureStorageHelper.delete(key: SecureStorageHelper.accessToken),
      SecureStorageHelper.delete(key: SecureStorageHelper.refreshToken),
      SecureStorageHelper.delete(key: SecureStorageHelper.accessTokenExpiresAt),
      SecureStorageHelper.delete(
        key: SecureStorageHelper.refreshTokenExpiresAt,
      ),
    ]);
  }

  /// Navigate to login screen when security error occurs
  static void _navigateToLogin() {
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      Routes.loginScreen,
      (route) => false,
    );
  }

  /// A provisioned account is locked to `/users/me/password` and `/logout`
  /// until its temporary password is changed — every other route answers
  /// 403. Pushed rather than replacing the stack, and **without** clearing
  /// tokens: the session is valid, it just cannot go anywhere else yet.
  static bool _changePasswordRouteOpen = false;

  static void _navigateToChangePassword() {
    final navigator = navigatorKey.currentState;
    if (navigator == null || _changePasswordRouteOpen) return;
    // A locked-down account 403s on *every* route, so a screen firing three
    // parallel requests would otherwise stack three copies of this screen.
    // A flag rather than inspecting the route stack: `ModalRoute.of` on the
    // navigator's own context resolves the route the Navigator sits in, not
    // the one on top of it, so it cannot answer this question.
    _changePasswordRouteOpen = true;
    navigator
        .pushNamed(Routes.changePasswordScreen)
        .whenComplete(() => _changePasswordRouteOpen = false);
  }

  /// Log security events for audit trail (token reuse, offline queue rejection, etc.)
  ///
  /// Always logs — not gated by kDebugMode. Security events must be visible
  /// in production device logs (captured by crash reporters).
  /// TODO: send to a real security-monitoring backend instead of print().
  static void _logSecurityEvent(String event, String endpoint, String details) {
    // ignore: avoid_print — security events must always reach device logs.
    print('[SECURITY] event=$event endpoint=$endpoint details=$details');
  }
}

// ─── Data classes ──────────────────────────────────────────────────────────

class _OfflineRequest {
  final RequestOptions requestOptions;
  final ErrorInterceptorHandler handler;
  final DateTime enqueuedAt;
  final Dio sourceDio;

  _OfflineRequest({
    required this.requestOptions,
    required this.handler,
    required this.sourceDio,
    required this.enqueuedAt,
  });
}
