import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/decision_maker_history_entry.dart';
import '../../data/models/decision_maker_view.dart';
import '../../data/models/stakeholder_link_view.dart';
import '../stakeholder_mutation_status.dart';

part 'stakeholders_state.freezed.dart';

enum StakeholderLinksFeedStatus { initial, loading, loaded, empty, networkError }

enum DecisionMakerStatus { initial, loading, loaded, networkError }

enum DecisionMakerHistoryStatus { initial, loading, loaded, empty, networkError }

/// Three sub-machines — links, decision-maker, decision-maker history — for
/// one project's stakeholder data, same reasoning as every other module
/// Bloc. `linkMutationStatus`/`decisionMakerMutationStatus` are separate
/// (a link edit and a decision-maker move are unrelated actions that can be
/// mid-flight independently).
@freezed
sealed class StakeholdersState with _$StakeholdersState {
  const factory StakeholdersState({
    // ── links ─────────────────────────────────────────────────────────
    @Default(StakeholderLinksFeedStatus.initial)
    StakeholderLinksFeedStatus linksStatus,
    @Default(<StakeholderLinkView>[]) List<StakeholderLinkView> links,
    String? linksErrorMessage,

    // ── link mutation (add / patch / close / replace) ────────────────
    @Default(StakeholderMutationStatus.idle)
    StakeholderMutationStatus linkMutationStatus,
    StakeholderLinkView? lastMutatedLink,
    String? linkMutationErrorMessage,

    // ── decision maker ────────────────────────────────────────────────
    @Default(DecisionMakerStatus.initial) DecisionMakerStatus decisionMakerStatus,
    DecisionMakerView? decisionMaker,
    String? decisionMakerErrorMessage,

    // ── decision-maker mutation (set / remove) ───────────────────────
    @Default(StakeholderMutationStatus.idle)
    StakeholderMutationStatus decisionMakerMutationStatus,
    String? decisionMakerMutationErrorMessage,

    // ── decision-maker history ───────────────────────────────────────
    @Default(DecisionMakerHistoryStatus.initial)
    DecisionMakerHistoryStatus historyStatus,
    @Default(<DecisionMakerHistoryEntry>[])
    List<DecisionMakerHistoryEntry> history,
    String? historyErrorMessage,
  }) = _StakeholdersState;
}
