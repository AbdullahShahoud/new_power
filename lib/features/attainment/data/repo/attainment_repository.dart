import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/attainment_enums.dart';
import '../models/attainment_period.dart';
import '../models/attainment_view.dart';

/// The `error.code` values worth branching on (attainment-me.md §6).
///
/// ⚠️ **`error.code` is the contract; `message` is prose that may be
/// reworded.** Nothing in this feature branches on a message string.
class AttainmentErrorCodes {
  AttainmentErrorCodes._();

  /// Malformed `period`, an unknown `metric`, **or any unknown query key** —
  /// the global `ValidationPipe` runs with `forbidNonWhitelisted: true`, so
  /// `?page=1` is a 400, not an ignored parameter.
  static const String validation = 'VALIDATION_ERROR';

  /// The caller is not a `REPRESENTATIVE`. Managers, the general manager and
  /// the sales admin all land here — they read the same numbers through
  /// `GET /attainment`, which this app does not serve.
  static const String forbidden = 'Forbidden';

  /// `X-Device-Id` disagrees with the token's `deviceId` claim.
  static const String deviceMismatch = 'DEVICE_ID_MISMATCH';

  /// The route has **no 404 and no domain error**: an absent target is an
  /// empty array, not a missing resource. A 404 here means the path is
  /// wrong, not that the rep has no target.
  static bool isRoleRefusal(String? code) => code == forbidden;
}

/// `GET /attainment/me` — the rep's own targets.
///
/// One route, read-only, and the only target route a `REPRESENTATIVE` can
/// reach. There is no `representativeId` parameter and no scope parameter:
/// the handler reads the actor id off the token, so the subject is always
/// the caller.
class AttainmentRepository {
  final ApiService _apiService;

  AttainmentRepository(this._apiService);

  /// Both parameters are optional and default server-side to the quarter
  /// containing today (UTC) and `SALES_VALUE`.
  ///
  /// ⚠️ Nothing else may be sent. `page`, `limit`, `representativeId` and
  /// `managerId` are all rejected outright — this response is never paged.
  Future<ApiResult<MyAttainmentView>> me({
    AttainmentPeriod? period,
    AttainmentMetric? metric,
  }) async {
    try {
      final response = await _apiService.getMyAttainment(
        period: period?.wireValue,
        metric: metric?.wireValue,
      );
      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
