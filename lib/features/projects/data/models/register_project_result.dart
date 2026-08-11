import 'package:freezed_annotation/freezed_annotation.dart';
import 'actor_view.dart';
import 'enums.dart';
import 'nearby_project_card_view.dart';
import 'project_image_view.dart';

part 'register_project_result.freezed.dart';
part 'register_project_result.g.dart';

/// §9 `ProjectSummaryView & { images: ProjectImageView[] }` — flattened
/// (same reasoning as `ProjectImageView extends StoredFileView`): the
/// registration response's project card, with photos attached.
@freezed
abstract class RegisteredProjectView with _$RegisteredProjectView {
  const factory RegisteredProjectView({
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
    @Default(<ProjectImageView>[]) List<ProjectImageView> images,
  }) = _RegisteredProjectView;

  factory RegisteredProjectView.fromJson(Map<String, dynamic> json) =>
      _$RegisteredProjectViewFromJson(json);
}

/// §9 — `{ accountId, reason }` per failed stakeholder link on registration
/// (a link failure never fails the whole request — Workflow 2).
@freezed
abstract class StakeholderLinkFailure with _$StakeholderLinkFailure {
  const factory StakeholderLinkFailure({
    required String accountId,
    required String reason,
  }) = _StakeholderLinkFailure;

  factory StakeholderLinkFailure.fromJson(Map<String, dynamic> json) =>
      _$StakeholderLinkFailureFromJson(json);
}

/// §9 `RegisterProjectResult` — `data` of `POST /projects`. `nearbyProjects`
/// is never an error signal — Workflow 2 is explicit the project is already
/// created by the time this comes back; the UI branches on it purely to
/// offer "did you mean one of these?" after the fact.
@freezed
abstract class RegisterProjectResult with _$RegisterProjectResult {
  const factory RegisterProjectResult({
    required RegisteredProjectView project,
    @Default(<NearbyProjectCardView>[])
    List<NearbyProjectCardView> nearbyProjects,
    @Default(<StakeholderLinkFailure>[])
    List<StakeholderLinkFailure> stakeholderLinkFailures,
  }) = _RegisterProjectResult;

  factory RegisterProjectResult.fromJson(Map<String, dynamic> json) =>
      _$RegisterProjectResultFromJson(json);
}
