import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

/// Mirrors the six `verificationType` outcomes `/auth/login` can answer with
/// (auth.md's "unified auth outcome"). No PIN/biometric app-lock states —
/// that flow doesn't exist in this backend.
@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;

  /// LOGIN_SUCCESS — tokens stored, ready to enter the app.
  const factory LoginState.success({required String? role}) = _Success;

  /// EMAIL / DEVICE — a code was emailed; go to the OTP screen.
  const factory LoginState.otpRequired({required String verificationId}) =
      _OtpRequired;

  /// PENDING_APPROVAL — terminal, nothing to submit until a manager approves.
  const factory LoginState.pendingApproval() = _PendingApproval;

  /// Credentials were valid, but the account isn't a `REPRESENTATIVE` — this
  /// client only serves reps. Terminal: tokens have been wiped, so there is
  /// nothing to retry from here. Not a server outcome; decided client-side
  /// in `LoginCubit._emitOutcome`.
  const factory LoginState.roleNotAllowed() = _RoleNotAllowed;

  /// SETUP_2FA — General-Manager-only, limited-scope tokens issued. Not
  /// actionable from this rep-facing mobile app (see README1.md role table);
  /// shown as an informational message only.
  const factory LoginState.twoFactorSetupRequired() = _TwoFactorSetupRequired;

  /// 2FA — General-Manager-only authenticator challenge. Same scope note.
  const factory LoginState.twoFactorRequired({required String verificationId}) =
      _TwoFactorRequired;

  /// Client-side (debounce) or server-declared (429) rate limit hit.
  const factory LoginState.rateLimited({required int seconds}) = _RateLimited;

  const factory LoginState.error(String error, {String? errorCode}) = _Error;
}
