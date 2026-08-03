// lib/features/auth/logic/email_verification_cubit/email_verification_state.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_verification_state.freezed.dart';

/// `/auth/verify-otp` answers with the same six-outcome envelope as login
/// (auth.md), so this mirrors [LoginState]'s outcome states.
@freezed
class EmailVerificationState with _$EmailVerificationState {
  const factory EmailVerificationState.initial() = _Initial;
  const factory EmailVerificationState.verifying() = _Verifying;

  /// LOGIN_SUCCESS — email/device verified and the user is now logged in.
  const factory EmailVerificationState.verified({required String? role}) =
      _Verified;

  /// PENDING_APPROVAL — email verified, but the account still awaits a
  /// sales manager's approval. Terminal for now.
  const factory EmailVerificationState.pendingApproval() = _PendingApproval;

  /// SETUP_2FA / 2FA — General-Manager-only continuation. See LoginState's
  /// note: informational only, no TOTP UI in this rep-facing app.
  const factory EmailVerificationState.twoFactorSetupRequired() =
      _TwoFactorSetupRequired;
  const factory EmailVerificationState.twoFactorRequired({
    required String verificationId,
  }) = _TwoFactorRequired;

  const factory EmailVerificationState.resendingCode() = _ResendingCode;
  const factory EmailVerificationState.codeResent({required String message}) =
      _CodeResent;

  const factory EmailVerificationState.rateLimited({required int seconds}) =
      _RateLimited;

  const factory EmailVerificationState.error(String message) = _Error;
}
