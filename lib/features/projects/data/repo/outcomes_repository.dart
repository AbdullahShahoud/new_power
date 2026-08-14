import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/enums.dart';
import '../models/outcome_view.dart';
import '../models/outcomes_list_response.dart';
import '../models/reject_outcome_request.dart';
import '../models/submit_lost_request.dart';
import '../models/submit_won_request.dart';

/// Every Phase-3 `/projects/{id}/won|lost` + `/outcomes/*` endpoint. Same
/// shape as `ProjectsRepository`/`ActivitiesRepository`: validate
/// client-side first, always return `ApiResult<T>`, never throw.
class OutcomesRepository {
  final ApiService _apiService;

  OutcomesRepository(this._apiService);

  ApiResult<T> _validationFailure<T>(ArgumentError e) => ApiResult.failure(
    ApiErrorModel(
      message: e.message ?? 'Validation failed',
      code: 'VALIDATION_ERROR',
    ),
  );

  /// `POST /projects/{projectId}/won` — `data.status` comes back `PENDING`;
  /// the project's `stage` has not moved yet (Workflow 8).
  Future<ApiResult<OutcomeView>> submitWon(
    String projectId,
    SubmitWonRequest request,
  ) async {
    try {
      request.validate();
      final response = await _apiService.submitWon(projectId, request);
      return ApiResult.success(response.data);
    } on ArgumentError catch (e) {
      return _validationFailure(e);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// `POST /projects/{projectId}/lost` — `someoneElseWon` is always `true`
  /// here (never offered as a UI choice; a `false` value is refused).
  Future<ApiResult<OutcomeView>> submitLost(
    String projectId,
    SubmitLostRequest request,
  ) async {
    try {
      request.validate();
      final response = await _apiService.submitLost(projectId, request);
      return ApiResult.success(response.data);
    } on ArgumentError catch (e) {
      return _validationFailure(e);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// `GET /outcomes` — scoped by the **project's owner**, not the
  /// submitter. `status: PENDING` returns oldest-first (the manager's
  /// confirmation queue).
  Future<ApiResult<OutcomesListResponse>> list({
    int? page,
    int? limit,
    OutcomeStatus? status,
    OutcomeType? type,
    String? projectId,
    String? submittedBy,
  }) async {
    try {
      final response = await _apiService.getOutcomes(
        page: page,
        limit: limit,
        status: status?.wireValue,
        type: type?.wireValue,
        projectId: projectId,
        submittedBy: submittedBy,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// `GET /outcomes/{id}` — 404 `OUTCOME_NOT_FOUND` if you may not see it.
  Future<ApiResult<OutcomeView>> getById(String id) async {
    try {
      final response = await _apiService.getOutcomeById(id);
      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// `POST /outcomes/{id}/confirm` — no body. `SALES_MANAGER` only, never
  /// the submitter (the four-eyes rule). Not called from any Phase-3
  /// screen yet — this app has no client-side role plumbing to safely
  /// decide when to show the control (see `activity_detail_screen.dart`'s
  /// same reasoning for edit-authorship); the method is ready for when a
  /// later phase threads the current user's role through.
  Future<ApiResult<OutcomeView>> confirm(String id) async {
    try {
      final response = await _apiService.confirmOutcome(id);
      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// `POST /outcomes/{id}/reject` — wider than confirm: the submitter may
  /// withdraw their own at any rank, a manager may reject their team's.
  Future<ApiResult<OutcomeView>> reject(
    String id,
    RejectOutcomeRequest request,
  ) async {
    try {
      request.validate();
      final response = await _apiService.rejectOutcome(id, request);
      return ApiResult.success(response.data);
    } on ArgumentError catch (e) {
      return _validationFailure(e);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
