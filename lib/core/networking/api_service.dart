import 'package:dio/dio.dart';
import 'package:new_power/core/networking/api_constants.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/auth/data/models/forgot_password_request.dart'
    show ForgotPasswordRequest;
import '../../features/auth/data/models/forgot_password_response.dart'
    show ForgotPasswordResponse;
import '../../features/auth/data/models/login_request.dart';
import '../../features/auth/data/models/login_response.dart';
import '../../features/auth/data/models/logout_request.dart';
import '../../features/auth/data/models/logout_response.dart';
import '../../features/auth/data/models/refresh_token_request.dart';
import '../../features/auth/data/models/refresh_token_response.dart'
    show RefreshTokenResponse;
import '../../features/auth/data/models/register_request.dart';
import '../../features/auth/data/models/register_response.dart';
import '../../features/auth/data/models/request_verification_request.dart';
import '../../features/auth/data/models/resend_verification_response.dart';
import '../../features/auth/data/models/reset_password_request.dart';
import '../../features/auth/data/models/reset_password_response.dart';
import '../../features/auth/data/models/user_response.dart';
import '../../features/auth/data/models/verify_otp_request.dart';
import '../../features/auth/data/models/verify_otp_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // ========================== Authentication ==========================
  // Every path here matches auth.md exactly. Device metadata rides inline on
  // register/login bodies; X-Device-Id + Authorization headers are injected
  // by DioFactory's interceptor, not passed as method parameters here.

  @POST(ApiConstants.registerUser)
  Future<RegisterResponse> register(@Body() RegisterRequest registerRequest);

  @POST(ApiConstants.loginUser)
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @POST(ApiConstants.verifyOtp)
  Future<VerifyOtpResponse> verifyOtp(@Body() VerifyOtpRequest request);

  @POST(ApiConstants.resendVerification)
  Future<ResendVerificationResponse> resendVerification(
    @Body() RequestVerificationRequest request,
  );

  @POST(ApiConstants.refreshToken)
  Future<RefreshTokenResponse> refreshToken(
    @Body() RefreshTokenRequest refreshTokenRequest,
  );

  @POST(ApiConstants.logoutUser)
  Future<LogoutResponse> logout(@Body() LogoutRequest request);

  @GET(ApiConstants.me)
  Future<UserResponse> getCurrentUser();

  @POST(ApiConstants.forgotPassword)
  Future<ForgotPasswordResponse> forgotPassword(
    @Body() ForgotPasswordRequest request,
  );

  @POST(ApiConstants.resetPassword)
  Future<ResetPasswordResponse> resetPassword(
    @Body() ResetPasswordRequest request,
  );
}
