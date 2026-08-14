import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/repo/activities_repository.dart';
import 'activities_event.dart';
import 'activities_state.dart';

/// Phase 2 — owns the needs-attention feed (implemented, not yet wired
/// into the Home tab — §12), the activities list (project-scoped or "your
/// own feed"), activity detail, and the log/edit mutations. One Bloc, four
/// independent sub-machines in one state class, same pattern as
/// `ProjectsBloc` (projects-implementation-map.md §8.3).
class ActivitiesBloc extends Bloc<ActivitiesEvent, ActivitiesState> {
  final ActivitiesRepository _activitiesRepository;

  ActivitiesBloc(this._activitiesRepository) : super(const ActivitiesState()) {
    on<AttentionListRequested>(_onAttentionListRequested);
    on<ActivityLogSubmitted>(_onLogSubmitted);
    on<ActivitiesListRequested>(_onListRequested);
    on<ActivitiesNextPageRequested>(_onNextPageRequested);
    on<ActivityDetailRequested>(_onDetailRequested);
    on<ActivityEditSubmitted>(_onEditSubmitted);
    on<ActivityRetryRequested>(_onRetryRequested);
  }

  // ── attention ────────────────────────────────────────────────────────

  Future<void> _onAttentionListRequested(
    AttentionListRequested event,
    Emitter<ActivitiesState> emit,
  ) async {
    emit(
      state.copyWith(
        attentionStatus: ActivitiesFeedStatus.loading,
        attentionErrorMessage: null,
      ),
    );
    final result = await _activitiesRepository.needsAttention();
    switch (result) {
      case Success(data: final items):
        emit(
          state.copyWith(
            attentionStatus: items.isEmpty
                ? ActivitiesFeedStatus.empty
                : ActivitiesFeedStatus.loaded,
            attentionItems: items,
          ),
        );
      case Failure(error: final error):
        emit(
          state.copyWith(
            attentionStatus: ActivitiesFeedStatus.networkError,
            attentionErrorMessage: error.message,
          ),
        );
    }
  }

  // ── list ──────────────────────────────────────────────────────────────

  Future<void> _onListRequested(
    ActivitiesListRequested event,
    Emitter<ActivitiesState> emit,
  ) async {
    emit(
      state.copyWith(
        filter: event.filter,
        listStatus: ActivitiesFeedStatus.loading,
        listErrorMessage: null,
      ),
    );
    await _loadList(emit, page: 1, append: false);
  }

  Future<void> _onNextPageRequested(
    ActivitiesNextPageRequested event,
    Emitter<ActivitiesState> emit,
  ) async {
    final pagination = state.pagination;
    if (pagination == null || pagination.page >= pagination.totalPages) {
      return;
    }
    emit(state.copyWith(listStatus: ActivitiesFeedStatus.paginationLoading));
    await _loadList(emit, page: pagination.page + 1, append: true);
  }

  Future<void> _onRetryRequested(
    ActivityRetryRequested event,
    Emitter<ActivitiesState> emit,
  ) async {
    emit(
      state.copyWith(
        listStatus: ActivitiesFeedStatus.loading,
        listErrorMessage: null,
      ),
    );
    await _loadList(emit, page: 1, append: false);
  }

  Future<void> _loadList(
    Emitter<ActivitiesState> emit, {
    required int page,
    required bool append,
  }) async {
    final filter = state.filter;
    final projectId = filter.projectId;
    final result = projectId != null
        ? await _activitiesRepository.listForProject(
            projectId,
            page: page,
            kind: filter.kind,
            purpose: filter.purpose,
            outcome: filter.outcome,
            createdBy: filter.createdBy,
            occurredFrom: filter.occurredFrom,
            occurredTo: filter.occurredTo,
            editedAfterWindowOnly: filter.editedAfterWindowOnly,
          )
        : await _activitiesRepository.list(
            page: page,
            kind: filter.kind,
            purpose: filter.purpose,
            outcome: filter.outcome,
            createdBy: filter.createdBy,
            occurredFrom: filter.occurredFrom,
            occurredTo: filter.occurredTo,
            editedAfterWindowOnly: filter.editedAfterWindowOnly,
          );
    switch (result) {
      case Success(data: final response):
        final items = append
            ? [...state.activities, ...response.data]
            : response.data;
        emit(
          state.copyWith(
            listStatus: items.isEmpty
                ? ActivitiesFeedStatus.empty
                : ActivitiesFeedStatus.loaded,
            activities: items,
            pagination: response.pagination,
          ),
        );
      case Failure(error: final error):
        emit(
          state.copyWith(
            listStatus: ActivitiesFeedStatus.networkError,
            listErrorMessage: error.message,
          ),
        );
    }
  }

  // ── detail ───────────────────────────────────────────────────────────

  Future<void> _onDetailRequested(
    ActivityDetailRequested event,
    Emitter<ActivitiesState> emit,
  ) async {
    emit(
      state.copyWith(
        detailStatus: ActivityDetailStatus.loading,
        detailErrorMessage: null,
      ),
    );
    final result = await _activitiesRepository.getById(event.id);
    switch (result) {
      case Success(data: final detail):
        emit(
          state.copyWith(
            detailStatus: ActivityDetailStatus.loaded,
            selectedActivity: detail,
          ),
        );
      case Failure(error: final error):
        emit(
          state.copyWith(
            // 404 whether "gone" or "not yours" — same rendering rule as Projects (§1.8).
            detailStatus: error.code == 'ACTIVITY_NOT_FOUND'
                ? ActivityDetailStatus.notFound
                : ActivityDetailStatus.networkError,
            detailErrorMessage: error.message,
          ),
        );
    }
  }

  // ── mutations ────────────────────────────────────────────────────────

  Future<void> _onLogSubmitted(
    ActivityLogSubmitted event,
    Emitter<ActivitiesState> emit,
  ) async {
    emit(
      state.copyWith(
        mutationStatus: ActivityMutationStatus.inProgress,
        mutationErrorMessage: null,
      ),
    );
    final result = await _activitiesRepository.log(
      event.projectId,
      event.request,
    );
    switch (result) {
      case Success(data: final data):
        emit(
          state.copyWith(
            mutationStatus: ActivityMutationStatus.success,
            lastMutatedActivity: data.activity,
            lastLogSuggestion: data.suggestion,
          ),
        );
      case Failure(error: final error):
        emit(_mutationFailureState(error));
    }
  }

  Future<void> _onEditSubmitted(
    ActivityEditSubmitted event,
    Emitter<ActivitiesState> emit,
  ) async {
    emit(
      state.copyWith(
        mutationStatus: ActivityMutationStatus.inProgress,
        mutationErrorMessage: null,
      ),
    );
    final result = await _activitiesRepository.patch(event.id, event.request);
    switch (result) {
      case Success(data: final activity):
        emit(
          state.copyWith(
            mutationStatus: ActivityMutationStatus.success,
            lastMutatedActivity: activity,
            lastLogSuggestion: null,
          ),
        );
      case Failure(error: final error):
        emit(_mutationFailureState(error));
    }
  }

  /// § "Activities" error-code table, collapsed onto the states the UI
  /// branches on — every documented code, not just the ones a hand-sketch
  /// happens to mention (see the Phase 1 review that caught
  /// `ProjectMutationStatus` missing several).
  ActivitiesState _mutationFailureState(ApiErrorModel error) {
    return state.copyWith(
      mutationStatus: _mutationStatusFor(error),
      mutationErrorMessage: error.message,
    );
  }

  ActivityMutationStatus _mutationStatusFor(ApiErrorModel error) {
    switch (error.code) {
      case 'NO_INTERNET':
      case 'CONNECTION_TIMEOUT':
      case 'SEND_TIMEOUT':
        return ActivityMutationStatus.offline;
      case 'ACTIVITY_NOT_FOUND':
      case 'PROJECT_NOT_FOUND':
        return ActivityMutationStatus.notFound;
      case 'ACTIVITY_NOT_AUTHOR':
      case 'ACTIVITY_BACKDATING_NEEDS_MANAGER':
        return ActivityMutationStatus.permissionDenied;
      case 'PROJECT_CANCELLED':
        return ActivityMutationStatus.projectCancelled;
      case 'VALIDATION_ERROR':
      case 'ACTIVITY_NOTES_TOO_SHORT':
      case 'ACTIVITY_CHANNEL_REQUIRED':
      case 'ACTIVITY_CHANNEL_NOT_ALLOWED':
      case 'ACTIVITY_PERSONS_MET_REQUIRED':
      case 'ACTIVITY_NEXT_ACTION_REQUIRED':
      case 'ACTIVITY_COMPETITOR_REQUIRED':
      case 'ACTIVITY_PHASE_OBSERVATION_NOT_ALLOWED':
      case 'ACTIVITY_OCCURRED_IN_FUTURE':
      case 'ACTIVITY_CONTACT_NOT_ON_PROJECT':
        return ActivityMutationStatus.validationError;
      default:
        return ActivityMutationStatus.networkError;
    }
  }
}
