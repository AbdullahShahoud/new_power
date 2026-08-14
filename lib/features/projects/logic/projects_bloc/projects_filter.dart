import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/enums.dart';

part 'projects_filter.freezed.dart';

/// The active `GET /projects` query, held in `ProjectsState` so
/// `ProjectsNextPageRequested`/`ProjectsListRefreshed` (which carry no
/// filter params of their own, per projects-implementation-map.md §8.2)
/// know what to replay. Bloc-internal only — not a wire model.
@freezed
sealed class ProjectsFilter with _$ProjectsFilter {
  const factory ProjectsFilter({
    ProjectStage? stage,
    ProjectStatus? status,
    ConstructionPhase? constructionPhase,
    BuildingType? buildingType,
    String? territoryId,
    String? search,
    String? near,
    DateTime? updatedSince,
  }) = _ProjectsFilter;
}
