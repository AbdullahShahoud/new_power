import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/activity_detail_view.dart';
import '../../data/models/activity_view.dart';
import '../../data/models/actor_view.dart';
import '../../data/models/attention_item_view.dart';
import 'activities_filter.dart';

part 'activities_state.freezed.dart';

/// Shared by the attention list and the activities list — both are
/// `Initial/Idle → Loading → Loaded → Empty/NetworkError`; only the
/// activities list uses `paginationLoading` (attention has no pagination,
/// §1.3's second explicit exception).
enum ActivitiesFeedStatus {
  initial,
  loading,
  loaded,
  paginationLoading,
  empty,
  networkError,
}

enum ActivityDetailStatus { idle, loading, loaded, notFound, networkError }

/// §7-style collapse of every documented Activities error code onto the
/// states the UI branches on (mirrors `ProjectMutationStatus` — see the
/// Phase 1 review that caught `ProjectMutationStatus` missing several
/// codes; this one is built with the full table from the start).
enum ActivityMutationStatus {
  idle,
  inProgress,
  success,
  validationError,

  /// `ACTIVITY_NOT_AUTHOR` (only the author may edit, any rank) or
  /// `ACTIVITY_BACKDATING_NEEDS_MANAGER` (an `occurredAt` > 48h back).
  permissionDenied,
  notFound,
  projectCancelled,

  /// `NO_INTERNET` / `CONNECTION_TIMEOUT` / `SEND_TIMEOUT` — genuinely no
  /// signal, as opposed to a server-side rejection. The one status
  /// `log_activity_screen.dart` reacts to by queuing the attempt locally
  /// instead of just showing an error (§10 Workflow 5, Phase 4).
  offline,
  networkError,
}

/// One freezed state grouping four independent sub-machines — attention,
/// list, detail, mutation — same reasoning as `ProjectsState` (a rep can
/// have the attention list loaded *and* an activity detail open *and* a
/// log-submission in flight at once).
@freezed
sealed class ActivitiesState with _$ActivitiesState {
  const factory ActivitiesState({
    // ── needs-attention (Home tab; not wired yet — §12) ──────────────────
    @Default(ActivitiesFeedStatus.initial) ActivitiesFeedStatus attentionStatus,
    @Default(<AttentionItemView>[]) List<AttentionItemView> attentionItems,
    String? attentionErrorMessage,

    // ── list (project-scoped or "your own feed") ─────────────────────────
    @Default(ActivitiesFeedStatus.initial) ActivitiesFeedStatus listStatus,
    @Default(<ActivityView>[]) List<ActivityView> activities,
    PaginationMeta? pagination,
    @Default(ActivitiesFilter()) ActivitiesFilter filter,
    String? listErrorMessage,

    // ── detail ────────────────────────────────────────────────────────
    @Default(ActivityDetailStatus.idle) ActivityDetailStatus detailStatus,
    ActivityDetailView? selectedActivity,
    String? detailErrorMessage,

    // ── mutation (log / edit) ────────────────────────────────────────────
    @Default(ActivityMutationStatus.idle) ActivityMutationStatus mutationStatus,
    ActivityView? lastMutatedActivity,
    String? lastLogSuggestion,
    String? mutationErrorMessage,
  }) = _ActivitiesState;
}
