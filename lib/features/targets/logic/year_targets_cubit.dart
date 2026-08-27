import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/api_result.dart';
import '../data/models/attainment_view.dart';
import '../data/repo/targets_repository.dart';

/// One quarter's worth of the year view.
///
/// A quarter that returns no targets is **not** an error and not an empty
/// variant of one — it means no manager has published a target covering
/// those months. That is the normal state of Q4 in January, so it has to
/// render as a plain "nothing published", never as a failure.
class QuarterAttainment {
  /// 1–4.
  final int quarter;

  /// Wire period this row was fetched with, e.g. `2026-Q3`. Kept so the UI
  /// never has to re-derive it and the two cannot disagree.
  final String period;

  /// Usually one row. **Two after a mid-period transfer** — both halves of
  /// the rep's own quarter (see [MyAttainmentView.targets]).
  final List<AttainmentView> targets;

  /// Set only when this quarter's own request failed. The other three are
  /// unaffected — one bad quarter must not blank the year.
  final String? errorMessage;

  const QuarterAttainment({
    required this.quarter,
    required this.period,
    this.targets = const [],
    this.errorMessage,
  });

  bool get hasError => errorMessage != null;
  bool get isEmpty => !hasError && targets.isEmpty;

  /// True once every target in the quarter is closed. Drives the "finished"
  /// styling — on a closed period `BEHIND` is a fact, not a live warning.
  bool get isClosed => targets.isNotEmpty && targets.every((t) => t.closed);
}

enum YearTargetsStatus { initial, loading, loaded, networkError }

class YearTargetsState {
  final YearTargetsStatus status;
  final int year;
  final List<QuarterAttainment> quarters;

  /// Set only when **every** quarter failed — a genuine "cannot reach the
  /// server", as opposed to one quarter erroring while the rest arrived.
  final String? errorMessage;

  const YearTargetsState({
    this.status = YearTargetsStatus.initial,
    required this.year,
    this.quarters = const [],
    this.errorMessage,
  });

  YearTargetsState copyWith({
    YearTargetsStatus? status,
    int? year,
    List<QuarterAttainment>? quarters,
    String? errorMessage,
  }) => YearTargetsState(
    status: status ?? this.status,
    year: year ?? this.year,
    quarters: quarters ?? this.quarters,
    errorMessage: errorMessage,
  );

  /// Quarters that actually carry a published target, for the year summary.
  List<AttainmentView> get publishedTargets => [
    for (final q in quarters) ...q.targets,
  ];
}

/// Every quarter of one year — `GET /attainment/me` four times.
///
/// **Four requests rather than one `period=2026`.** A year period resolves
/// to a single window and returns the targets covering *it*, which is a
/// year-shaped answer: one row for an annual target, or the quarters summed
/// into a figure that hides which quarter went wrong. This screen exists to
/// show the quarters apart, so it asks for them apart. The `period` grammar
/// (§4.1) is the same resolver on every route, so `2026-Q1` here and the
/// home card's implicit current quarter can never disagree about which days
/// a quarter contains.
///
/// Issued in parallel: they are independent reads and the endpoint shares
/// the 30-request-per-minute budget with the catalogue and the directory —
/// four at once is well inside it, and serialising them would quadruple the
/// time the screen spends empty.
///
/// A **factory**, not a singleton like [MyTargetsCubit]: this is a pushed
/// screen rather than a tab that must survive an `IndexedStack`, and the
/// year being viewed is per-visit state.
class YearTargetsCubit extends Cubit<YearTargetsState> {
  final TargetsRepository _repository;

  YearTargetsCubit(this._repository, {int? initialYear})
    : super(YearTargetsState(year: initialYear ?? DateTime.now().year));

  /// The quarter the calendar is in right now, or null when [state.year] is
  /// not the current year. Used only for highlighting.
  static int? currentQuarterOf(int year) {
    final now = DateTime.now();
    if (now.year != year) return null;
    return ((now.month - 1) ~/ 3) + 1;
  }

  Future<void> load({int? year, bool refresh = false}) async {
    final target = year ?? state.year;
    if (!refresh &&
        state.status == YearTargetsStatus.loaded &&
        target == state.year) {
      return;
    }

    emit(
      state.copyWith(
        status: YearTargetsStatus.loading,
        year: target,
        quarters: const [],
        errorMessage: null,
      ),
    );

    final results = await Future.wait([
      for (var q = 1; q <= 4; q++) _fetchQuarter(target, q),
    ]);

    if (isClosed) return;

    // Only a total failure is a failed screen. If even one quarter answered,
    // show the year with that quarter's own error inline — a rep whose Q3
    // request timed out should still be able to read Q1 and Q2.
    final allFailed = results.every((q) => q.hasError);
    emit(
      state.copyWith(
        status: allFailed
            ? YearTargetsStatus.networkError
            : YearTargetsStatus.loaded,
        quarters: results,
        errorMessage: allFailed ? results.first.errorMessage : null,
      ),
    );
  }

  Future<void> changeYear(int year) => load(year: year, refresh: true);

  Future<QuarterAttainment> _fetchQuarter(int year, int quarter) async {
    final period = '$year-Q$quarter';
    final result = await _repository.myAttainment(period: period);

    // `is Failure` rather than a switch: freezed generates ApiResult as a
    // plain abstract class, so the analyzer cannot prove a switch on it is
    // exhaustive. Same idiom as MyTargetsCubit.
    if (result is Failure<MyAttainmentView>) {
      return QuarterAttainment(
        quarter: quarter,
        period: period,
        errorMessage: result.error.message,
      );
    }
    return QuarterAttainment(
      quarter: quarter,
      period: period,
      targets: (result as Success<MyAttainmentView>).data.targets,
    );
  }
}
