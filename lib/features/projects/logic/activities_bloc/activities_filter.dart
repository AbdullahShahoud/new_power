import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/enums.dart';

part 'activities_filter.freezed.dart';

/// The active `GET /activities` (or `GET /projects/{projectId}/activities`)
/// query, held in `ActivitiesState` so `ActivitiesNextPageRequested` (which
/// carries no filter params of its own) knows what to replay — same
/// pattern as `ProjectsFilter`. `projectId` is null for "your own feed" and
/// set for a project-scoped feed (§8.3's `ActivitiesListRequested(projectId?, filters)`).
@freezed
sealed class ActivitiesFilter with _$ActivitiesFilter {
  const factory ActivitiesFilter({
    String? projectId,
    ActivityKind? kind,
    ActivityPurpose? purpose,
    ActivityOutcome? outcome,
    String? createdBy,
    DateTime? occurredFrom,
    DateTime? occurredTo,
    bool? editedAfterWindowOnly,
  }) = _ActivitiesFilter;
}
