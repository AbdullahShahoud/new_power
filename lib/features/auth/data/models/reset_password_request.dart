// ignore_for_file: override_on_non_overriding_member

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/helpers/validators.dart';

part 'reset_password_request.freezed.dart';
part 'reset_password_request.g.dart';

@Freezed(toStringOverride: false)
abstract class ResetPasswordRequest with _$ResetPasswordRequest {
  const factory ResetPasswordRequest({
    required String code,
    required String email,
    required String newPassword,
  }) = _ResetPasswordRequest;

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestFromJson(json);

  @override
  String toString() =>
      'ResetPasswordRequest(code: ***HIDDEN***, email: $email, newPassword: ***HIDDEN***)';
}

/// Extension to validate ResetPasswordRequest data
extension ResetPasswordRequestValidation on ResetPasswordRequest {
  /// Validates all required fields with robust format checks before transmission
  /// Throws ArgumentError if validation fails
  void validate() {
    // Code validation — auth.md: 6-20 chars, uppercase letters + digits only
    // (distinct alphabet from the numeric-only OTP used elsewhere).
    final codeTrimmed = code.trim();
    if (codeTrimmed.isEmpty) {
      throw ArgumentError('code cannot be empty');
    }
    if (!AppValidators.resetCodeRegex.hasMatch(codeTrimmed)) {
      throw ArgumentError(
        'code must be 6-20 uppercase letters/digits',
      );
    }
    // Email validation
    final emailTrimmed = email.trim();
    if (emailTrimmed.isEmpty) {
      throw ArgumentError('email cannot be empty');
    }
    if (!AppValidators.emailRegex.hasMatch(emailTrimmed)) {
      throw ArgumentError('email must be a valid email address');
    }

    // New password validation — same complexity rule as registration, 8-128 chars.
    if (newPassword.isEmpty) {
      throw ArgumentError('newPassword cannot be empty');
    }
    if (newPassword.length < 8) {
      throw ArgumentError('newPassword must be at least 8 characters');
    }
    if (newPassword.length > 128) {
      throw ArgumentError('newPassword cannot exceed 128 characters');
    }
    if (!newPassword.contains(RegExp(r'[A-Z]'))) {
      throw ArgumentError(
        'newPassword must contain at least one uppercase letter',
      );
    }
    if (!newPassword.contains(RegExp(r'[a-z]'))) {
      throw ArgumentError(
        'newPassword must contain at least one lowercase letter',
      );
    }
    if (!newPassword.contains(RegExp(r'[0-9]'))) {
      throw ArgumentError('newPassword must contain at least one digit');
    }
    if (!newPassword.contains(AppValidators.passwordSpecialCharRegex)) {
      throw ArgumentError(
        'newPassword must contain at least one special character',
      );
    }
  }
}
