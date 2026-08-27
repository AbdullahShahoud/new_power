import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/attainment_view.dart';
import '../models/target_enums.dart';

/// The representative's own targets.
///
/// One method, because `GET /attainment/me` is the entire surface this role
/// can reach — the separation from a manager's view is **by role on the
/// route**, not by a scope parameter, so there is no request shape that
/// would let a rep read a colleague and nothing here to guard against.
class TargetsRepository {
  final ApiService _apiService;

  TargetsRepository(this._apiService);

  /// [period] follows the `2026-Q3` / `2026-08` / `2026` grammar. Omitting
  /// it means **the current quarter**, which is what the home screen wants,
  /// so it is left null rather than computed client-side — a locally
  /// derived quarter could disagree with the server's resolver at a
  /// boundary.
  Future<ApiResult<MyAttainmentView>> myAttainment({
    String? period,
    TargetMetric? metric,
  }) async {
    try {
      final response = await _apiService.getMyAttainment(
        period: period,
        metric: metric?.wireValue,
      );
      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
