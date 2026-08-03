// ignore_for_file: override_on_non_overriding_member

import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_verification_request.freezed.dart';
part 'request_verification_request.g.dart';

/// Request to get verification challenge for email/password verification
/// ⚠️ SENSITIVE: verificationId is a secret authentication token
@Freezed(toStringOverride: false)
abstract class RequestVerificationRequest with _$RequestVerificationRequest {
  const factory RequestVerificationRequest({required String verificationId}) =
      _RequestVerificationRequest;

  factory RequestVerificationRequest.fromJson(Map<String, dynamic> json) =>
      _$RequestVerificationRequestFromJson(json);

  @override
  String toString() =>
      'RequestVerificationRequest(verificationId: ***HIDDEN***)';
}

extension RequestVerificationRequestValidation on RequestVerificationRequest {
  /// Validates verification ID before transmission
  /// Throws ArgumentError if validation fails
  void validate() {
    if (verificationId.trim().isEmpty) {
      throw ArgumentError('verificationId cannot be empty');
    }
    if (verificationId.length < 10) {
      throw ArgumentError('verificationId is invalid');
    }
  }
}
