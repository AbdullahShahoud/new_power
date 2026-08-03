// ignore_for_file: override_on_non_overriding_member

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

/// Named `verificationType` values from auth.md's "unified auth outcome".
/// `/auth/login` and `/auth/verify-otp` both answer with the same envelope
/// ([LoginData]) and branch on this field — kept as plain string constants
/// (not an enum) so an unrecognised future value never crashes JSON parsing.
class VerificationTypes {
  VerificationTypes._();
  static const String loginSuccess = 'LOGIN_SUCCESS';
  static const String setup2fa = 'SETUP_2FA';
  static const String email = 'EMAIL';
  static const String device = 'DEVICE';
  static const String twoFa = '2FA';
  static const String pendingApproval = 'PENDING_APPROVAL';
}

/// Login response wrapper with API envelope
/// Structure: { success, message, data: { ... }, meta: { ... } }
@freezed
abstract class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    bool? success,
    String? message,
    required LoginData data,
    LoginResponseMeta? meta,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

/// The unified auth outcome (auth.md) — also used as the `data` type for
/// `POST /auth/verify-otp` (same envelope, same six `verificationType`
/// values), so this one class covers both endpoints.
/// ⚠️ SENSITIVE: Contains verificationId (authentication secret) and tokens (auth credentials)
@Freezed(toStringOverride: false)
abstract class LoginData with _$LoginData {
  const factory LoginData({
    // See [VerificationTypes] for the six documented values.
    required String verificationType,
    // Present only for EMAIL / DEVICE / 2FA.
    String? verificationId,
    // Full tokens on LOGIN_SUCCESS, limited-scope tokens on SETUP_2FA, null otherwise.
    LoginTokens? tokens,
    // Present only on LOGIN_SUCCESS.
    String? role,
  }) = _LoginData;

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  @override
  String toString() =>
      'LoginData(verificationType: $verificationType, verificationId: "***HIDDEN***", tokens: "***HIDDEN***", role: $role)';
}

/// Token object containing access and refresh tokens with expiry info
/// (auth.md `Tokens` shape). Reused by login, verify-otp and refresh.
/// ⚠️ SENSITIVE: Contains auth credentials
@Freezed(toStringOverride: false)
abstract class LoginTokens with _$LoginTokens {
  const factory LoginTokens({
    required String accessToken,
    required String refreshToken,
    required int expiresIn, // seconds
    int? refreshExpiresIn, // seconds
  }) = _LoginTokens;

  factory LoginTokens.fromJson(Map<String, dynamic> json) =>
      _$LoginTokensFromJson(json);

  @override
  String toString() {
    return "LoginTokens(accessToken: ***HIDDEN***, refreshToken: ***HIDDEN***, expiresIn: $expiresIn, refreshExpiresIn: $refreshExpiresIn)";
  }
}

/// API response metadata
@freezed
abstract class LoginResponseMeta with _$LoginResponseMeta {
  const factory LoginResponseMeta({
    DateTime? timestamp,
    String? path,
    String? correlationId,
  }) = _LoginResponseMeta;

  factory LoginResponseMeta.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseMetaFromJson(json);
}
