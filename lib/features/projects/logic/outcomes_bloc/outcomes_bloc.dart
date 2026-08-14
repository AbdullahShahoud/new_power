import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/repo/outcomes_repository.dart';
import 'outcomes_event.dart';
import 'outcomes_state.dart';

/// Phase 3 — owns the outcomes list ("my outcomes" for a rep, the
/// `PENDING` confirmation queue for a manager), outcome detail, and every
/// mutation (submit won/lost, confirm, reject/withdraw). One Bloc, three
/// independent sub-machines, same pattern as `ProjectsBloc`/
/// `ActivitiesBloc` (projects-implementation-map.md §8.4).
class OutcomesBloc extends Bloc<OutcomesEvent, OutcomesState> {
  final OutcomesRepository _outcomesRepository;

  OutcomesBloc(this._outcomesRepository) : super(const OutcomesState()) {
    on<OutcomeWonSubmitted>(_onWonSubmitted);
    on<OutcomeLostSubmitted>(_onLostSubmitted);
    on<OutcomesListRequested>(_onListRequested);
    on<OutcomesNextPageRequested>(_onNextPageRequested);
    on<OutcomeDetailRequested>(_onDetailRequested);
    on<OutcomeConfirmSubmitted>(_onConfirmSubmitted);
    on<OutcomeRejectSubmitted>(_onRejectSubmitted);
    on<OutcomeRetryRequested>(_onRetryRequested);
  }

  // ── list ──────────────────────────────────────────────────────────────

  Future<void> _onListRequested(
    OutcomesListRequested event,
    Emitter<OutcomesState> emit,
  ) async {
    emit(
      state.copyWith(
        filter: event.filter,
        listStatus: OutcomesFeedStatus.loading,
        listErrorMessage: null,
      ),
    );
    await _loadList(emit, page: 1, append: false);
  }

  Future<void> _onNextPageRequested(
    OutcomesNextPageRequested event,
    Emitter<OutcomesState> emit,
  ) async {
    final pagination = state.pagination;
    if (pagination == null || pagination.page >= pagination.totalPages) {
      return;
    }
    emit(state.copyWith(listStatus: OutcomesFeedStatus.paginationLoading));
    await _loadList(emit, page: pagination.page + 1, append: true);
  }

  Future<void> _onRetryRequested(
    OutcomeRetryRequested event,
    Emitter<OutcomesState> emit,
  ) async {
    emit(
      state.copyWith(
        listStatus: OutcomesFeedStatus.loading,
        listErrorMessage: null,
      ),
    );
    await _loadList(emit, page: 1, append: false);
  }

  Future<void> _loadList(
    Emitter<OutcomesState> emit, {
    required int page,
    required bool append,
  }) async {
    final filter = state.filter;
    final result = await _outcomesRepository.list(
      page: page,
      status: filter.status,
      type: filter.type,
      projectId: filter.projectId,
      submittedBy: filter.submittedBy,
    );
    switch (result) {
      case Success(data: final response):
        final items = append
            ? [...state.outcomes, ...response.data]
            : response.data;
        emit(
          state.copyWith(
            listStatus: items.isEmpty
                ? OutcomesFeedStatus.empty
                : OutcomesFeedStatus.loaded,
            outcomes: items,
            pagination: response.pagination,
          ),
        );
      case Failure(error: final error):
        emit(
          state.copyWith(
            listStatus: OutcomesFeedStatus.networkError,
            listErrorMessage: error.message,
          ),
        );
    }
  }

  // ── detail ───────────────────────────────────────────────────────────

  Future<void> _onDetailRequested(
    OutcomeDetailRequested event,
    Emitter<OutcomesState> emit,
  ) async {
    emit(
      state.copyWith(
        detailStatus: OutcomeDetailStatus.loading,
        detailErrorMessage: null,
      ),
    );
    final result = await _outcomesRepository.getById(event.id);
    switch (result) {
      case Success(data: final outcome):
        emit(
          state.copyWith(
            detailStatus: OutcomeDetailStatus.loaded,
            selectedOutcome: outcome,
          ),
        );
      case Failure(error: final error):
        emit(
          state.copyWith(
            detailStatus: error.code == 'OUTCOME_NOT_FOUND'
                ? OutcomeDetailStatus.notFound
                : OutcomeDetailStatus.networkError,
            detailErrorMessage: error.message,
          ),
        );
    }
  }

  // ── mutations ────────────────────────────────────────────────────────

  Future<void> _onWonSubmitted(
    OutcomeWonSubmitted event,
    Emitter<OutcomesState> emit,
  ) async {
    emit(
      state.copyWith(
        mutationStatus: OutcomeMutationStatus.inProgress,
        mutationErrorMessage: null,
      ),
    );
    final result = await _outcomesRepository.submitWon(
      event.projectId,
      event.request,
    );
    _emitMutationResult(result, emit);
  }

  Future<void> _onLostSubmitted(
    OutcomeLostSubmitted event,
    Emitter<OutcomesState> emit,
  ) async {
    emit(
      state.copyWith(
        mutationStatus: OutcomeMutationStatus.inProgress,
        mutationErrorMessage: null,
      ),
    );
    final result = await _outcomesRepository.submitLost(
      event.projectId,
      event.request,
    );
    _emitMutationResult(result, emit);
  }

  Future<void> _onConfirmSubmitted(
    OutcomeConfirmSubmitted event,
    Emitter<OutcomesState> emit,
  ) async {
    emit(
      state.copyWith(
        mutationStatus: OutcomeMutationStatus.inProgress,
        mutationErrorMessage: null,
      ),
    );
    final result = await _outcomesRepository.confirm(event.id);
    _emitMutationResult(result, emit);
  }

  Future<void> _onRejectSubmitted(
    OutcomeRejectSubmitted event,
    Emitter<OutcomesState> emit,
  ) async {
    emit(
      state.copyWith(
        mutationStatus: OutcomeMutationStatus.inProgress,
        mutationErrorMessage: null,
      ),
    );
    final result = await _outcomesRepository.reject(event.id, event.request);
    _emitMutationResult(result, emit);
  }

  void _emitMutationResult(
    ApiResult<dynamic> result,
    Emitter<OutcomesState> emit,
  ) {
    switch (result) {
      case Success(data: final outcome):
        emit(
          state.copyWith(
            mutationStatus: OutcomeMutationStatus.success,
            lastMutatedOutcome: outcome,
          ),
        );
      case Failure(error: final error):
        emit(
          state.copyWith(
            mutationStatus: _mutationStatusFor(error),
            mutationErrorMessage: error.message,
          ),
        );
    }
  }

  /// § "Outcomes" error-code table + confirm/reject's own tables, collapsed
  /// onto the states the UI branches on.
  OutcomeMutationStatus _mutationStatusFor(ApiErrorModel error) {
    switch (error.code) {
      case 'PROJECT_OUTCOME_SELF_CONFIRMATION':
        return OutcomeMutationStatus.selfConfirmation;
      case 'PROJECT_CONFIRMATION_REQUIRES_MANAGER':
        return OutcomeMutationStatus.confirmationRequiresManager;
      case 'PROJECT_OUTCOME_ALREADY_SETTLED':
        return OutcomeMutationStatus.alreadySettled;
      case 'PROJECT_OUTCOME_ALREADY_OPEN':
        return OutcomeMutationStatus.alreadyOpen;
      case 'PROJECT_DISTRIBUTOR_NOT_FOUND':
        return OutcomeMutationStatus.distributorNotFound;
      case 'PROJECT_COMPETITOR_NOT_FOUND':
        return OutcomeMutationStatus.competitorNotFound;
      case 'PROJECT_LOSS_REQUIRES_WINNER':
        return OutcomeMutationStatus.lossRequiresWinner;
      case 'PROJECT_LOSS_PRICE_REQUIRED':
        return OutcomeMutationStatus.lossPriceRequired;
      case 'PROJECT_UNITS_EXCEED_TOTAL':
        return OutcomeMutationStatus.unitsExceedTotal;
      case 'OUTCOME_NOT_FOUND':
      case 'PROJECT_NOT_FOUND':
        return OutcomeMutationStatus.notFound;
      case 'PROJECT_CANCELLED':
        return OutcomeMutationStatus.projectCancelled;
      case 'PROJECT_DISTRIBUTOR_REQUIRED':
      case 'VALIDATION_ERROR':
        return OutcomeMutationStatus.validationError;
      default:
        return OutcomeMutationStatus.networkError;
    }
  }
}
