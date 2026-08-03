class Routes {
  // Startup
  static const String startupError = '/startup-error';

  // Onboarding
  static const String onboardingScreen = '/onboarding';

  // Auth Routes
  static const String loginScreen = '/login';
  static const String registerScreen = '/register';
  static const String forgotPasswordScreen = '/forgotPassword';
  static const String resetPasswordScreen = '/resetPassword';
  // Single screen for email verification, device verification and 2FA —
  // auth.md: one endpoint (/auth/verify-otp) serves all three flows.
  static const String verifyOtpScreen = '/verifyOtp';

  // Home — tabbed shell (Home, Projects, Notifications, Profile)
  static const String homeScreen = '/home';
}
