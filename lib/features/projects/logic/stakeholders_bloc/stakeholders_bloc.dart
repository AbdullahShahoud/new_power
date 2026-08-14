import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/repo/stakeholders_repository.dart';
import '../stakeholder_mutation_status.dart';
import 'stakeholders_event.dart';
import 'stakeholders_state.dart';

/// Phase 6 — a project's stakeholder links + decision-maker flag/history.
/// Fresh per project-detail screen instance (factory), same as
/// `ActivitiesBloc`/`OutcomesBloc`.
class StakeholdersBloc extends Bloc<StakeholdersEvent, StakeholdersState> {
  final StakeholdersRepository _repository;

  StakeholdersBloc(this._repository) : super(const StakeholdersState()) {
    on<StakeholderLinksListRequested>(_onLinksListRequested);
    on<StakeholderLinkAddSubmitted>(_onLinkAddSubmitted);
    on<StakeholderPersonAdded>(_onPersonAdded);
    on<StakeholderPersonAddedToCompany>(_onPersonAddedToCompany);
    on<StakeholderLinkPatchSubmitted>(_onLinkPatchSubmitted);
    on<StakeholderLinkCloseSubmitted>(_onLinkCloseSubmitted);
    on<StakeholderLinkReplaceSubmitted>(_onLinkReplaceSubmitted);
    on<DecisionMakerRequested>(_onDecisionMakerRequested);
    on<DecisionMakerSetSubmitted>(_onDecisionMakerSetSubmitted);
    on<DecisionMakerRemoveSubmitted>(_onDecisionMakerRemoveSubmitted);
    on<DecisionMakerHistoryRequested>(_onDecisionMakerHistoryRequested);
  }

  // ── links ────────────────────────────────────────────────────────────

  Future<void> _onLinksListRequested(
    StakeholderLinksListRequested event,
    Emitter<StakeholdersState> emit,
  ) async {
    emit(
      state.copyWith(
        linksStatus: StakeholderLinksFeedStatus.loading,
        linksErrorMessage: null,
      ),
    );
    final result = await _repository.getStakeholderLinks(
      event.projectId,
      includeClosed: event.includeClosed,
    );
    switch (result) {
      case Success(data: final links):
        emit(
          state.copyWith(
            linksStatus: links.isEmpty
                ? StakeholderLinksFeedStatus.empty
                : StakeholderLinksFeedStatus.loaded,
            links: links,
          ),
        );
      case Failure(error: final error):
        emit(
          state.copyWith(
            linksStatus: StakeholderLinksFeedStatus.networkError,
            linksErrorMessage: error.message,
          ),
        );
    }
  }

  Future<void> _onLinkAddSubmitted(
    StakeholderLinkAddSubmitted event,
    Emitter<StakeholdersState> emit,
  ) async {
    emit(
      state.copyWith(
        linkMutationStatus: StakeholderMutationStatus.inProgress,
        linkMutationErrorMessage: null,
      ),
    );
    final result = await _repository.addStakeholderLink(
      event.projectId,
      event.request,
    );
    _emitLinkMutationResult(result, emit, appendIfNew: true);
  }

  Future<void> _onPersonAdded(
    StakeholderPersonAdded event,
    Emitter<StakeholdersState> emit,
  ) async {
    emit(
      state.copyWith(
        linkMutationStatus: StakeholderMutationStatus.inProgress,
        linkMutationErrorMessage: null,
      ),
    );
    final result = await _repository.addStakeholderWithNewCompany(
      projectId: event.projectId,
      account: event.account,
      role: event.role,
      note: event.note,
    );
    _emitLinkMutationResult(result, emit, appendIfNew: true);
  }

  Future<void> _onPersonAddedToCompany(
    StakeholderPersonAddedToCompany event,
    Emitter<StakeholdersState> emit,
  ) async {
    emit(
      state.copyWith(
        linkMutationStatus: StakeholderMutationStatus.inProgress,
        linkMutationErrorMessage: null,
      ),
    );
    final result = await _repository.addStakeholderToExistingCompany(
      projectId: event.projectId,
      accountId: event.accountId,
      contact: event.contact,
      role: event.role,
      note: event.note,
    );
    _emitLinkMutationResult(result, emit, appendIfNew: true);
  }

  Future<void> _onLinkPatchSubmitted(
    StakeholderLinkPatchSubmitted event,
    Emitter<StakeholdersState> emit,
  ) async {
    emit(
      state.copyWith(
        linkMutationStatus: StakeholderMutationStatus.inProgress,
        linkMutationErrorMessage: null,
      ),
    );
    final result = await _repository.patchStakeholderLink(
      event.projectId,
      event.linkId,
      event.request,
    );
    _emitLinkMutationResult(result, emit);
  }

  Future<void> _onLinkCloseSubmitted(
    StakeholderLinkCloseSubmitted event,
    Emitter<StakeholdersState> emit,
  ) async {
    emit(
      state.copyWith(
        linkMutationStatus: StakeholderMutationStatus.inProgress,
        linkMutationErrorMessage: null,
      ),
    );
    final result = await _repository.closeStakeholderLink(
      event.projectId,
      event.linkId,
      event.request,
    );
    _emitLinkMutationResult(result, emit, removeIfClosed: true);
  }

  Future<void> _onLinkReplaceSubmitted(
    StakeholderLinkReplaceSubmitted event,
    Emitter<StakeholdersState> emit,
  ) async {
    emit(
      state.copyWith(
        linkMutationStatus: StakeholderMutationStatus.inProgress,
        linkMutationErrorMessage: null,
      ),
    );
    final result = await _repository.replaceStakeholderLink(
      event.projectId,
      event.linkId,
      event.request,
    );
    // A replace closes the outgoing link and opens a new one — simplest
    // correct client reaction is to reload the roster rather than patch
    // one row in place (the response is the *new* link, not the old one).
    switch (result) {
      case Success(data: final link):
        emit(
          state.copyWith(
            linkMutationStatus: StakeholderMutationStatus.success,
            lastMutatedLink: link,
          ),
        );
        add(StakeholdersEvent.linksListRequested(projectId: event.projectId));
      case Failure(error: final error):
        emit(
          state.copyWith(
            linkMutationStatus: stakeholderMutationStatusFor(error),
            linkMutationErrorMessage: error.message,
          ),
        );
    }
  }

  void _emitLinkMutationResult(
    ApiResult<dynamic> result,
    Emitter<StakeholdersState> emit, {
    bool appendIfNew = false,
    bool removeIfClosed = false,
  }) {
    switch (result) {
      case Success(data: final link):
        final updatedLinks = [...state.links];
        final index = updatedLinks.indexWhere((l) => l.id == link.id);
        if (removeIfClosed) {
          if (index >= 0) updatedLinks.removeAt(index);
        } else if (index >= 0) {
          updatedLinks[index] = link;
        } else if (appendIfNew) {
          updatedLinks.add(link);
        }
        emit(
          state.copyWith(
            linkMutationStatus: StakeholderMutationStatus.success,
            lastMutatedLink: link,
            links: updatedLinks,
          ),
        );
      case Failure(error: final error):
        emit(
          state.copyWith(
            linkMutationStatus: stakeholderMutationStatusFor(error),
            linkMutationErrorMessage: error.message,
          ),
        );
    }
  }

  // ── decision maker ───────────────────────────────────────────────────

  Future<void> _onDecisionMakerRequested(
    DecisionMakerRequested event,
    Emitter<StakeholdersState> emit,
  ) async {
    emit(
      state.copyWith(
        decisionMakerStatus: DecisionMakerStatus.loading,
        decisionMakerErrorMessage: null,
      ),
    );
    final result = await _repository.getDecisionMaker(event.projectId);
    switch (result) {
      case Success(data: final decisionMaker):
        emit(
          state.copyWith(
            decisionMakerStatus: DecisionMakerStatus.loaded,
            decisionMaker: decisionMaker,
          ),
        );
      case Failure(error: final error):
        emit(
          state.copyWith(
            decisionMakerStatus: DecisionMakerStatus.networkError,
            decisionMakerErrorMessage: error.message,
          ),
        );
    }
  }

  Future<void> _onDecisionMakerSetSubmitted(
    DecisionMakerSetSubmitted event,
    Emitter<StakeholdersState> emit,
  ) async {
    emit(
      state.copyWith(
        decisionMakerMutationStatus: StakeholderMutationStatus.inProgress,
        decisionMakerMutationErrorMessage: null,
      ),
    );
    final result = await _repository.setDecisionMaker(
      event.projectId,
      event.request,
    );
    _emitDecisionMakerMutationResult(result, emit);
  }

  Future<void> _onDecisionMakerRemoveSubmitted(
    DecisionMakerRemoveSubmitted event,
    Emitter<StakeholdersState> emit,
  ) async {
    emit(
      state.copyWith(
        decisionMakerMutationStatus: StakeholderMutationStatus.inProgress,
        decisionMakerMutationErrorMessage: null,
      ),
    );
    final result = await _repository.removeDecisionMaker(
      event.projectId,
      event.request,
    );
    _emitDecisionMakerMutationResult(result, emit);
  }

  void _emitDecisionMakerMutationResult(
    ApiResult<dynamic> result,
    Emitter<StakeholdersState> emit,
  ) {
    switch (result) {
      case Success(data: final decisionMaker):
        emit(
          state.copyWith(
            decisionMakerMutationStatus: StakeholderMutationStatus.success,
            decisionMakerStatus: DecisionMakerStatus.loaded,
            decisionMaker: decisionMaker,
          ),
        );
      case Failure(error: final error):
        emit(
          state.copyWith(
            decisionMakerMutationStatus: stakeholderMutationStatusFor(error),
            decisionMakerMutationErrorMessage: error.message,
          ),
        );
    }
  }

  Future<void> _onDecisionMakerHistoryRequested(
    DecisionMakerHistoryRequested event,
    Emitter<StakeholdersState> emit,
  ) async {
    emit(
      state.copyWith(
        historyStatus: DecisionMakerHistoryStatus.loading,
        historyErrorMessage: null,
      ),
    );
    final result = await _repository.getDecisionMakerHistory(event.projectId);
    switch (result) {
      case Success(data: final history):
        emit(
          state.copyWith(
            historyStatus: history.isEmpty
                ? DecisionMakerHistoryStatus.empty
                : DecisionMakerHistoryStatus.loaded,
            history: history,
          ),
        );
      case Failure(error: final error):
        emit(
          state.copyWith(
            historyStatus: DecisionMakerHistoryStatus.networkError,
            historyErrorMessage: error.message,
          ),
        );
    }
  }
}
