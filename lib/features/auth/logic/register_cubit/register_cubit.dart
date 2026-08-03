import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/rate_limiter.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/services/device_service.dart';
import '../../data/models/register_request.dart';
import '../../data/repo/auth_repository.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _authRepository;

  RegisterCubit(this._authRepository) : super(const RegisterState.initial());

  /// Gathers the six DeviceInfo fields and completes [request] before calling
  /// `POST /auth/register`. The screen only collects user input (email,
  /// password, name, phone, managerCode); device data is filled in here.
  Future<void> register(RegisterRequest request) async {
    // ── Client-side debounce (UX only — see RateLimiter docs) ─────────────
    final remaining = await RateLimiter.checkLock(RateLimiter.register);
    if (remaining != null) {
      emit(RegisterState.rateLimited(seconds: remaining));
      return;
    }

    emit(const RegisterState.loading());

    final deviceInfo = await Future.wait([
      DeviceIdentityService.getOrCreateDeviceId(),
      DeviceIdentityService.getDeviceType(),
      DeviceIdentityService.getDeviceName(),
      DeviceIdentityService.getDeviceModel(),
      DeviceIdentityService.getOsVersion(),
      DeviceIdentityService.getAppVersion(),
    ]);

    final completedRequest = request.copyWith(
      deviceId: deviceInfo[0]!,
      deviceType: deviceInfo[1]!,
      deviceName: deviceInfo[2] ?? 'Unknown device',
      deviceModel: deviceInfo[3] ?? 'Unknown model',
      osVersion: deviceInfo[4] ?? Platform.operatingSystemVersion,
      appVersion: deviceInfo[5] ?? '1.0.0',
    );

    final result = await _authRepository.register(completedRequest);
    result.when(
      success: (response) async {
        await RateLimiter.reset(RateLimiter.register);
        emit(RegisterState.success(message: response.message));
      },
      failure: (error) async {
        if (error.code == 'RATE_LIMIT_EXCEEDED') {
          final seconds = error.retryAfter ?? 60;
          await RateLimiter.lockFor(RateLimiter.register, seconds);
          emit(RegisterState.rateLimited(seconds: seconds));
          return;
        }
        final lockSeconds = await RateLimiter.recordFailure(
          RateLimiter.register,
        );
        if (lockSeconds != null) {
          emit(RegisterState.rateLimited(seconds: lockSeconds));
        } else {
          emit(
            RegisterState.error(
              error.message ?? 'Registration failed',
              errorCode: error.code,
            ),
          );
        }
      },
    );
  }
}
