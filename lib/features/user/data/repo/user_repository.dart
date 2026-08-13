import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/change_password_request.dart';
import '../models/change_username_request.dart';

/// users.md's self-service routes — the only ones in that module a
/// `REPRESENTATIVE` can reach. `/admin/users` and `/representatives` are
/// `SALES_ADMIN`/`GENERAL_MANAGER`/`SALES_MANAGER`+ at the route gate, so
/// they're deliberately absent here (same reasoning as
/// `StakeholdersRepository`'s omissions).
///
/// Session management (`GET`/`DELETE /users/me/sessions`) is self-service
/// too and equally reachable — not built yet only because no screen asks
/// for it; adding it later is additive.
class UserRepository {
  final ApiService _apiService;

  UserRepository(this._apiService);

  ApiResult<T> _validationFailure<T>(ArgumentError e) => ApiResult.failure(
    ApiErrorModel(
      message: e.message ?? 'Validation failed',
      code: 'VALIDATION_ERROR',
    ),
  );

  /// `PUT /users/me/password`. On success the server blacklists every other
  /// session's tokens when `logoutOtherSessions` is true — this device's
  /// tokens are untouched, so no re-login is needed here.
  Future<ApiResult<String?>> changePassword(
    ChangePasswordRequest request,
  ) async {
    try {
      request.validate();
      final response = await _apiService.changeMyPassword(request);
      return ApiResult.success(response.message);
    } on ArgumentError catch (e) {
      return _validationFailure(e);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// `PATCH /users/me/username` — one-time only. Returns the new username.
  Future<ApiResult<String>> changeUsername(
    ChangeUsernameRequest request,
  ) async {
    try {
      request.validate();
      final response = await _apiService.changeMyUsername(request);
      return ApiResult.success(response.data.username);
    } on ArgumentError catch (e) {
      return _validationFailure(e);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
