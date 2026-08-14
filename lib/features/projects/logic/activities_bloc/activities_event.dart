import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/log_activity_request.dart';
import '../../data/models/patch_activity_request.dart';
import 'activities_filter.dart';

part 'activities_event.freezed.dart';

/// projects-implementation-map.md §8.3.
@freezed
sealed class ActivitiesEvent with _$ActivitiesEvent {
  const factory ActivitiesEvent.attentionListRequested() =
      AttentionListRequested;

  const factory ActivitiesEvent.logSubmitted({
    required String projectId,
    required LogActivityRequest request,
  }) = ActivityLogSubmitted;

  /// Replaces the active filter wholesale and reloads page 1 — pass the
  /// current `state.filter` with one field changed, same convention as
  /// `ProjectsEvent.filterChanged`.
  const factory ActivitiesEvent.listRequested(ActivitiesFilter filter) =
      ActivitiesListRequested;

  const factory ActivitiesEvent.nextPageRequested() =
      ActivitiesNextPageRequested;

  const factory ActivitiesEvent.detailRequested(String id) =
      ActivityDetailRequested;

  const factory ActivitiesEvent.editSubmitted({
    required String id,
    required PatchActivityRequest request,
  }) = ActivityEditSubmitted;

  /// Retries whichever feed most recently failed — scoped to the list feed
  /// (the one case with a diagrammed retry, same as `ProjectRetryRequested`
  /// in Phase 1); the attention/detail/mutation failures are retried by
  /// re-dispatching the specific event that failed.
  const factory ActivitiesEvent.retryRequested() = ActivityRetryRequested;
}
