import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/attainment_enums.dart';
import '../../data/models/attainment_period.dart';
import '../../data/models/attainment_view.dart';

part 'attainment_state.freezed.dart';

enum AttainmentStatus {
  initial,
  loading,

  /// A 200 with at least one row.
  loaded,

  /// A 200 with `targets: []`. **A normal answer, not a failure** — nothing
  /// has been published for the selected period yet. Kept distinct from
  /// [error] so the screen renders an empty state rather than a retry.
  empty,

  /// A 403: the caller is not a `REPRESENTATIVE`. Terminal — retrying
  /// cannot change the answer, so the screen offers no retry for it.
  forbidden,

  error,
}

@freezed
sealed class AttainmentState with _$AttainmentState {
  const factory AttainmentState({
    @Default(AttainmentStatus.initial) AttainmentStatus status,
    MyAttainmentView? view,

    /// What the current [view] was fetched with — not what is selected.
    /// The selectors below change first and the fetch follows, so a
    /// mid-flight rebuild must not label old numbers with a new period.
    required AttainmentPeriod period,
    @Default(AttainmentMetric.salesValue) AttainmentMetric metric,
    @Default(AttainmentSort.periodAsc) AttainmentSort sort,

    /// Set while a *reload* is in flight over rows that are already on
    /// screen — the period/metric changed, or the rep pulled to refresh.
    /// The old numbers stay visible underneath rather than collapsing to a
    /// skeleton.
    @Default(false) bool isRefreshing,
    String? errorMessage,
  }) = _AttainmentState;
}

extension AttainmentStateX on AttainmentState {
  /// The rows in the rep's chosen order.
  ///
  /// Sorting is **client-side**: the route has no sort parameter, and any
  /// unknown query key is a 400. `periodAsc` is the server's own order.
  List<AttainmentView> get sortedTargets {
    final rows = [...?view?.targets];
    switch (sort) {
      case AttainmentSort.periodAsc:
        rows.sort((a, b) => a.periodStart.compareTo(b.periodStart));
      case AttainmentSort.periodDesc:
        rows.sort((a, b) => b.periodStart.compareTo(a.periodStart));
      case AttainmentSort.attainmentDesc:
        rows.sort((a, b) => b.attainedPct.compareTo(a.attainedPct));
      case AttainmentSort.remainingDesc:
        rows.sort(
          (a, b) => b.remainingAmount.compareTo(a.remainingAmount),
        );
    }
    return rows;
  }

  /// The one combined figure across every row — see [MyAttainmentViewX].
  AttainmentRollup? get rollup => view?.rollup;

  bool get hasRows => (view?.targets.isNotEmpty ?? false);
}
