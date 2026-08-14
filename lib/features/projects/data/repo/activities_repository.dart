import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/activities_list_response.dart';
import '../models/activity_detail_view.dart';
import '../models/activity_view.dart';
import '../models/attention_item_view.dart';
import '../models/enums.dart';
import '../models/log_activity_request.dart';
import '../models/log_activity_response.dart' show LogActivityData;
import '../models/patch_activity_request.dart';
import '../models/sync_activities_request.dart';
import '../models/sync_activities_result.dart';

/// Every Phase-2 `/activities/*` + `/projects/needs-attention` endpoint.
/// Same shape as `ProjectsRepository`: validate client-side first, always
/// return `ApiResult<T>`, never throw.
class ActivitiesRepository {
  final ApiService _apiService;

  ActivitiesRepository(this._apiService);

  ApiResult<T> _validationFailure<T>(ArgumentError e) => ApiResult.failure(
    ApiErrorModel(
      message: e.message ?? 'Validation failed',
      code: 'VALIDATION_ERROR',
    ),
  );

  /// `GET /projects/needs-attention` — implemented against the documented
  /// contract; currently shadowed server-side (§12) so every call returns
  /// `400 VALIDATION_ERROR` until the backend fixes controller ordering.
  /// Not called from the Home tab yet (projects-implementation-map.md
  /// §10.2) — kept ready so nothing needs rework once it's fixed.
  Future<ApiResult<List<AttentionItemView>>> needsAttention({
    int? limit,
  }) async {
    try {
      final response = await _apiService.getNeedsAttention(limit: limit);
      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// `POST /projects/{projectId}/activities` — the highest-volume write in
  /// the system (Workflow 4).
  Future<ApiResult<LogActivityData>> log(
    String projectId,
    LogActivityRequest request,
  ) async {
    try {
      request.validate();
      final response = await _apiService.logActivity(projectId, request);
      return ApiResult.success(response.data);
    } on ArgumentError catch (e) {
      return _validationFailure(e);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// `GET /projects/{projectId}/activities` — project-scoped feed, newest
  /// first by `occurredAt`.
  Future<ApiResult<ActivitiesListResponse>> listForProject(
    String projectId, {
    int? page,
    int? limit,
    ActivityKind? kind,
    ActivityPurpose? purpose,
    ActivityOutcome? outcome,
    String? createdBy,
    DateTime? occurredFrom,
    DateTime? occurredTo,
    bool? editedAfterWindowOnly,
  }) async {
    try {
      final response = await _apiService.getProjectActivities(
        projectId,
        page: page,
        limit: limit,
        kind: kind?.wireValue,
        purpose: purpose?.wireValue,
        outcome: outcome?.wireValue,
        createdBy: createdBy,
        occurredFrom: occurredFrom?.toUtc().toIso8601String(),
        occurredTo: occurredTo?.toUtc().toIso8601String(),
        editedAfterWindowOnly: editedAfterWindowOnly,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// `GET /activities` — "your own feed", scoped by role (own / own+team /
  /// all). Same query contract as [listForProject]; `editedAfterWindowOnly`
  /// is the manager review queue (Workflow 13), exposed here for
  /// completeness even though Phase 2's UI doesn't build that screen yet
  /// (role isn't wired into the UI — see the Phase 1 review's same
  /// decision for `PUT /projects/{id}/location`).
  Future<ApiResult<ActivitiesListResponse>> list({
    int? page,
    int? limit,
    ActivityKind? kind,
    ActivityPurpose? purpose,
    ActivityOutcome? outcome,
    String? createdBy,
    DateTime? occurredFrom,
    DateTime? occurredTo,
    bool? editedAfterWindowOnly,
  }) async {
    try {
      final response = await _apiService.getActivities(
        page: page,
        limit: limit,
        kind: kind?.wireValue,
        purpose: purpose?.wireValue,
        outcome: outcome?.wireValue,
        createdBy: createdBy,
        occurredFrom: occurredFrom?.toUtc().toIso8601String(),
        occurredTo: occurredTo?.toUtc().toIso8601String(),
        editedAfterWindowOnly: editedAfterWindowOnly,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// `GET /activities/{id}` — `ActivityView` + `revisions[]`.
  Future<ApiResult<ActivityDetailView>> getById(String id) async {
    try {
      final response = await _apiService.getActivityById(id);
      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// `PATCH /activities/{id}` — author-only (§2.2: "the one place in the
  /// module where rank buys nothing"). A late edit is never refused.
  Future<ApiResult<ActivityView>> patch(
    String id,
    PatchActivityRequest request,
  ) async {
    try {
      request.validate();
      final response = await _apiService.patchActivity(id, request);
      return ApiResult.success(response.data);
    } on ArgumentError catch (e) {
      return _validationFailure(e);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// `POST /activities/sync` — the offline batch. Always `200`, never
  /// all-or-nothing; retrying the whole batch is always safe (idempotent
  /// on `clientRef`). The repository method and its response typing land
  /// here in Phase 2; the local queue that calls this in bulk is Phase 4.
  Future<ApiResult<SyncActivitiesResult>> syncBatch(
    SyncActivitiesRequest request,
  ) async {
    try {
      request.validate();
      final response = await _apiService.syncActivities(request);
      return ApiResult.success(response.data);
    } on ArgumentError catch (e) {
      return _validationFailure(e);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
