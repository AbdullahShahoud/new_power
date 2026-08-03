import '../../../../core/helpers/secure_storage_helper.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../../../core/services/auth_service.dart';
import '../../../../core/services/device_integrity_service.dart';
import '../models/forgot_password_request.dart';
import '../models/forgot_password_response.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';
import '../models/logout_request.dart';
import '../models/logout_response.dart';
import '../models/refresh_token_request.dart';
import '../models/refresh_token_response.dart';
import '../models/register_request.dart';
import '../models/register_response.dart';
import '../models/request_verification_request.dart';
import '../models/resend_verification_response.dart';
import '../models/reset_password_request.dart';
import '../models/reset_password_response.dart';
import '../models/user_response.dart';
import '../models/verify_otp_request.dart';
import '../models/verify_otp_response.dart';

class AuthRepository {
  final ApiService _apiService;

  AuthRepository(this._apiService);

  /// Shared device-integrity guard used before every sensitive call. Root/
  /// jailbreak/emulator detection (safe_device) — unrelated to the removed
  /// device-key/crypto flow, kept as a defensive check.
  Future<ApiErrorModel?> _integrityGuard() async {
    final isSafeDevice = await DeviceIntegrityService.isSafeForSensitiveOps();
    if (isSafeDevice) return null;
    final report = await DeviceIntegrityService.getDetailedReport();
    return ApiErrorModel(
      message: report.getStatusMessage(),
      code: 'DEVICE_INTEGRITY_FAILED',
    );
  }

  /// Persists tokens from a [LoginData]-shaped outcome (login or verify-otp).
  Future<void> _persistOutcome(LoginData data) async {
    if (data.verificationId != null) {
      await SecureStorageHelper.save(
        key: SecureStorageHelper.verificationId,
        value: data.verificationId!,
      );
    }
    final tokens = data.tokens;
    if (tokens != null) {
      await AuthService.saveTokens(
        accessToken: tokens.accessToken,
        refreshToken: tokens.refreshToken,
        expiresIn: tokens.expiresIn,
        refreshExpiresIn: tokens.refreshExpiresIn,
      );
    }
  }

  Future<ApiResult<RegisterResponse>> register(RegisterRequest request) async {
    try {
      final integrityError = await _integrityGuard();
      if (integrityError != null) return ApiResult.failure(integrityError);

      request.validate();
      final response = await _apiService.register(request);
      await SecureStorageHelper.save(
        key: SecureStorageHelper.verificationId,
        value: response.data.verificationId,
      );
      return ApiResult.success(response);
    } on ArgumentError catch (e) {
      return ApiResult.failure(
        ApiErrorModel(
          message: e.message ?? 'Validation failed',
          code: 'VALIDATION_ERROR',
        ),
      );
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<LoginResponse>> login(LoginRequest request) async {
    try {
      final integrityError = await _integrityGuard();
      if (integrityError != null) return ApiResult.failure(integrityError);

      request.validate();
      final response = await _apiService.login(request);
      await _persistOutcome(response.data);
      return ApiResult.success(response);
    } on ArgumentError catch (e) {
      return ApiResult.failure(
        ApiErrorModel(
          message: e.message ?? 'Validation failed',
          code: 'VALIDATION_ERROR',
        ),
      );
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// POST /auth/verify-otp — one endpoint for email verification, device
  /// verification and 2FA; the server infers which from [request.verificationId].
  Future<ApiResult<VerifyOtpResponse>> verifyOtp(
    VerifyOtpRequest request,
  ) async {
    try {
      final integrityError = await _integrityGuard();
      if (integrityError != null) return ApiResult.failure(integrityError);

      request.validate();
      final response = await _apiService.verifyOtp(request);
      await _persistOutcome(response.data);
      return ApiResult.success(response);
    } on ArgumentError catch (e) {
      return ApiResult.failure(
        ApiErrorModel(
          message: e.message ?? 'Validation failed',
          code: 'VALIDATION_ERROR',
        ),
      );
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ResendVerificationResponse>> resendVerification(
    RequestVerificationRequest request,
  ) async {
    try {
      request.validate();
      final response = await _apiService.resendVerification(request);
      return ApiResult.success(response);
    } on ArgumentError catch (e) {
      return ApiResult.failure(
        ApiErrorModel(
          message: e.message ?? 'Validation failed',
          code: 'VALIDATION_ERROR',
        ),
      );
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ForgotPasswordResponse>> forgotPassword(
    ForgotPasswordRequest request,
  ) async {
    try {
      request.validate();
      final response = await _apiService.forgotPassword(request);
      return ApiResult.success(response);
    } on ArgumentError catch (e) {
      return ApiResult.failure(
        ApiErrorModel(
          message: e.message ?? 'Validation failed',
          code: 'VALIDATION_ERROR',
        ),
      );
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ResetPasswordResponse>> resetPassword(
    ResetPasswordRequest request,
  ) async {
    try {
      request.validate();
      final response = await _apiService.resetPassword(request);
      return ApiResult.success(response);
    } on ArgumentError catch (e) {
      return ApiResult.failure(
        ApiErrorModel(
          message: e.message ?? 'Validation failed',
          code: 'VALIDATION_ERROR',
        ),
      );
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<RefreshTokenResponse>> refreshToken(
    RefreshTokenRequest request,
  ) async {
    try {
      request.validate();
      final response = await _apiService.refreshToken(request);
      return ApiResult.success(response);
    } on ArgumentError catch (e) {
      return ApiResult.failure(
        ApiErrorModel(
          message: e.message ?? 'Validation failed',
          code: 'VALIDATION_ERROR',
        ),
      );
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// POST /auth/logout — `refreshToken` is optional; omit it to revoke only
  /// the access token.
  Future<ApiResult<LogoutResponse>> logout([String? refreshToken]) async {
    try {
      final request = LogoutRequest(refreshToken: refreshToken);
      request.validate();
      final response = await _apiService.logout(request);
      return ApiResult.success(response);
    } on ArgumentError catch (e) {
      return ApiResult.failure(
        ApiErrorModel(
          message: e.message ?? 'Validation failed',
          code: 'VALIDATION_ERROR',
        ),
      );
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// GET /auth/me — current authenticated user.
  Future<ApiResult<UserResponse>> getCurrentUser() async {
    try {
      final response = await _apiService.getCurrentUser();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
