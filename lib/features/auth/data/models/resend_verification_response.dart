import 'package:freezed_annotation/freezed_annotation.dart';

part 'resend_verification_response.freezed.dart';
part 'resend_verification_response.g.dart';

@freezed
abstract class ResendVerificationResponse with _$ResendVerificationResponse {
  const factory ResendVerificationResponse({
    required bool success,
    required String message,
  }) = _ResendVerificationResponse;

  factory ResendVerificationResponse.fromJson(Map<String, dynamic> json) =>
      _$ResendVerificationResponseFromJson(json);
}
