import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/networking/api_result.dart';
import '../data/models/attainment_view.dart';
import '../data/repo/targets_repository.dart';

enum MyTargetsStatus { initial, loading, loaded, empty, networkError }

class MyTargetsState {
  final MyTargetsStatus status;
  final List<AttainmentView> targets;
  final String? asOf;
  final String? errorMessage;

  const MyTargetsState({
    this.status = MyTargetsStatus.initial,
    this.targets = const [],
    this.asOf,
    this.errorMessage,
  });

  MyTargetsState copyWith({
    MyTargetsStatus? status,
    List<AttainmentView>? targets,
    String? asOf,
    String? errorMessage,
  }) => MyTargetsState(
    status: status ?? this.status,
    targets: targets ?? this.targets,
    asOf: asOf ?? this.asOf,
    errorMessage: errorMessage,
  );
}

/// Backs the home screen's targets card.
///
/// A lazy singleton so the figure survives a tab switch: the home tab lives
/// in an `IndexedStack` and would otherwise re-request on every visit, and
/// this endpoint shares the same 30-request-per-minute budget as the
/// catalogue and the directory.
class MyTargetsCubit extends Cubit<MyTargetsState> {
  final TargetsRepository _repository;

  MyTargetsCubit(this._repository) : super(const MyTargetsState());

  Future<void> load({bool refresh = false}) async {
    // Already held and not an explicit refresh: keep it. Targets change
    // when an outcome is confirmed — a matter of days, not seconds.
    if (!refresh && state.status == MyTargetsStatus.loaded) return;

    emit(state.copyWith(status: MyTargetsStatus.loading, errorMessage: null));

    final result = await _repository.myAttainment();
    if (isClosed) return;

    if (result is Failure<MyAttainmentView>) {
      emit(
        state.copyWith(
          status: MyTargetsStatus.networkError,
          errorMessage: result.error.message,
        ),
      );
      return;
    }

    final data = (result as Success<MyAttainmentView>).data;
    emit(
      state.copyWith(
        // An empty list is a normal answer — nothing is published for this
        // period yet, which is not a failure and must not read as one.
        status: data.targets.isEmpty
            ? MyTargetsStatus.empty
            : MyTargetsStatus.loaded,
        targets: data.targets,
        asOf: data.asOf,
      ),
    );
  }
}
