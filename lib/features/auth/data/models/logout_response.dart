import 'forgot_password_response.dart' show ForgotPasswordResponse;

/// POST /auth/logout response — auth.md: `{ message: "Logout successful",
/// data: null }`, the same message-only shape as [ForgotPasswordResponse].
/// Reused via typedef instead of a duplicate freezed class.
typedef LogoutResponse = ForgotPasswordResponse;
