import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/change_location_request.dart';
import '../../data/models/change_stage_request.dart';
import '../../data/models/change_status_request.dart';
import '../../data/models/patch_project_request.dart';
import '../../data/models/register_project_request.dart';
import '../../data/models/stored_file.dart';
import 'projects_filter.dart';

part 'projects_event.freezed.dart';

/// projects-implementation-map.md §8.2. Mutation events carry the
/// already-built, already-`.validate()`-able wire-request model
/// (`ChangeStageRequest`, etc.) rather than re-flattening every field onto
/// the event — the request models already own that shape and their own
/// validation.
@freezed
sealed class ProjectsEvent with _$ProjectsEvent {
  const factory ProjectsEvent.listRequested() = ProjectsListRequested;

  const factory ProjectsEvent.listRefreshed() = ProjectsListRefreshed;

  const factory ProjectsEvent.nextPageRequested() = ProjectsNextPageRequested;

  /// Replaces the active filter wholesale and reloads page 1. Pass the
  /// current `state.filter` with one field changed, not a partial diff.
  const factory ProjectsEvent.filterChanged(ProjectsFilter filter) =
      ProjectsFilterChanged;

  const factory ProjectsEvent.searchChanged(String query) =
      ProjectsSearchChanged;

  const factory ProjectsEvent.nearbyRequested({
    required double lat,
    required double lng,
    required int radiusM,
  }) = ProjectsNearbyRequested;

  const factory ProjectsEvent.registerSubmitted(
    RegisterProjectRequest request,
  ) = ProjectRegisterSubmitted;

  const factory ProjectsEvent.detailRequested(String id) =
      ProjectDetailRequested;

  /// Same as [ProjectDetailRequested] but doesn't reset `detailStatus` to
  /// `loading` first — Workflow 9's re-read keeps the stale card on screen
  /// while the fresh one loads, rather than flashing a spinner over it.
  const factory ProjectsEvent.detailRefreshed(String id) =
      ProjectDetailRefreshed;

  const factory ProjectsEvent.patchSubmitted({
    required String id,
    required PatchProjectRequest request,
  }) = ProjectPatchSubmitted;

  const factory ProjectsEvent.stageChangeSubmitted({
    required String id,
    required ChangeStageRequest request,
  }) = ProjectStageChangeSubmitted;

  const factory ProjectsEvent.statusChangeSubmitted({
    required String id,
    required ChangeStatusRequest request,
  }) = ProjectStatusChangeSubmitted;

  const factory ProjectsEvent.locationChangeSubmitted({
    required String id,
    required ChangeLocationRequest request,
  }) = ProjectLocationChangeSubmitted;

  const factory ProjectsEvent.historyRequested(String id) =
      ProjectHistoryRequested;

  const factory ProjectsEvent.historyNextPageRequested(String id) =
      ProjectHistoryNextPageRequested;

  const factory ProjectsEvent.imagesAddSubmitted({
    required String id,
    required List<ProjectFileRefDto> files,
  }) = ProjectImagesAddSubmitted;

  const factory ProjectsEvent.imageRemoveSubmitted({
    required String id,
    required String imageId,
  }) = ProjectImageRemoveSubmitted;

  /// Retries the list load after `ProjectsListStatus.networkError` — the
  /// one case the state machine diagrams a retry for (§8.2). Detail/
  /// mutation network errors are retried by re-dispatching the specific
  /// event that failed (e.g. `ProjectDetailRequested` again), which already
  /// carries the id/request it needs.
  const factory ProjectsEvent.retryRequested() = ProjectRetryRequested;
}
