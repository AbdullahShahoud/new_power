class ApiConstants {
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://gyrostack.cloud/api/v1',
  );

  // ========================== Authentication ==========================
  // Source of truth: auth.md. Registration is closed (requires managerCode);
  // device metadata (deviceId/deviceName/deviceType/deviceModel/osVersion/
  // appVersion) travels flat on register/login bodies — there is no separate
  // device-registration endpoint.
  static const String registerUser = "/auth/register";
  static const String loginUser = "/auth/login";
  static const String verifyOtp = "/auth/verify-otp";
  static const String requestVerification = "/auth/request-verification";
  static const String resendVerification = "/auth/resend-verification";
  static const String refreshToken = "/auth/refresh";
  static const String logoutUser = "/auth/logout";
  static const String me = "/auth/me";
  static const String forgotPassword = "/auth/forgot-password";
  static const String resetPassword = "/auth/reset-password";
}
