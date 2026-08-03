import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/rate_limiter.dart';
import '../../../../core/helpers/secure_storage_helper.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/models/login_response.dart';
import '../../data/models/request_verification_request.dart';
import '../../data/models/verify_otp_request.dart';
import '../../data/repo/auth_repository.dart';
import 'email_verification_state.dart';

class EmailVerificationCubit extends Cubit<EmailVerificationState> {
  final AuthRepository _authRepository;

  EmailVerificationCubit(this._authRepository)
    : super(const EmailVerificationState.initial());

  /// POST /auth/verify-otp — one endpoint for email verification, device
  /// verification, and 2FA; the server infers which from the stored
  /// `verificationId`. A `2FA` outcome hands back a *new* verificationId for
  /// a second call with the authenticator code — [_emitOutcome] persists it.
  Future<void> verifyCode(String code) async {
    final remaining = await RateLimiter.checkLock(RateLimiter.otp);
    if (remaining != null) {
      emit(EmailVerificationState.rateLimited(seconds: remaining));
      return;
    }

    final verificationId = await SecureStorageHelper.readSafe(
      key: SecureStorageHelper.verificationId,
    );
    if (verificationId == null || verificationId.isEmpty) {
      emit(
        const EmailVerificationState.error(
          'Verification ID is missing. Please restart the app.',
        ),
      );
      return;
    }

    emit(const EmailVerificationState.verifying());

    final request = VerifyOtpRequest(
      verificationId: verificationId,
      code: code.trim(),
    );

    try {
      request.validate();
    } catch (e) {
      final errorMsg = e is ArgumentError ? e.message.toString() : e.toString();
      emit(EmailVerificationState.error(errorMsg));
      return;
    }

    final result = await _authRepository.verifyOtp(request);

    await result.when(
      success: (response) async {
        await RateLimiter.reset(RateLimiter.otp);
        await _emitOutcome(response.data);
      },
      failure: (error) async {
        if (error.code == 'RATE_LIMIT_EXCEEDED') {
          final seconds = error.retryAfter ?? 60;
          await RateLimiter.lockFor(RateLimiter.otp, seconds);
          emit(EmailVerificationState.rateLimited(seconds: seconds));
          return;
        }
        final lockSeconds = await RateLimiter.recordFailure(RateLimiter.otp);
        if (lockSeconds != null) {
          emit(EmailVerificationState.rateLimited(seconds: lockSeconds));
        } else {
          emit(
            EmailVerificationState.error(
              error.message ?? 'Verification code is invalid',
            ),
          );
        }
      },
    );
  }

  Future<void> _emitOutcome(LoginData data) async {
    switch (data.verificationType) {
      case VerificationTypes.loginSuccess:
        await SecureStorageHelper.delete(
          key: SecureStorageHelper.verificationId,
        );
        emit(EmailVerificationState.verified(role: data.role));
        break;
      case VerificationTypes.pendingApproval:
        await SecureStorageHelper.delete(
          key: SecureStorageHelper.verificationId,
        );
        emit(const EmailVerificationState.pendingApproval());
        break;
      case VerificationTypes.setup2fa:
        await SecureStorageHelper.delete(
          key: SecureStorageHelper.verificationId,
        );
        emit(const EmailVerificationState.twoFactorSetupRequired());
        break;
      case VerificationTypes.twoFa:
        // Server handed back a new verificationId for the authenticator
        // code — overwrite the stored one so a follow-up verifyCode() call
        // targets the right session.
        await SecureStorageHelper.save(
          key: SecureStorageHelper.verificationId,
          value: data.verificationId!,
        );
        emit(
          EmailVerificationState.twoFactorRequired(
            verificationId: data.verificationId!,
          ),
        );
        break;
      default:
        emit(
          EmailVerificationState.error(
            'Unrecognised verification outcome: ${data.verificationType}',
          ),
        );
    }
  }

  /// Resend verification code using the stored verificationId
  Future<void> resendCode() async {
    final remaining = await RateLimiter.checkLock(RateLimiter.resetCode);
    if (remaining != null) {
      emit(EmailVerificationState.rateLimited(seconds: remaining));
      return;
    }

    final verificationId = await SecureStorageHelper.readSafe(
      key: SecureStorageHelper.verificationId,
    );

    if (verificationId == null || verificationId.isEmpty) {
      emit(
        const EmailVerificationState.error(
          'Verification ID is missing. Please restart the app.',
        ),
      );
      return;
    }

    emit(const EmailVerificationState.resendingCode());
    final result = await _authRepository.resendVerification(
      RequestVerificationRequest(verificationId: verificationId),
    );

    result.when(
      success: (response) async {
        await RateLimiter.reset(RateLimiter.resetCode);
        emit(EmailVerificationState.codeResent(message: response.message));
      },
      failure: (error) async {
        if (error.code == 'RATE_LIMIT_EXCEEDED') {
          final seconds = error.retryAfter ?? 60;
          await RateLimiter.lockFor(RateLimiter.resetCode, seconds);
          emit(EmailVerificationState.rateLimited(seconds: seconds));
          return;
        }
        final lockSecond = await RateLimiter.recordFailure(
          RateLimiter.resetCode,
        );
        if (lockSecond != null) {
          emit(EmailVerificationState.rateLimited(seconds: lockSecond));
        } else {
          emit(
            EmailVerificationState.error(
              error.message ?? 'Failed to resend verification code',
            ),
          );
        }
      },
    );
  }

  void emitError(String message) {
    emit(EmailVerificationState.error(message));
  }

  void reset() {
    emit(const EmailVerificationState.initial());
  }
}
