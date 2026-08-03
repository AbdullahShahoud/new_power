// ignore_for_file: override_on_non_overriding_member

import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_otp_request.freezed.dart';
part 'verify_otp_request.g.dart';

/// POST /auth/verify-otp — one endpoint for three flows (email verification,
/// device verification, 2FA); the server infers which from [verificationId].
@Freezed(toStringOverride: false)
abstract class VerifyOtpRequest with _$VerifyOtpRequest {
  const factory VerifyOtpRequest({
    required String verificationId,
    required String code,
  }) = _VerifyOtpRequest;

  factory VerifyOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpRequestFromJson(json);

  @override
  String toString() =>
      'VerifyOtpRequest(verificationId: ***HIDDEN***, code: ***HIDDEN***)';
}

/// Extension to validate VerifyOtpRequest data
extension VerifyOtpRequestValidation on VerifyOtpRequest {
  /// Validates email/device/2FA verification data with robust format checks
  /// Throws ArgumentError if validation fails
  void validate() {
    if (verificationId.trim().isEmpty) {
      throw ArgumentError('verificationId cannot be empty');
    }
    if (verificationId.length < 10) {
      throw ArgumentError('verificationId is invalid');
    }
    if (code.trim().isEmpty) {
      throw ArgumentError('code cannot be empty');
    }
    if (!RegExp(r'^\d{6}$').hasMatch(code)) {
      throw ArgumentError('code must be exactly 6 digits');
    }
  }
}
