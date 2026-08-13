import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/rate_limiter.dart';
import '../../../../core/helpers/secure_storage_helper.dart';
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

  /// Only `REPRESENTATIVE` may use this client. Compared case-insensitively
  /// against the raw role string the API returns (`user_model.dart` keeps it
  /// as a `String?` rather than an enum, since auth.md documents more roles
  /// than this app models).
  ///
  /// A missing role is treated as **not** a representative: the safe
  /// direction to be wrong in is refusing a login we can't verify, not
  /// admitting one.
  static bool _isRepresentative(String? role) =>
      role?.trim().toUpperCase() == 'REPRESENTATIVE';

  Future<void> _rejectNonRepresentative() async {
    await SecureStorageHelper.deleteAll();
    if (isClosed) return;
    emit(const LoginState.roleNotAllowed());
  }

  /// Branches on the six documented `verificationType` outcomes shared by
  /// `/auth/login` and `/auth/verify-otp`.
  void _emitOutcome(LoginData data) {
    switch (data.verificationType) {
      case VerificationTypes.loginSuccess:
        // This app is the Sales-Representative client. Every screen in it
        // is built around a rep's own scoped data, and a manager signing in
        // would land in a UI that answers none of their questions (and
        // silently hides most of what their role can actually reach).
        // Refuse at the door rather than half-serve them.
        //
        // The repository has already persisted tokens by this point, so the
        // refusal has to wipe them — otherwise the session survives and the
        // startup router would let the blocked account straight back in on
        // the next launch.
        if (!_isRepresentative(data.role)) {
          _rejectNonRepresentative();
          return;
        }
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
