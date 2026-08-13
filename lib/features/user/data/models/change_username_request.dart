import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_username_request.freezed.dart';
part 'change_username_request.g.dart';

/// users.md `PATCH /users/me/username` — **one-time only, permanent.**
///
/// A username is auto-generated at registration; this spends the single
/// replacement. `usernameChangedAt` on `GET /auth/me` is how the client
/// knows whether it's already been used (the doc says to check it before
/// offering the option at all), so the UI hides the action rather than
/// letting a rep discover it's gone by being rejected.
@freezed
abstract class ChangeUsernameRequest with _$ChangeUsernameRequest {
  const factory ChangeUsernameRequest({required String username}) =
      _ChangeUsernameRequest;

  factory ChangeUsernameRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangeUsernameRequestFromJson(json);
}

/// The exact reserved list from users.md. Rejected server-side with Nest's
/// default `Bad Request` code (not `VALIDATION_ERROR`) because the check
/// runs in the service, after the DTO — so it's worth catching here first
/// to give a precise message instead of a generic one.
const _reservedUsernames = {
  'admin', 'superadmin', 'system', 'root', 'administrator', 'user',
  'support', 'help', 'info', 'contact', 'official', 'verified', 'staff',
  'moderator', 'mod', 'test', 'null', 'undefined', 'delete', 'api',
};

/// `^(user|test|account)\d+$` — the doc's blocked-pattern rule.
final _blockedUsernamePattern = RegExp(r'^(user|test|account)\d+$');

extension ChangeUsernameRequestValidation on ChangeUsernameRequest {
  void validate() {
    final trimmed = username.trim();
    if (trimmed.length < 6 || trimmed.length > 30) {
      throw ArgumentError('username must be 6-30 characters');
    }
    if (!RegExp(r'^[a-z0-9]+$').hasMatch(trimmed)) {
      throw ArgumentError('username must be lowercase letters and digits only');
    }
    if (_reservedUsernames.contains(trimmed)) {
      throw ArgumentError('username is reserved');
    }
    if (_blockedUsernamePattern.hasMatch(trimmed)) {
      throw ArgumentError('username pattern is not allowed');
    }
  }
}
