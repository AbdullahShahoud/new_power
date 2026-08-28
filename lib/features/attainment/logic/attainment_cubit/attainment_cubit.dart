import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/models/attainment_enums.dart';
import '../../data/models/attainment_period.dart';
import '../../data/models/attainment_view.dart';
import '../../data/repo/attainment_repository.dart';
import 'attainment_state.dart';

/// The rep's own targets — one read-only screen over one endpoint.
///
/// A Cubit rather than a Bloc: there is no paging, no optimistic mutation
/// and no undo window here. The whole surface is "fetch, and re-fetch when
/// one of two selectors changes", which is three methods.
class AttainmentCubit extends Cubit<AttainmentState> {
  final AttainmentRepository _repository;

  AttainmentCubit(this._repository)
    : super(AttainmentState(period: AttainmentPeriod.currentQuarter()));

  /// Guards against a stale response overwriting a newer one: a rep tapping
  /// through the period list fires several reads, and they can land out of
  /// order. Only the newest request is allowed to emit.
  int _requestId = 0;

  /// First load. Safe to call again — it is what pull-to-refresh uses.
  Future<void> load() => _fetch(showSkeleton: state.view == null);

  Future<void> refresh() => _fetch(showSkeleton: false);

  /// ⚠️ Re-fetches. `period` selects a **window**, and which targets overlap
  /// it is the server's answer, not something this client can filter for
  /// itself out of the rows it already holds.
  Future<void> periodSelected(AttainmentPeriod period) {
    if (period == state.period) return Future.value();
    emit(state.copyWith(period: period));
    return _fetch(showSkeleton: false);
  }

  /// ⚠️ Also re-fetches, and cannot be done locally: one response carries
  /// one metric, and the count metrics have their own targets, their own
  /// `attained`, and a null currency.
  Future<void> metricSelected(AttainmentMetric metric) {
    if (metric == state.metric) return Future.value();
    emit(state.copyWith(metric: metric));
    return _fetch(showSkeleton: false);
  }

  /// Purely local — see [AttainmentStateX.sortedTargets].
  void sortSelected(AttainmentSort sort) {
    if (sort == state.sort) return;
    emit(state.copyWith(sort: sort));
  }

  Future<void> _fetch({required bool showSkeleton}) async {
    final requestId = ++_requestId;
    emit(
      state.copyWith(
        status: showSkeleton ? AttainmentStatus.loading : state.status,
        isRefreshing: !showSkeleton,
        errorMessage: null,
      ),
    );

    final result = await _repository.me(
      period: state.period,
      metric: state.metric,
    );
    if (isClosed || requestId != _requestId) return;

    switch (result) {
      case Success<MyAttainmentView>(:final data):
        emit(
          state.copyWith(
            // An empty `targets` is a 200 and a complete answer — the
            // period simply has nothing published against it. It is a
            // separate status so the screen shows an empty state instead
            // of an error with a retry that would change nothing.
            status: data.targets.isEmpty
                ? AttainmentStatus.empty
                : AttainmentStatus.loaded,
            view: data,
            isRefreshing: false,
            errorMessage: null,
          ),
        );
      case Failure<MyAttainmentView>(:final error):
        emit(
          state.copyWith(
            // A 403 is terminal: this route is `REPRESENTATIVE`-only by an
            // exact role match, so retrying cannot change the answer.
            status: AttainmentErrorCodes.isRoleRefusal(error.code)
                ? AttainmentStatus.forbidden
                : AttainmentStatus.error,
            isRefreshing: false,
            errorMessage: error.message,
          ),
        );
    }
  }
}
