import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_request.freezed.dart';
part 'change_password_request.g.dart';

/// users.md `PUT /users/me/password`.
///
/// `logoutOtherSessions` defaults to `true` server-side; sent explicitly so
/// the choice is visible in the request rather than implied. When true, every
/// other session's access **and** refresh tokens are blacklisted — the
/// current device stays signed in.
@freezed
abstract class ChangePasswordRequest with _$ChangePasswordRequest {
  const factory ChangePasswordRequest({
    required String currentPassword,
    required String newPassword,
    @Default(true) bool logoutOtherSessions,
  }) = _ChangePasswordRequest;

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestFromJson(json);
}

extension ChangePasswordRequestValidation on ChangePasswordRequest {
  /// Mirrors the documented complexity rule (8–128, lower + upper + digit +
  /// special) so an obviously-bad password fails before a round trip. The
  /// server remains authoritative — `USER_SAME_PASSWORD` and
  /// `USER_INCORRECT_PASSWORD` can only be decided there.
  void validate() {
    if (currentPassword.isEmpty) {
      throw ArgumentError('currentPassword cannot be empty');
    }
    if (newPassword.length < 8 || newPassword.length > 128) {
      throw ArgumentError('newPassword must be 8-128 characters');
    }
    if (!newPassword.contains(RegExp(r'[a-z]')) ||
        !newPassword.contains(RegExp(r'[A-Z]')) ||
        !newPassword.contains(RegExp(r'[0-9]')) ||
        !newPassword.contains(RegExp(r'[^a-zA-Z0-9]'))) {
      throw ArgumentError(
        'newPassword must contain lowercase, uppercase, a digit and a symbol',
      );
    }
  }
}
