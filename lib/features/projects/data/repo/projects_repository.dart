import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/add_project_images_request.dart';
import '../models/change_location_request.dart';
import '../models/change_stage_request.dart';
import '../models/change_status_request.dart';
import '../models/enums.dart';
import '../models/nearby_project_card_view.dart';
import '../models/patch_project_request.dart';
import '../models/project_detail_view.dart';
import '../models/project_history_entry_view.dart';
import '../models/project_image_view.dart';
import '../models/project_view.dart';
import '../models/projects_list_response.dart' show ProjectsListResponse;
import '../models/register_project_request.dart';
import '../models/register_project_result.dart';

/// Every Phase-1 `/projects/*` endpoint. Each method validates client-side
/// first (mirroring the auth module's per-request `.validate()` pattern),
/// then returns `ApiResult<T>` — never throws.
class ProjectsRepository {
  final ApiService _apiService;

  ProjectsRepository(this._apiService);

  ApiResult<T> _validationFailure<T>(ArgumentError e) => ApiResult.failure(
    ApiErrorModel(
      message: e.message ?? 'Validation failed',
      code: 'VALIDATION_ERROR',
    ),
  );

  /// `POST /projects` — Workflow 2. `nearbyProjects` /
  /// `stakeholderLinkFailures` / `outsideTerritory` are not error signals;
  /// the project is already created by the time this returns.
  Future<ApiResult<RegisterProjectResult>> register(
    RegisterProjectRequest request,
  ) async {
    try {
      request.validate();
      final response = await _apiService.registerProject(request);
      return ApiResult.success(response.data);
    } on ArgumentError catch (e) {
      return _validationFailure(e);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// `GET /projects` — owner-scoped (rep: own; manager: own+team; admin/GM:
  /// all). `pagination` rides alongside `data` on the returned envelope, not
  /// nested in it — callers that need both read `response.data` and
  /// `response.pagination` directly off [ProjectsListResponse].
  Future<ApiResult<ProjectsListResponse>> list({
    int? page,
    int? limit,
    ProjectStage? stage,
    ProjectStatus? status,
    ConstructionPhase? constructionPhase,
    BuildingType? buildingType,
    String? territoryId,
    String? search,
    DateTime? updatedSince,
    String? near,
  }) async {
    try {
      final response = await _apiService.getProjects(
        page: page,
        limit: limit,
        stage: stage?.wireValue,
        status: status?.wireValue,
        constructionPhase: constructionPhase?.wireValue,
        buildingType: buildingType?.wireValue,
        territoryId: territoryId,
        search: search,
        updatedSince: updatedSince?.toUtc().toIso8601String(),
        near: near,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// `GET /projects/nearby` — crosses ownership on purpose (§5). `near` is
  /// `"lat,lng,radiusM"`, radius `1…1200`.
  Future<ApiResult<List<NearbyProjectCardView>>> nearby({
    required double lat,
    required double lng,
    required int radiusM,
    int? page,
    int? limit,
  }) async {
    try {
      if (radiusM < 1 || radiusM > 1200) {
        throw ArgumentError('radiusM must be 1-1200');
      }
      final response = await _apiService.getNearbyProjects(
        near: '$lat,$lng,$radiusM',
        page: page,
        limit: limit,
      );
      return ApiResult.success(response.data);
    } on ArgumentError catch (e) {
      return _validationFailure(e);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// `GET /projects/{id}` — 404 whether "not there" or "not yours" (§1.8).
  Future<ApiResult<ProjectDetailView>> getById(String id) async {
    try {
      final response = await _apiService.getProjectById(id);
      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// `PATCH /projects/{id}` — omitted fields are left alone, explicit
  /// `null` clears them (`omit.dart`).
  Future<ApiResult<ProjectView>> patch(
    String id,
    PatchProjectRequest request,
  ) async {
    try {
      request.validate();
      final response = await _apiService.patchProject(id, request);
      return ApiResult.success(response.data);
    } on ArgumentError catch (e) {
      return _validationFailure(e);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// `PUT /projects/{id}/stage` — free dropdown, no wizard: any stage to
  /// any stage except `WON`/`LOST`, which only arrive from a confirmed
  /// outcome. Leaving `WON`/`LOST` needs a manager + note server-side.
  Future<ApiResult<ProjectView>> changeStage(
    String id,
    ChangeStageRequest request,
  ) async {
    try {
      request.validate();
      final response = await _apiService.changeProjectStage(id, request);
      return ApiResult.success(response.data);
    } on ArgumentError catch (e) {
      return _validationFailure(e);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// `PUT /projects/{id}/status` — reviving from `CANCELLED` needs a
  /// manager; a rep gets `404`, not `403` (hide the control, don't rely on
  /// the error).
  Future<ApiResult<ProjectView>> changeStatus(
    String id,
    ChangeStatusRequest request,
  ) async {
    try {
      request.validate();
      final response = await _apiService.changeProjectStatus(id, request);
      return ApiResult.success(response.data);
    } on ArgumentError catch (e) {
      return _validationFailure(e);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// `PUT /projects/{id}/location` — `SALES_MANAGER` only; the territory
  /// moves with the pin.
  Future<ApiResult<ProjectView>> changeLocation(
    String id,
    ChangeLocationRequest request,
  ) async {
    try {
      request.validate();
      final response = await _apiService.changeProjectLocation(id, request);
      return ApiResult.success(response.data);
    } on ArgumentError catch (e) {
      return _validationFailure(e);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// `GET /projects/{id}/history` — stage and status changes merged into
  /// one chronological feed, newest first.
  Future<ApiResult<List<ProjectHistoryEntryView>>> history(
    String id, {
    int? page,
    int? limit,
  }) async {
    try {
      final response = await _apiService.getProjectHistory(
        id,
        page: page,
        limit: limit,
      );
      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// `POST /projects/{id}/images` — `data` is the newly added images only,
  /// never the whole gallery.
  Future<ApiResult<List<ProjectImageView>>> addImages(
    String id,
    AddProjectImagesRequest request,
  ) async {
    try {
      request.validate();
      final response = await _apiService.addProjectImages(id, request);
      return ApiResult.success(response.data);
    } on ArgumentError catch (e) {
      return _validationFailure(e);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// `DELETE /projects/{id}/images/{imageId}` — soft removal; the server
  /// refuses the last photo (`PROJECT_IMAGE_REQUIRED`). Disable the delete
  /// control at `imageCount === 1` client-side; this is the fallback path.
  Future<ApiResult<String>> removeImage(String id, String imageId) async {
    try {
      final response = await _apiService.removeProjectImage(id, imageId);
      return ApiResult.success(response.data.message);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
