import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/actor_view.dart';
import '../../data/models/outcome_view.dart';
import 'outcomes_filter.dart';

part 'outcomes_state.freezed.dart';

enum OutcomesFeedStatus {
  initial,
  loading,
  loaded,
  paginationLoading,
  empty,
  networkError,
}

enum OutcomeDetailStatus { idle, loading, loaded, notFound, networkError }

/// § "Outcomes" + confirm/reject error tables, collapsed onto the states
/// the UI branches on (projects-implementation-map.md §8.4) — built
/// complete from the start, informed by the Phase 1 review that caught
/// `ProjectMutationStatus` missing several codes on the first pass.
enum OutcomeMutationStatus {
  idle,
  inProgress,
  success,
  /// `PROJECT_OUTCOME_SELF_CONFIRMATION` — the four-eyes rule.
  selfConfirmation,
  /// `PROJECT_CONFIRMATION_REQUIRES_MANAGER` — only a manager settles one.
  confirmationRequiresManager,
  /// `PROJECT_OUTCOME_ALREADY_SETTLED` — already confirmed or rejected.
  alreadySettled,
  /// `PROJECT_OUTCOME_ALREADY_OPEN` — one open-or-confirmed outcome/project.
  alreadyOpen,
  /// `PROJECT_DISTRIBUTOR_NOT_FOUND`.
  distributorNotFound,
  /// `PROJECT_COMPETITOR_NOT_FOUND`.
  competitorNotFound,
  /// `PROJECT_LOSS_REQUIRES_WINNER` — nobody won, cancel instead.
  lossRequiresWinner,
  /// `PROJECT_LOSS_PRICE_REQUIRED` — `reason: PRICE` needs `competitorPrice`.
  lossPriceRequired,
  /// `PROJECT_UNITS_EXCEED_TOTAL`.
  unitsExceedTotal,
  validationError,
  /// `OUTCOME_NOT_FOUND` / `PROJECT_NOT_FOUND`.
  notFound,
  /// `PROJECT_CANCELLED` — defense-in-depth; a cancelled project's
  /// won/lost buttons shouldn't be reachable in the first place.
  projectCancelled,
  networkError,
}

/// One freezed state grouping three independent sub-machines — list,
/// detail, mutation — same pattern as `ProjectsState`/`ActivitiesState`.
@freezed
sealed class OutcomesState with _$OutcomesState {
  const factory OutcomesState({
    // ── list ("my outcomes" / manager's PENDING queue) ───────────────────
    @Default(OutcomesFeedStatus.initial) OutcomesFeedStatus listStatus,
    @Default(<OutcomeView>[]) List<OutcomeView> outcomes,
    PaginationMeta? pagination,
    @Default(OutcomesFilter()) OutcomesFilter filter,
    String? listErrorMessage,

    // ── detail ───────────────────────────────────────────────────────
    @Default(OutcomeDetailStatus.idle) OutcomeDetailStatus detailStatus,
    OutcomeView? selectedOutcome,
    String? detailErrorMessage,

    // ── mutation (submit won/lost, confirm, reject/withdraw) ─────────────
    @Default(OutcomeMutationStatus.idle) OutcomeMutationStatus mutationStatus,
    OutcomeView? lastMutatedOutcome,
    String? mutationErrorMessage,
  }) = _OutcomesState;
}
