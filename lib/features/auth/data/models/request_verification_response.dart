import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_verification_response.freezed.dart';
part 'request_verification_response.g.dart';

@freezed
abstract class RequestVerificationResponse with _$RequestVerificationResponse {
  const factory RequestVerificationResponse({
    required bool success,
    required String message,
  }) = _RequestVerificationResponse;

  factory RequestVerificationResponse.fromJson(Map<String, dynamic> json) =>
      _$RequestVerificationResponseFromJson(json);
}
