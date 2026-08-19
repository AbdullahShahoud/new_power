import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/models/add_project_images_request.dart';
import '../../data/repo/projects_repository.dart';
import 'projects_event.dart';
import 'projects_state.dart';

/// Phase 1 — owns listing, nearby-scouting, detail, history and every
/// mutation (register/patch/stage/status/location/images) for `/projects`.
/// projects-implementation-map.md §8.2: one Bloc, three independent
/// sub-machines in one state class, not a God-Bloc merging unrelated
/// features — Activities/Outcomes/Reports/OfflineSync are separate Blocs
/// (Phases 2-5) that happen to reference the same project ids.
///
/// Mutation handlers deliberately do NOT hand-merge their result into
/// `selectedProject` — `PATCH`/stage/status/location all return a bare
/// `ProjectView` (no images/activities/stakeholders), and hand-merging that
/// onto a `ProjectDetailView` would either drop those fields or require
/// inventing merge rules the docs don't specify. Instead the UI reacts to
/// `mutationStatus == success` by dispatching `ProjectDetailRefreshed`,
/// the same re-read this Bloc already uses for Workflow 9's version-conflict
/// recovery — one refresh path for both cases, not two.
class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  final ProjectsRepository _projectsRepository;

  ProjectsBloc(this._projectsRepository) : super(const ProjectsState()) {
    on<ProjectsListRequested>(_onListRequested);
    on<ProjectsListRefreshed>(_onListRefreshed);
    on<ProjectsNextPageRequested>(_onNextPageRequested);
    on<ProjectsFilterChanged>(_onFilterChanged);
    on<ProjectsSearchChanged>(_onSearchChanged);
    on<ProjectRetryRequested>(_onRetryRequested);
    on<ProjectsNearbyRequested>(_onNearbyRequested);
    on<ProjectRegisterSubmitted>(_onRegisterSubmitted);
    on<ProjectDetailRequested>(_onDetailRequested);
    on<ProjectDetailRefreshed>(_onDetailRefreshed);
    on<ProjectPatchSubmitted>(_onPatchSubmitted);
    on<ProjectStageChangeSubmitted>(_onStageChangeSubmitted);
    on<ProjectStatusChangeSubmitted>(_onStatusChangeSubmitted);
    on<ProjectLocationChangeSubmitted>(_onLocationChangeSubmitted);
    on<ProjectHistoryRequested>(_onHistoryRequested);
    on<ProjectHistoryNextPageRequested>(_onHistoryNextPageRequested);
    on<ProjectImagesAddSubmitted>(_onImagesAddSubmitted);
    on<ProjectImageRemoveSubmitted>(_onImageRemoveSubmitted);
  }

  // ── list ──────────────────────────────────────────────────────────────

  Future<void> _onListRequested(
    ProjectsListRequested event,
    Emitter<ProjectsState> emit,
  ) async {
    emit(
      state.copyWith(
        listStatus: PagedFeedStatus.loading,
        listErrorMessage: null,
      ),
    );
    await _loadList(emit, page: 1, append: false);
  }

  Future<void> _onListRefreshed(
    ProjectsListRefreshed event,
    Emitter<ProjectsState> emit,
  ) async {
    emit(state.copyWith(listStatus: PagedFeedStatus.refreshing));
    await _loadList(emit, page: 1, append: false);
  }

  Future<void> _onNextPageRequested(
    ProjectsNextPageRequested event,
    Emitter<ProjectsState> emit,
  ) async {
    final pagination = state.pagination;
    if (pagination == null || pagination.page >= pagination.totalPages) {
      return;
    }
    emit(state.copyWith(listStatus: PagedFeedStatus.paginationLoading));
    await _loadList(emit, page: pagination.page + 1, append: true);
  }

  Future<void> _onFilterChanged(
    ProjectsFilterChanged event,
    Emitter<ProjectsState> emit,
  ) async {
    emit(
      state.copyWith(
        filter: event.filter,
        listStatus: PagedFeedStatus.loading,
        listErrorMessage: null,
      ),
    );
    await _loadList(emit, page: 1, append: false);
  }

  Future<void> _onSearchChanged(
    ProjectsSearchChanged event,
    Emitter<ProjectsState> emit,
  ) async {
    emit(
      state.copyWith(
        filter: state.filter.copyWith(search: event.query),
        listStatus: PagedFeedStatus.loading,
        listErrorMessage: null,
      ),
    );
    await _loadList(emit, page: 1, append: false);
  }

  Future<void> _onRetryRequested(
    ProjectRetryRequested event,
    Emitter<ProjectsState> emit,
  ) async {
    emit(
      state.copyWith(
        listStatus: PagedFeedStatus.loading,
        listErrorMessage: null,
      ),
    );
    await _loadList(emit, page: 1, append: false);
  }

  Future<void> _loadList(
    Emitter<ProjectsState> emit, {
    required int page,
    required bool append,
  }) async {
    final filter = state.filter;
    final result = await _projectsRepository.list(
      page: page,
      stage: filter.stage,
      status: filter.status,
      constructionPhase: filter.constructionPhase,
      buildingType: filter.buildingType,
      territoryId: filter.territoryId,
      search: filter.search,
      updatedSince: filter.updatedSince,
      near: filter.near,
    );
    switch (result) {
      case Success(data: final response):
        final items = append
            ? [...state.projects, ...response.data]
            : response.data;
        emit(
          state.copyWith(
            listStatus: items.isEmpty
                ? PagedFeedStatus.empty
                : PagedFeedStatus.loaded,
            projects: items,
            pagination: response.pagination,
          ),
        );
      case Failure(error: final error):
        emit(
          state.copyWith(
            listStatus: PagedFeedStatus.networkError,
            listErrorMessage: error.message,
          ),
        );
    }
  }

  // ── nearby ───────────────────────────────────────────────────────────

  Future<void> _onNearbyRequested(
    ProjectsNearbyRequested event,
    Emitter<ProjectsState> emit,
  ) async {
    emit(
      state.copyWith(
        nearbyStatus: PagedFeedStatus.loading,
        nearbyErrorMessage: null,
      ),
    );
    final result = await _projectsRepository.nearby(
      lat: event.lat,
      lng: event.lng,
      radiusM: event.radiusM,
    );
    switch (result) {
      case Success(data: final items):
        emit(
          state.copyWith(
            nearbyStatus: items.isEmpty
                ? PagedFeedStatus.empty
                : PagedFeedStatus.loaded,
            nearby: items,
          ),
        );
      case Failure(error: final error):
        emit(
          state.copyWith(
            nearbyStatus: PagedFeedStatus.networkError,
            nearbyErrorMessage: error.message,
          ),
        );
    }
  }

  // ── detail ───────────────────────────────────────────────────────────

  Future<void> _onDetailRequested(
    ProjectDetailRequested event,
    Emitter<ProjectsState> emit,
  ) async {
    emit(
      state.copyWith(
        detailStatus: ProjectDetailStatus.loading,
        detailErrorMessage: null,
      ),
    );
    await _loadDetail(event.id, emit);
  }

  /// Workflow 9's re-read: keeps the stale card on screen instead of
  /// flashing a spinner over it while the fresh version loads.
  Future<void> _onDetailRefreshed(
    ProjectDetailRefreshed event,
    Emitter<ProjectsState> emit,
  ) async {
    await _loadDetail(event.id, emit);
  }

  Future<void> _loadDetail(String id, Emitter<ProjectsState> emit) async {
    final result = await _projectsRepository.getById(id);
    switch (result) {
      case Success(data: final detail):
        emit(
          state.copyWith(
            detailStatus: ProjectDetailStatus.loaded,
            selectedProject: detail,
            detailErrorMessage: null,
          ),
        );
      case Failure(error: final error):
        emit(
          state.copyWith(
            // 404 whether "gone" or "not yours" (§1.8) — rendered identically.
            detailStatus: error.code == 'PROJECT_NOT_FOUND'
                ? ProjectDetailStatus.notFound
                : ProjectDetailStatus.networkError,
            detailErrorMessage: error.message,
          ),
        );
    }
  }

  // ── history ──────────────────────────────────────────────────────────

  Future<void> _onHistoryRequested(
    ProjectHistoryRequested event,
    Emitter<ProjectsState> emit,
  ) async {
    emit(
      state.copyWith(
        historyStatus: PagedFeedStatus.loading,
        history: const [],
        historyErrorMessage: null,
      ),
    );
    await _loadHistory(event.id, page: 1, append: false, emit: emit);
  }

  Future<void> _onHistoryNextPageRequested(
    ProjectHistoryNextPageRequested event,
    Emitter<ProjectsState> emit,
  ) async {
    final pagination = state.historyPagination;
    if (pagination == null || pagination.page >= pagination.totalPages) {
      return;
    }
    emit(state.copyWith(historyStatus: PagedFeedStatus.paginationLoading));
    await _loadHistory(
      event.id,
      page: pagination.page + 1,
      append: true,
      emit: emit,
    );
  }

  Future<void> _loadHistory(
    String id, {
    required int page,
    required bool append,
    required Emitter<ProjectsState> emit,
  }) async {
    final result = await _projectsRepository.history(id, page: page);
    switch (result) {
      case Success(data: final response):
        final items = append
            ? [...state.history, ...response.data]
            : response.data;
        emit(
          state.copyWith(
            historyStatus: items.isEmpty
                ? PagedFeedStatus.empty
                : PagedFeedStatus.loaded,
            history: items,
            historyPagination: response.pagination,
          ),
        );
      case Failure(error: final error):
        emit(
          state.copyWith(
            historyStatus: PagedFeedStatus.networkError,
            historyErrorMessage: error.message,
          ),
        );
    }
  }

  // ── mutations ────────────────────────────────────────────────────────

  Future<void> _onRegisterSubmitted(
    ProjectRegisterSubmitted event,
    Emitter<ProjectsState> emit,
  ) async {
    emit(
      state.copyWith(
        mutationStatus: ProjectMutationStatus.inProgress,
        mutationErrorMessage: null,
      ),
    );
    final result = await _projectsRepository.register(event.request);
    switch (result) {
      case Success(data: final registerResult):
        emit(
          state.copyWith(
            mutationStatus: ProjectMutationStatus.success,
            lastRegistrationResult: registerResult,
          ),
        );
      case Failure(error: final error):
        emit(_mutationFailureState(error));
    }
  }

  Future<void> _onPatchSubmitted(
    ProjectPatchSubmitted event,
    Emitter<ProjectsState> emit,
  ) async {
    emit(
      state.copyWith(
        mutationStatus: ProjectMutationStatus.inProgress,
        mutationErrorMessage: null,
      ),
    );
    final result = await _projectsRepository.patch(event.id, event.request);
    _emitProjectMutationResult(result, emit);
  }

  Future<void> _onStageChangeSubmitted(
    ProjectStageChangeSubmitted event,
    Emitter<ProjectsState> emit,
  ) async {
    emit(
      state.copyWith(
        mutationStatus: ProjectMutationStatus.inProgress,
        mutationErrorMessage: null,
      ),
    );
    final result = await _projectsRepository.changeStage(
      event.id,
      event.request,
    );
    _emitProjectMutationResult(result, emit);
  }

  Future<void> _onStatusChangeSubmitted(
    ProjectStatusChangeSubmitted event,
    Emitter<ProjectsState> emit,
  ) async {
    emit(
      state.copyWith(
        mutationStatus: ProjectMutationStatus.inProgress,
        mutationErrorMessage: null,
      ),
    );
    final result = await _projectsRepository.changeStatus(
      event.id,
      event.request,
    );
    _emitProjectMutationResult(result, emit);
  }

  Future<void> _onLocationChangeSubmitted(
    ProjectLocationChangeSubmitted event,
    Emitter<ProjectsState> emit,
  ) async {
    emit(
      state.copyWith(
        mutationStatus: ProjectMutationStatus.inProgress,
        mutationErrorMessage: null,
      ),
    );
    final result = await _projectsRepository.changeLocation(
      event.id,
      event.request,
    );
    _emitProjectMutationResult(result, emit);
  }

  Future<void> _onImagesAddSubmitted(
    ProjectImagesAddSubmitted event,
    Emitter<ProjectsState> emit,
  ) async {
    emit(
      state.copyWith(
        mutationStatus: ProjectMutationStatus.inProgress,
        mutationErrorMessage: null,
      ),
    );
    final result = await _projectsRepository.addImages(
      event.id,
      AddProjectImagesRequest(files: event.files),
    );
    switch (result) {
      case Success():
        emit(state.copyWith(mutationStatus: ProjectMutationStatus.success));
      case Failure(error: final error):
        emit(_mutationFailureState(error));
    }
  }

  Future<void> _onImageRemoveSubmitted(
    ProjectImageRemoveSubmitted event,
    Emitter<ProjectsState> emit,
  ) async {
    emit(
      state.copyWith(
        mutationStatus: ProjectMutationStatus.inProgress,
        mutationErrorMessage: null,
      ),
    );
    final result = await _projectsRepository.removeImage(
      event.id,
      event.imageId,
    );
    switch (result) {
      case Success():
        emit(state.copyWith(mutationStatus: ProjectMutationStatus.success));
      case Failure(error: final error):
        emit(_mutationFailureState(error));
    }
  }

  void _emitProjectMutationResult(
    ApiResult<dynamic> result,
    Emitter<ProjectsState> emit,
  ) {
    switch (result) {
      case Success(data: final project):
        emit(
          state.copyWith(
            mutationStatus: ProjectMutationStatus.success,
            lastMutatedProject: project,
          ),
        );
      case Failure(error: final error):
        emit(_mutationFailureState(error));
    }
  }

  /// The doc's canonical "Projects" error-code table (§ "Role-related
  /// failures at a glance" + § "Projects", near the end of the reference)
  /// — every code documented against this module's mutating routes,
  /// collapsed onto the states the UI branches on. Anything undocumented
  /// falls through to `networkError` (the same "generic failure" bucket
  /// the state machine's own diagram uses for everything past the named
  /// branches).
  ProjectsState _mutationFailureState(ApiErrorModel error) {
    final status = _mutationStatusFor(error);
    return state.copyWith(
      mutationStatus: status,
      mutationErrorMessage: error.message,
      imagesNotUploadedKeys: status == ProjectMutationStatus.imagesNotUploaded
          ? _extractKeys(error)
          : const <String>[],
    );
  }

  ProjectMutationStatus _mutationStatusFor(ApiErrorModel error) {
    switch (error.code) {
      case 'PROJECT_VERSION_CONFLICT':
        return ProjectMutationStatus.versionConflict;
      case 'PROJECT_OUTSIDE_OWN_TERRITORY':
        return ProjectMutationStatus.territoryRejected;
      case 'PROJECT_NOT_ACCESSIBLE':
      case 'PROJECT_REOPEN_REQUIRES_MANAGER':
      case 'PROJECT_LOCATION_REQUIRES_MANAGER':
        return ProjectMutationStatus.permissionDenied;
      // A mutation 404s too, not just GET — a rep reviving a CANCELLED
      // project, or the project/image being gone by the time the request
      // lands. Rendered identically to "not found" everywhere else (§1.8).
      case 'PROJECT_NOT_FOUND':
      case 'PROJECT_IMAGE_NOT_FOUND':
        return ProjectMutationStatus.notFound;
      case 'PROJECT_IMAGE_NOT_UPLOADED':
        return ProjectMutationStatus.imagesNotUploaded;
      case 'PROJECT_IMAGE_REQUIRED':
        return ProjectMutationStatus.lastImageRequired;
      case 'PROJECT_TOO_MANY_IMAGES':
        return ProjectMutationStatus.tooManyImages;
      case 'PROJECT_CANCELLED':
        return ProjectMutationStatus.projectCancelled;
      case 'PROJECT_STAGE_REQUIRES_OUTCOME':
      case 'PROJECT_INVALID_NAME':
      case 'PROJECT_INVALID_DESCRIPTION':
      case 'PROJECT_INVALID_LOCATION':
      case 'PROJECT_INVALID_MONEY':
      case 'PROJECT_INVALID_REASON':
      case 'VALIDATION_ERROR':
        return ProjectMutationStatus.validationError;
      default:
        return ProjectMutationStatus.networkError;
    }
  }

  /// `PROJECT_IMAGE_NOT_UPLOADED` "names exactly which ones" (§10 Workflow
  /// 1) but the doc doesn't pin down the JSON shape of that list — read it
  /// defensively from `ApiErrorModel.errors` if the server sends one,
  /// rather than guessing a shape and breaking on a real response.
  List<String> _extractKeys(ApiErrorModel error) {
    final errors = error.errors;
    if (errors is List) {
      return errors.map((e) => e.toString()).toList();
    }
    return const <String>[];
  }
}
