// ignore_for_file: override_on_non_overriding_member
// lib/features/auth/data/models/verify_otp_response.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import 'login_response.dart';

part 'verify_otp_response.freezed.dart';
part 'verify_otp_response.g.dart';

/// POST /auth/verify-otp response — auth.md: "both answer with the same
/// envelope" as login, so `data` reuses [LoginData] rather than a duplicate
/// class.
@freezed
abstract class VerifyOtpResponse with _$VerifyOtpResponse {
  const factory VerifyOtpResponse({
    required LoginData data,
    required String message,
  }) = _VerifyOtpResponse;

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpResponseFromJson(json);
}
