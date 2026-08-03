import 'package:flutter/material.dart';
import 'package:new_power/core/routing/routes.dart';

import '../../features/auth/ui/screens/email_verification_screen.dart';
import '../../features/auth/ui/screens/forgot_password_screen.dart';
import '../../features/auth/ui/screens/login_screen.dart';
import '../../features/auth/ui/screens/register_screen.dart';
import '../../features/auth/ui/screens/reset_password_screen.dart';
import '../../features/home/ui/main_screen.dart';
import '../../features/onboarding/ui/onboarding_screen.dart';
import '../widget/startup_error_screen.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.startupError:
        return _fadeRoute(const StartupErrorScreen(), settings);
      case Routes.onboardingScreen:
        return _fadeRoute(const OnboardingScreen(), settings);
      // ========================== Auth Routes ==========================
      case Routes.loginScreen:
        return _slideRoute(const LoginScreen(), settings);
      case Routes.registerScreen:
        return _slideRoute(const RegisterScreen(), settings);
      case Routes.forgotPasswordScreen:
        bool fromChangePassword = false;
        if (settings.arguments is Map) {
          final args = settings.arguments as Map;
          fromChangePassword = args['fromChangePassword'] as bool? ?? false;
        }
        return _slideRoute(
          ForgotPasswordScreen(fromChangePassword: fromChangePassword),
          settings,
        );
      case Routes.resetPasswordScreen:
        return _slideRoute(const ResetPasswordScreen(), settings);
      case Routes.verifyOtpScreen:
        return _slideRoute(const EmailVerificationScreen(), settings);
      // ========================== Home ===================================
      case Routes.homeScreen:
        return _fadeRoute(const MainScreen(), settings);
      default:
        return null;
    }
  }

  /// ✅ Slide + fade from right (smooth and natural motion)
  /// - Soft slide: 0.08 offset (not dramatic, just noticeable)
  /// - Soft fade: opacity follows animation curve
  /// - Duration: 250ms forward, 220ms reverse
  static PageRouteBuilder _slideRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: const Duration(milliseconds: 280),
      reverseTransitionDuration: const Duration(milliseconds: 240),
      pageBuilder: (context, animation, _) => page,
      transitionsBuilder: (context, animation, _, child) {
        final slideAnimation =
            Tween<Offset>(
              begin: const Offset(0.15, 0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
            );

        final scaleAnimation = Tween<double>(begin: 0.97, end: 1.0).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
        );

        return ScaleTransition(
          scale: scaleAnimation,
          child: SlideTransition(
            position: slideAnimation,
            child: FadeTransition(opacity: animation, child: child),
          ),
        );
      },
    );
  }

  /// Fade transition (for top-level screens like home, onboarding)
  static PageRouteBuilder _fadeRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: const Duration(milliseconds: 400),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurvedAnimation(parent: animation, curve: Curves.easeIn),
          child: child,
        );
      },
    );
  }
}
