// lib/features/auth/logic/forgot_password/forgot_password_state.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_state.freezed.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState.initial() = _Initial;

  // Step 1: Send Reset Code
  const factory ForgotPasswordState.sendingCode() = _SendingCode;
  const factory ForgotPasswordState.codeSent({required String message}) =
      _CodeSent;

  // Step 3: Reset Password
  const factory ForgotPasswordState.resettingPassword() = _ResettingPassword;
  const factory ForgotPasswordState.passwordReset({required String message}) =
      _PasswordReset;

  // Rate limited
  const factory ForgotPasswordState.rateLimited({required int seconds}) = _RateLimited;

  // Error
  const factory ForgotPasswordState.error(String message) = _Error;
}
