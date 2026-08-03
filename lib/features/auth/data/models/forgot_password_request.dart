// lib/features/auth/data/models/forgot_password_request.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/helpers/validators.dart';

part 'forgot_password_request.freezed.dart';
part 'forgot_password_request.g.dart';

@freezed
abstract class ForgotPasswordRequest with _$ForgotPasswordRequest {
  const factory ForgotPasswordRequest({required String email}) =
      _ForgotPasswordRequest;

  factory ForgotPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordRequestFromJson(json);
}

/// Extension to validate ForgotPasswordRequest data
extension ForgotPasswordRequestValidation on ForgotPasswordRequest {
  /// Validates all required fields are not empty before transmission
  /// Throws ArgumentError if validation fails
  void validate() {
    if (email.trim().isEmpty) {
      throw ArgumentError('email cannot be empty');
    }
    if (!AppValidators.emailRegex.hasMatch(email)) {
      throw ArgumentError('email must be a valid email address');
    }
  }

  /// Secure string representation (email is not sensitive in this context)
  String toSecureString() => 'ForgotPasswordRequest(email: $email)';
}
