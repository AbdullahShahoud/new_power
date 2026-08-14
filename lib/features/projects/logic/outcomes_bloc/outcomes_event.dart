import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/reject_outcome_request.dart';
import '../../data/models/submit_lost_request.dart';
import '../../data/models/submit_won_request.dart';
import 'outcomes_filter.dart';

part 'outcomes_event.freezed.dart';

/// projects-implementation-map.md §8.4.
@freezed
sealed class OutcomesEvent with _$OutcomesEvent {
  const factory OutcomesEvent.wonSubmitted({
    required String projectId,
    required SubmitWonRequest request,
  }) = OutcomeWonSubmitted;

  const factory OutcomesEvent.lostSubmitted({
    required String projectId,
    required SubmitLostRequest request,
  }) = OutcomeLostSubmitted;

  const factory OutcomesEvent.listRequested(OutcomesFilter filter) =
      OutcomesListRequested;

  const factory OutcomesEvent.nextPageRequested() = OutcomesNextPageRequested;

  const factory OutcomesEvent.detailRequested(String id) =
      OutcomeDetailRequested;

  /// `SALES_MANAGER`-only server-side; not dispatched from any Phase-3
  /// screen yet (see `OutcomesRepository.confirm`'s doc comment) but kept
  /// so the Bloc's contract is complete.
  const factory OutcomesEvent.confirmSubmitted(String id) =
      OutcomeConfirmSubmitted;

  const factory OutcomesEvent.rejectSubmitted({
    required String id,
    required RejectOutcomeRequest request,
  }) = OutcomeRejectSubmitted;

  const factory OutcomesEvent.retryRequested() = OutcomeRetryRequested;
}
