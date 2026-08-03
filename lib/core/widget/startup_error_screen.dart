import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helpers/spacing.dart';
import '../localization/app_localizations.dart';
import '../networking/dio_factory.dart';
import '../routing/app_startup_router.dart';
import '../services/auth_service.dart';
import '../theming/app_colors.dart';
import '../theming/styles.dart';
import '../widget/app_button.dart';

/// Generic app-startup failure screen — shown whenever
/// [AppStartupRouter.resolve] can't determine the initial route. Deliberately
/// not auth-specific: as future modules add their own startup dependencies
/// (e.g. a config fetch), they route here through the same
/// [StartupFailureReason] enum instead of each needing a bespoke error UI.
///
/// The user can tap "Retry" to re-run [AppStartupRouter.resolve] without
/// restarting the app.
class StartupErrorScreen extends StatefulWidget {
  const StartupErrorScreen({super.key});

  @override
  State<StartupErrorScreen> createState() => _StartupErrorScreenState();
}

class _StartupErrorScreenState extends State<StartupErrorScreen> {
  bool _isRetrying = false;
  int _rateLimitSeconds = 0;
  Timer? _countdownTimer;

  @override
  void initState() {
    super.initState();
    _syncRateLimit();
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }

  /// Read the refresh-endpoint rate-limit window (auth.md: 10/2min) and, if
  /// active, start a 1-second countdown. The retry button stays disabled
  /// until it hits zero.
  void _syncRateLimit() {
    final remaining = AuthService.refreshRateLimitRemainingSeconds();
    _countdownTimer?.cancel();
    if (remaining <= 0) {
      if (_rateLimitSeconds != 0) setState(() => _rateLimitSeconds = 0);
      return;
    }
    setState(() => _rateLimitSeconds = remaining);
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) {
        t.cancel();
        return;
      }
      final left = AuthService.refreshRateLimitRemainingSeconds();
      if (left <= 0) {
        t.cancel();
        setState(() => _rateLimitSeconds = 0);
      } else {
        setState(() => _rateLimitSeconds = left);
      }
    });
  }

  Future<void> _retry() async {
    if (_rateLimitSeconds > 0) return; // guard — should already be disabled
    if (_isRetrying) return; // prevent concurrent retries

    setState(() => _isRetrying = true);

    // Discard anything queued from a previous failed attempt and cancel any
    // pending refresh Completer so the new resolve() starts from a clean slate.
    await DioFactory.clearOfflineQueue();

    try {
      final route = await AppStartupRouter.resolve();
      if (!mounted) return;
      if (AuthService.refreshRateLimitRemainingSeconds() > 0) {
        _syncRateLimit();
        return;
      }
      if (route != AppStartupRouter.startupErrorRoute) {
        AppStartupRouter.lastFailureReason = null;
      } else {
        setState(() {});
      }
      Navigator.of(context).pushReplacementNamed(route);
    } catch (_) {
      // resolve() itself threw — stay on this screen so the user can retry.
    } finally {
      if (mounted) {
        setState(() => _isRetrying = false);
        _syncRateLimit();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isRateLimited = _rateLimitSeconds > 0;
    final reason = AppStartupRouter.lastFailureReason;

    final String title;
    final String subtitle;
    final IconData iconData;
    if (isRateLimited) {
      title = context.tr('startup_rate_limited');
      subtitle = context
          .tr('startup_rate_limited_subtitle')
          .replaceFirst('{seconds}', '$_rateLimitSeconds');
      iconData = Icons.hourglass_bottom_rounded;
    } else {
      switch (reason) {
        case StartupFailureReason.serverDown:
          title = context.tr('startup_server_unreachable');
          subtitle = context.tr('startup_server_unreachable_subtitle');
          iconData = Icons.dns_outlined;
          break;
        case StartupFailureReason.initializationFailed:
          title = context.tr('startup_initialization_failed');
          subtitle = context.tr('startup_initialization_failed_subtitle');
          iconData = Icons.error_outline_rounded;
          break;
        case StartupFailureReason.unknown:
          title = context.tr('startup_unknown_error');
          subtitle = context.tr('startup_unknown_error_subtitle');
          iconData = Icons.warning_amber_rounded;
          break;
        case StartupFailureReason.noInternet:
        case null:
          title = context.tr('startup_no_internet');
          subtitle = context.tr('startup_no_internet_subtitle');
          iconData = Icons.wifi_off_rounded;
      }
    }

    return Scaffold(
      backgroundColor: context.colors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Icon(iconData, size: 72.sp, color: context.colors.Color70),
              verticalSpace(28.h),
              Text(
                title,
                style: context.textStyles.lgBold,
                textAlign: TextAlign.center,
              ),
              verticalSpace(12.h),
              Text(
                subtitle,
                style: context.textStyles.smRegular,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              _isRetrying
                  ? Center(
                      child: CircularProgressIndicator(
                        color: context.colors.primary,
                      ),
                    )
                  : AppButton(
                      text: isRateLimited
                          ? '${context.tr('startup_retry')} ($_rateLimitSeconds)'
                          : context.tr('startup_retry'),
                      onPressed: isRateLimited ? null : _retry,
                    ),
              verticalSpace(50.h),
            ],
          ),
        ),
      ),
    );
  }
}
