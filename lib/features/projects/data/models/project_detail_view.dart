import 'package:freezed_annotation/freezed_annotation.dart';
import 'activity_view.dart';
import 'actor_view.dart';
import 'enums.dart';
import 'project_image_view.dart';

part 'project_detail_view.freezed.dart';
part 'project_detail_view.g.dart';

/// §9 `StakeholderRefView` — read-only in Phase 1 (rendered inside
/// `ProjectDetailView.stakeholders`); the directory/linking UI is Phase 6.
@freezed
abstract class PrimaryContactRefView with _$PrimaryContactRefView {
  const factory PrimaryContactRefView({
    required String contactId,
    required String accountId,
    required String firstName,
    required String lastName,
    String? position,
    String? phone,
    String? email,
  }) = _PrimaryContactRefView;

  factory PrimaryContactRefView.fromJson(Map<String, dynamic> json) =>
      _$PrimaryContactRefViewFromJson(json);
}

/// §9 `StakeholderRefView`, extended with the fields `stakeholders.md`'s
/// standalone `GET /projects/{projectId}/stakeholders` adds on top of the
/// embedded-in-`ProjectDetailView` shape: `endedAt`/`isActive` (closed-link
/// history, `?includeClosed=true`) and `replacedByLinkId` ("who replaced
/// whom reads off the chain" — stakeholders.md `POST .../replace`). Reused
/// for both reads rather than two near-duplicate types — the embedded read
/// just never populates the extra fields (`isActive` defaults `true`,
/// matching "a project's inline stakeholders are always the active ones").
@freezed
abstract class StakeholderRefView with _$StakeholderRefView {
  const factory StakeholderRefView({
    required String linkId,
    required String accountId,
    required String accountName,
    required String accountType,
    required StakeholderRole role,
    PrimaryContactRefView? primaryContact,
    String? note,
    required DateTime startedAt,
    DateTime? endedAt,
    @Default(true) bool isActive,
    String? replacedByLinkId,
    String? linkedBy,
    ActorView? linkedByUser,
  }) = _StakeholderRefView;

  factory StakeholderRefView.fromJson(Map<String, dynamic> json) =>
      _$StakeholderRefViewFromJson(json);
}

@freezed
abstract class DecisionMakerRefView with _$DecisionMakerRefView {
  const factory DecisionMakerRefView({
    required String contactId,
    required String contactName,
    required String accountId,
    required String accountName,
  }) = _DecisionMakerRefView;

  factory DecisionMakerRefView.fromJson(Map<String, dynamic> json) =>
      _$DecisionMakerRefViewFromJson(json);
}

/// §9 `ProjectDetailView extends ProjectView` — flattened (same reasoning as
/// `ProjectImageView`), returned by `GET /projects/{id}`. Note: no
/// `activityCount`/`stakeholderCount` here — those only exist on
/// `ProjectSummaryView`; use `activities.length`/`stakeholders.length`
/// directly. `imageCount` is still not `images.length` — an unsigned photo
/// stays in the array with `url: null`.
@freezed
abstract class ProjectDetailView with _$ProjectDetailView {
  const factory ProjectDetailView({
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
    @Default(<ProjectImageView>[]) List<ProjectImageView> images,
    @Default(<ActivityView>[]) List<ActivityView> activities,
    @Default(<StakeholderRefView>[]) List<StakeholderRefView> stakeholders,
    DecisionMakerRefView? decisionMaker,
  }) = _ProjectDetailView;

  factory ProjectDetailView.fromJson(Map<String, dynamic> json) =>
      _$ProjectDetailViewFromJson(json);
}
