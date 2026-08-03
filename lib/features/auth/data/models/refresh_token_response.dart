import 'package:freezed_annotation/freezed_annotation.dart';
import 'login_response.dart';

part 'refresh_token_response.freezed.dart';
part 'refresh_token_response.g.dart';

/// POST /auth/refresh response — same `Tokens` shape as login/verify-otp
/// (no `role` field here, unlike login), so `data` reuses [LoginTokens]
/// instead of a duplicate class.
@freezed
abstract class RefreshTokenResponse with _$RefreshTokenResponse {
  const factory RefreshTokenResponse({
    required LoginTokens data,
    required String message,
  }) = _RefreshTokenResponse;

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseFromJson(json);
}
