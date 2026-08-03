// ignore_for_file: override_on_non_overriding_member

import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_request.freezed.dart';
part 'logout_request.g.dart';

/// POST /auth/logout — `refreshToken` is optional (auth.md: "Omit it and
/// only the access token is revoked"; an empty body `{}` is valid).
@Freezed(toStringOverride: false)
abstract class LogoutRequest with _$LogoutRequest {
  const factory LogoutRequest({String? refreshToken}) = _LogoutRequest;

  factory LogoutRequest.fromJson(Map<String, dynamic> json) =>
      _$LogoutRequestFromJson(json);

  @override
  String toString() => 'LogoutRequest(refreshToken: ***HIDDEN***)';
}

/// Extension to validate LogoutRequest data
extension LogoutRequestValidation on LogoutRequest {
  /// auth.md: refreshToken, when present, must be 10-2048 chars.
  /// Throws ArgumentError if validation fails
  void validate() {
    final token = refreshToken;
    if (token == null) return;
    if (token.length < 10 || token.length > 2048) {
      throw ArgumentError('refreshToken must be 10-2048 characters');
    }
  }
}
