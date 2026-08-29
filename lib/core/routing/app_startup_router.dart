import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../di/dependency_injection.dart';
import '../helpers/cache_helper.dart';
import '../services/auth_service.dart';
import '../theming/brand_manager.dart';
import 'routes.dart';

/// Generic reasons [AppStartupRouter.resolve] can fail to determine a route.
/// Not auth-specific — any future startup dependency (e.g. a remote config
/// fetch) reports through the same enum so [StartupErrorScreen] doesn't need
/// per-module variants.
enum StartupFailureReason {
  /// No network connectivity at all.
  noInternet,

  /// The network is reachable but the backend itself is erroring/down.
  serverDown,

  /// A startup dependency threw an unexpected exception.
  initializationFailed,

  /// Anything that doesn't fit the above.
  unknown,
}

/// Encapsulates all app-startup routing decisions. Call [resolve] once
/// after DI/CacheHelper init to get the first route.
class AppStartupRouter {
  const AppStartupRouter._();

  static const String startupErrorRoute = Routes.startupError;

  /// Reason for the most recent failure that routed to [Routes.startupError].
  /// Cleared when the user retries successfully. [StartupErrorScreen] reads
  /// this to pick the right localized message.
  static StartupFailureReason? lastFailureReason;

  static Future<String> resolve() async {
    try {
      // Ahead of everything, including the session check. The brand decides
      // the accent every later screen is painted in and the logo on the
      // login form — resolving a session first would mean the rep's very
      // first frame is branded as somebody else's product line.
      //
      // Answered once per install and then never routed to again, so this
      // costs one synchronous preference read on every later launch.
      if (!getIt<BrandManager>().hasSelection) {
        debugPrint('[AppStartupRouter] No brand chosen — picker');
        return Routes.brandSelection;
      }

      final authService = getIt<AuthService>();
      final hasRefreshToken = await authService.hasRefreshToken();

      if (!hasRefreshToken) {
        final hasSeenOnboarding =
            CacheHelper.getData(key: CacheHelper.onBoarding) ?? false;
        if (!hasSeenOnboarding) {
          debugPrint('[AppStartupRouter] First-time user — onboarding');
          return Routes.onboardingScreen;
        }
        debugPrint(
          '[AppStartupRouter] Returning user without a session — login',
        );
        return Routes.loginScreen;
      }

      final sessionValid = await _tryRestoreSession(authService);
      if (!sessionValid) {
        if (AuthService.wasTokenExpired()) {
          debugPrint('[AppStartupRouter] Token expired during refresh — login');
          AuthService.clearTokenExpiredFlag();
          return Routes.loginScreen;
        }
        // Not an auth failure — couldn't even reach the server. Let the
        // caught exception in _tryRestoreSession have already classified it.
        return Routes.startupError;
      }

      debugPrint('[AppStartupRouter] Session restored — home');
      lastFailureReason = null;
      return Routes.homeScreen;
    } catch (e) {
      debugPrint('[AppStartupRouter] Unexpected startup error: $e');
      lastFailureReason = StartupFailureReason.initializationFailed;
      return Routes.startupError;
    }
  }

  /// Attempt to restore the session by refreshing the access token.
  ///
  /// Returns `true` when the session was successfully refreshed. Returns
  /// `false` when refresh fails — either because the refresh token itself is
  /// invalid/expired (an auth failure, [AuthService.wasTokenExpired] will be
  /// true) or because of a network/server problem ([lastFailureReason] is set
  /// accordingly for the retry screen).
  static Future<bool> _tryRestoreSession(AuthService authService) async {
    try {
      final accessTokenExpired = await AuthService.isAccessTokenExpired();
      if (!accessTokenExpired) {
        debugPrint(
          '[AppStartupRouter] Access token still valid — skipping refresh',
        );
        return true;
      }

      final refreshed = await authService.refreshAccessToken();
      if (!refreshed && !AuthService.wasTokenExpired()) {
        // Refresh failed for a reason other than an invalid/expired token —
        // classify it for the retry screen.
        lastFailureReason = StartupFailureReason.unknown;
      }
      return refreshed;
    } on DioException catch (e) {
      final isNetworkError =
          e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout;
      lastFailureReason = isNetworkError
          ? StartupFailureReason.noInternet
          : StartupFailureReason.serverDown;
      debugPrint('[AppStartupRouter] Session restore network error: $e');
      return false;
    } catch (e) {
      debugPrint('[AppStartupRouter] Critical error restoring session: $e');
      lastFailureReason = StartupFailureReason.initializationFailed;
      return false;
    }
  }
}
