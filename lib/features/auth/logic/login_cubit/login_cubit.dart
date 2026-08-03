import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/rate_limiter.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/services/device_service.dart';
import '../../data/models/login_request.dart';
import '../../data/models/login_response.dart';
import '../../data/repo/auth_repository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(const LoginState.initial());

  /// Gathers the six DeviceInfo fields auth.md requires flat on the body,
  /// then calls `POST /auth/login`. There is no separate device-registration
  /// step — the fields travel inline with this request.
  Future<void> login(String email, String password) async {
    // ── Client-side debounce (UX only — see RateLimiter docs) ─────────────
    final remaining = await RateLimiter.checkLock(RateLimiter.login);
    if (remaining != null) {
      emit(LoginState.rateLimited(seconds: remaining));
      return;
    }

    emit(const LoginState.loading());
    try {
      final deviceInfo = await Future.wait([
        DeviceIdentityService.getOrCreateDeviceId(),
        DeviceIdentityService.getDeviceType(),
        DeviceIdentityService.getDeviceName(),
        DeviceIdentityService.getDeviceModel(),
        DeviceIdentityService.getOsVersion(),
        DeviceIdentityService.getAppVersion(),
      ]);

      final request = LoginRequest(
        email: email.trim(),
        password: password,
        deviceId: deviceInfo[0]!,
        deviceType: deviceInfo[1]!,
        deviceName: deviceInfo[2] ?? 'Unknown device',
        deviceModel: deviceInfo[3] ?? 'Unknown model',
        osVersion: deviceInfo[4] ?? Platform.operatingSystemVersion,
        appVersion: deviceInfo[5] ?? '1.0.0',
      );

      final result = await _authRepository.login(request);

      result.when(
        success: (response) async {
          await RateLimiter.reset(RateLimiter.login);
          _emitOutcome(response.data);
        },
        failure: (error) async {
          if (error.code == 'RATE_LIMIT_EXCEEDED') {
            final seconds = error.retryAfter ?? 60;
            await RateLimiter.lockFor(RateLimiter.login, seconds);
            emit(LoginState.rateLimited(seconds: seconds));
            return;
          }
          final lockSeconds = await RateLimiter.recordFailure(
            RateLimiter.login,
          );
          if (lockSeconds != null) {
            emit(LoginState.rateLimited(seconds: lockSeconds));
          } else {
            emit(
              LoginState.error(
                error.message ?? 'Login failed',
                errorCode: error.code,
              ),
            );
          }
        },
      );
    } catch (e) {
      debugPrint('Login error: $e');
      emit(const LoginState.error('An unexpected error occurred'));
    }
  }

  /// Branches on the six documented `verificationType` outcomes shared by
  /// `/auth/login` and `/auth/verify-otp`.
  void _emitOutcome(LoginData data) {
    switch (data.verificationType) {
      case VerificationTypes.loginSuccess:
        emit(LoginState.success(role: data.role));
        break;
      case VerificationTypes.email:
      case VerificationTypes.device:
        emit(LoginState.otpRequired(verificationId: data.verificationId!));
        break;
      case VerificationTypes.pendingApproval:
        emit(const LoginState.pendingApproval());
        break;
      case VerificationTypes.setup2fa:
        emit(const LoginState.twoFactorSetupRequired());
        break;
      case VerificationTypes.twoFa:
        emit(LoginState.twoFactorRequired(verificationId: data.verificationId!));
        break;
      default:
        emit(
          LoginState.error(
            'Unrecognised login outcome: ${data.verificationType}',
          ),
        );
    }
  }
}
