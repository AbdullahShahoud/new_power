// ignore_for_file: override_on_non_overriding_member

import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_token_request.freezed.dart';
part 'refresh_token_request.g.dart';

@Freezed(toStringOverride: false)
abstract class RefreshTokenRequest with _$RefreshTokenRequest {
  const factory RefreshTokenRequest({required String refreshToken}) =
      _RefreshTokenRequest;

  factory RefreshTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenRequestFromJson(json);

  @override
  String toString() => 'RefreshTokenRequest(refreshToken: ***HIDDEN***)';
}

/// Extension to validate RefreshTokenRequest data
extension RefreshTokenRequestValidation on RefreshTokenRequest {
  /// auth.md only requires `refreshToken` to be non-empty — the server is
  /// the sole authority on whether it's a live, non-rotated token.
  /// Throws ArgumentError if validation fails
  void validate() {
    if (refreshToken.trim().isEmpty) {
      throw ArgumentError('refreshToken cannot be empty');
    }
  }
}
