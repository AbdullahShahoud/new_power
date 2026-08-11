import 'package:freezed_annotation/freezed_annotation.dart';
import 'actor_view.dart';
import 'enums.dart';

part 'project_view.freezed.dart';
part 'project_view.g.dart';

/// §9 `ProjectView` — returned by `PATCH /projects/{id}`, `PUT …/stage`,
/// `PUT …/status`, `PUT …/location`. Every `…By`/`…ByUser` field is
/// nullable/optional: stripped entirely for a `REPRESENTATIVE` (§1.7).
@freezed
abstract class ProjectView with _$ProjectView {
  const factory ProjectView({
    required String id,
    required String name,
    required BuildingType buildingType,
    required String description,
    required double latitude,
    required double longitude,
    String? addressLine,
    String? territoryId,
    TerritoryRefView? territory,
    @Default(false) bool outsideTerritory,
    required ConstructionPhase constructionPhase,
    required ProjectStage stage,
    required ProjectStatus status,
    required String ownerId,
    ActorView? owner,
    int? unitCount,
    double? estimatedValue,
    String? currency,
    String? notes,
    DateTime? lastActivityAt,
    DateTime? nextActionAt,
    DateTime? closedAt,
    String? closedBy,
    required int version,
    String? createdBy,
    ActorView? createdByUser,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ProjectView;

  factory ProjectView.fromJson(Map<String, dynamic> json) =>
      _$ProjectViewFromJson(json);
}

/// §9 `ProjectSummaryView` — `GET /projects` list rows. `distanceM` is only
/// present on a `near=` query; do not assume the key exists otherwise.
@freezed
abstract class ProjectSummaryView with _$ProjectSummaryView {
  const factory ProjectSummaryView({
    required String id,
    required String name,
    required BuildingType buildingType,
    required String description,
    required double latitude,
    required double longitude,
    String? addressLine,
    String? territoryId,
    TerritoryRefView? territory,
    @Default(false) bool outsideTerritory,
    required ConstructionPhase constructionPhase,
    required ProjectStage stage,
    required ProjectStatus status,
    required String ownerId,
    ActorView? owner,
    int? unitCount,
    double? estimatedValue,
    String? currency,
    String? notes,
    DateTime? lastActivityAt,
    DateTime? nextActionAt,
    DateTime? closedAt,
    String? closedBy,
    required int version,
    String? createdBy,
    ActorView? createdByUser,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int imageCount,
    required int activityCount,
    required int stakeholderCount,
    double? distanceM,
  }) = _ProjectSummaryView;

  factory ProjectSummaryView.fromJson(Map<String, dynamic> json) =>
      _$ProjectSummaryViewFromJson(json);
}
