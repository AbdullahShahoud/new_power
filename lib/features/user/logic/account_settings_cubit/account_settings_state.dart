import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_settings_state.freezed.dart';

/// Shared by the change-password and change-username screens — both are a
/// single submit with the same shape of outcome, so one state serves both
/// rather than two near-identical unions.
@freezed
class AccountSettingsState with _$AccountSettingsState {
  const factory AccountSettingsState.initial() = _Initial;
  const factory AccountSettingsState.loading() = _Loading;

  /// [message] is the server's own success text where it gave one.
  const factory AccountSettingsState.success({String? message}) = _Success;

  /// `USER_INCORRECT_PASSWORD` — the current password didn't match. Its own
  /// state so the UI can attach the error to the right field instead of a
  /// generic snackbar.
  const factory AccountSettingsState.incorrectPassword() = _IncorrectPassword;

  /// `USER_SAME_PASSWORD` — new password equals the current one.
  const factory AccountSettingsState.samePassword() = _SamePassword;

  /// `USERNAME_ALREADY_EXISTS` (409).
  const factory AccountSettingsState.usernameTaken() = _UsernameTaken;

  /// `USERNAME_ALREADY_CHANGED` — the one-time change is spent. Terminal.
  const factory AccountSettingsState.usernameAlreadyChanged() =
      _UsernameAlreadyChanged;

  /// `RATE_LIMIT_EXCEEDED` — username changes are throttled 3 / 15 min.
  const factory AccountSettingsState.rateLimited({int? retryAfterSeconds}) =
      _RateLimited;

  const factory AccountSettingsState.error(String message) = _Error;
}
