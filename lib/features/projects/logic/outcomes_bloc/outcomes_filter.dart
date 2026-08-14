import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/enums.dart';

part 'outcomes_filter.freezed.dart';

/// The active `GET /outcomes` query, held in `OutcomesState` so
/// `OutcomesNextPageRequested` (which carries no filter params of its own)
/// knows what to replay — same pattern as `ProjectsFilter`/`ActivitiesFilter`.
@freezed
sealed class OutcomesFilter with _$OutcomesFilter {
  const factory OutcomesFilter({
    OutcomeStatus? status,
    OutcomeType? type,
    String? projectId,
    String? submittedBy,
  }) = _OutcomesFilter;
}
