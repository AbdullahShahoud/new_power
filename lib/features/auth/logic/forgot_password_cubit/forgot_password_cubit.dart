import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/rate_limiter.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/models/forgot_password_request.dart';
import '../../data/models/reset_password_request.dart';
import '../../data/repo/auth_repository.dart';
import 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthRepository _authRepository;

  ForgotPasswordCubit(this._authRepository)
    : super(const ForgotPasswordState.initial());

  /// Step 1: Send reset code to email
  Future<void> sendResetCode(String email) async {
    if (isClosed) return;

    final remaining = await RateLimiter.checkLock(RateLimiter.resetCode);
    if (remaining != null) {
      if (isClosed) return;
      emit(ForgotPasswordState.rateLimited(seconds: remaining));
      return;
    }

    if (isClosed) return;
    emit(const ForgotPasswordState.sendingCode());

    final result = await _authRepository.forgotPassword(
      ForgotPasswordRequest(email: email.trim()),
    );

    if (isClosed) return;
    result.when(
      success: (response) {
        RateLimiter.reset(RateLimiter.resetCode);
        if (isClosed) return;
        emit(ForgotPasswordState.codeSent(message: response.message));
      },
      failure: (error) async {
        if (error.code == 'RATE_LIMIT_EXCEEDED') {
          final seconds = error.retryAfter ?? 60;
          await RateLimiter.lockFor(RateLimiter.resetCode, seconds);
          if (isClosed) return;
          emit(ForgotPasswordState.rateLimited(seconds: seconds));
          return;
        }
        final lockSeconds = await RateLimiter.recordFailure(
          RateLimiter.resetCode,
        );
        if (isClosed) return;
        if (lockSeconds != null) {
          emit(ForgotPasswordState.rateLimited(seconds: lockSeconds));
        } else {
          emit(
            ForgotPasswordState.error(
              error.message ?? 'Failed to send reset code',
            ),
          );
        }
      },
    );
  }

  /// Step 2: Reset password with code
  Future<void> resetPassword({
    required String code,
    required String newPassword,
    required String email,
  }) async {
    if (isClosed) return;

    final remaining = await RateLimiter.checkLock(RateLimiter.resetPassword);
    if (remaining != null) {
      if (isClosed) return;
      emit(ForgotPasswordState.rateLimited(seconds: remaining));
      return;
    }

    if (isClosed) return;
    emit(const ForgotPasswordState.resettingPassword());

    final result = await _authRepository.resetPassword(
      ResetPasswordRequest(
        code: code.trim(),
        newPassword: newPassword,
        email: email.trim(),
      ),
    );

    if (isClosed) return;
    result.when(
      success: (response) {
        RateLimiter.reset(RateLimiter.resetPassword);
        if (isClosed) return;
        emit(ForgotPasswordState.passwordReset(message: response.message));
      },
      failure: (error) async {
        if (error.code == 'RATE_LIMIT_EXCEEDED') {
          final seconds = error.retryAfter ?? 60;
          await RateLimiter.lockFor(RateLimiter.resetPassword, seconds);
          if (isClosed) return;
          emit(ForgotPasswordState.rateLimited(seconds: seconds));
          return;
        }
        final lockSeconds = await RateLimiter.recordFailure(
          RateLimiter.resetPassword,
        );
        if (isClosed) return;
        if (lockSeconds != null) {
          emit(ForgotPasswordState.rateLimited(seconds: lockSeconds));
        } else {
          emit(
            ForgotPasswordState.error(
              error.message ?? 'Failed to reset password',
            ),
          );
        }
      },
    );
  }

  void reset() {
    if (isClosed) return;
    emit(const ForgotPasswordState.initial());
  }
}
