import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/actor_view.dart';
import '../../data/models/nearby_project_card_view.dart';
import '../../data/models/project_detail_view.dart';
import '../../data/models/project_history_entry_view.dart';
import '../../data/models/project_view.dart';
import '../../data/models/register_project_result.dart';
import 'projects_filter.dart';

part 'projects_state.freezed.dart';

/// Shared by the list and history feeds — both are
/// `Initial/Idle → Loading → Loaded → PaginationLoading → Loaded` with an
/// `Empty` and a `NetworkError` branch (§8.2). `refreshing` is list-only
/// (pull-to-refresh keeps stale rows visible); history never sets it.
enum PagedFeedStatus {
  initial,
  loading,
  loaded,
  paginationLoading,
  empty,
  refreshing,
  networkError,
}

enum ProjectDetailStatus { idle, loading, loaded, notFound, networkError }

/// §7's error-code table, collapsed to the states the UI actually branches
/// on. `success` alone doesn't distinguish "which mutation" — the caller
/// reads `lastMutatedProject`/`lastRegistrationResult` alongside it, same
/// as `mutationStatus` alone doesn't say which id was mutated (the UI
/// already knows, it's the screen it's standing on).
enum ProjectMutationStatus {
  idle,
  inProgress,
  success,
  validationError,
  versionConflict,
  territoryRejected,
  permissionDenied,
  imagesNotUploaded,
  lastImageRequired,
  tooManyImages,
  projectCancelled,

  /// `PROJECT_NOT_FOUND` (§ "Projects" error table — a mutation can 404
  /// too, not just `GET`: e.g. a rep reviving a `CANCELLED` project, or
  /// the project being deleted/reassigned between load and edit) and
  /// `PROJECT_IMAGE_NOT_FOUND` (the image id itself doesn't exist).
  notFound,
  networkError,
}

/// One freezed state grouping three independent sub-machines — list,
/// detail (+ its history feed) and mutation — because a rep can have the
/// list loaded *and* a detail screen open *and* a mutation in flight at
/// once (projects-implementation-map.md §8.2). Flattening this into a
/// single enum would force illegal combinations (e.g. "list loading" and
/// "detail loaded" can't both be represented by one status value).
@freezed
sealed class ProjectsState with _$ProjectsState {
  const factory ProjectsState({
    // ── list ──────────────────────────────────────────────────────────
    @Default(PagedFeedStatus.initial) PagedFeedStatus listStatus,
    @Default(<ProjectSummaryView>[]) List<ProjectSummaryView> projects,
    PaginationMeta? pagination,
    @Default(ProjectsFilter()) ProjectsFilter filter,
    String? listErrorMessage,

    // ── nearby (free-standing "what's around me" scouting view) ────────
    @Default(PagedFeedStatus.initial) PagedFeedStatus nearbyStatus,
    @Default(<NearbyProjectCardView>[]) List<NearbyProjectCardView> nearby,
    String? nearbyErrorMessage,

    // ── detail ───────────────────────────────────────────────────────
    @Default(ProjectDetailStatus.idle) ProjectDetailStatus detailStatus,
    ProjectDetailView? selectedProject,
    String? detailErrorMessage,

    // ── history (rendered inside the detail screen) ─────────────────────
    @Default(PagedFeedStatus.initial) PagedFeedStatus historyStatus,
    @Default(<ProjectHistoryEntryView>[]) List<ProjectHistoryEntryView> history,
    PaginationMeta? historyPagination,
    String? historyErrorMessage,

    // ── mutation (register / patch / stage / status / location / images) ─
    @Default(ProjectMutationStatus.idle) ProjectMutationStatus mutationStatus,
    ProjectView? lastMutatedProject,
    RegisterProjectResult? lastRegistrationResult,
    String? mutationErrorMessage,
    @Default(<String>[]) List<String> imagesNotUploadedKeys,
  }) = _ProjectsState;
}
