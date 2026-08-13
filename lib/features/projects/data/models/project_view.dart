import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/utc_date_time_converter.dart';
import 'actor_view.dart';
import 'enums.dart';
import 'project_image_view.dart';

part 'project_view.freezed.dart';
part 'project_view.g.dart';

/// §9 `ProjectView` — returned by `PATCH /projects/{id}`, `PUT …/stage`,
/// `PUT …/status`, `PUT …/location`. Every `…By`/`…ByUser` field is
/// nullable/optional: stripped entirely for a `REPRESENTATIVE` (§1.7).
@freezed
abstract class ProjectView with _$ProjectView {
  // ignore: invalid_annotation_target
  @JsonSerializable(converters: [UtcDateTimeConverter()])
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
  // ignore: invalid_annotation_target
  @JsonSerializable(converters: [UtcDateTimeConverter()])
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

    /// §5 `GET /projects` documents list rows as carrying `imageCount` but
    /// **no `images` array** ("fetch one project to get photos"). Modeled
    /// as optional-with-empty-default anyway: if the backend does include
    /// it, the list card shows a real thumbnail for free; if it doesn't,
    /// this stays empty and the card falls back to a placeholder. The
    /// alternative — one `GET /projects/{id}` per visible row just for a
    /// thumbnail — is an N+1 the doc is explicitly steering away from.
    @Default(<ProjectImageView>[]) List<ProjectImageView> images,
  }) = _ProjectSummaryView;

  factory ProjectSummaryView.fromJson(Map<String, dynamic> json) =>
      _$ProjectSummaryViewFromJson(json);
}
