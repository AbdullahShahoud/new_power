import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/utc_date_time_converter.dart';
import 'activity_view.dart';
import 'actor_view.dart';
import 'enums.dart';
import 'outcome_view.dart';
import 'project_image_view.dart';

part 'project_detail_view.freezed.dart';
part 'project_detail_view.g.dart';

/// §9 `StakeholderRefView` — read-only in Phase 1 (rendered inside
/// `ProjectDetailView.stakeholders`); the directory/linking UI is Phase 6.
@freezed
abstract class PrimaryContactRefView with _$PrimaryContactRefView {
  // ignore: invalid_annotation_target
  @JsonSerializable(converters: [UtcDateTimeConverter()])
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
  // ignore: invalid_annotation_target
  @JsonSerializable(converters: [UtcDateTimeConverter()])
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
  // ignore: invalid_annotation_target
  @JsonSerializable(converters: [UtcDateTimeConverter()])
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
  // ignore: invalid_annotation_target
  @JsonSerializable(converters: [UtcDateTimeConverter()])
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

    /// The outcome already submitted on this project and still awaiting a
    /// manager's decision (`status: "PENDING"`), or `null` when there is
    /// none.
    ///
    /// Load-bearing for the UI, not decoration: while this is present the
    /// rep must not be able to submit another won/lost claim. The server
    /// refuses a second one anyway (`OUTCOME_ALREADY_OPEN`), but a rep who
    /// only learns that after filling the whole form has been made to do
    /// the work twice — and cannot see what the first claim said.
    OutcomeView? pendingOutcome,
  }) = _ProjectDetailView;

  factory ProjectDetailView.fromJson(Map<String, dynamic> json) =>
      _$ProjectDetailViewFromJson(json);
}

extension ProjectDetailViewX on ProjectDetailView {
  /// The project is settled and must be **read-only**.
  ///
  /// `stage` is the field that carries this, not `status` — §1431/§1558:
  /// `POST /outcomes/{id}/confirm` marks the outcome `CONFIRMED` **and**
  /// moves the project to `WON` / `LOST` in the same transaction, stamping
  /// `source: "OUTCOME_CONFIRMED"` on the stage-history entry. So a WON/LOST
  /// stage can only have been reached by a manager approving an outcome —
  /// there is no other path to it, and the stage picker deliberately
  /// excludes both values.
  ///
  /// `LOST` is treated the same as `WON`: it is reached by the identical
  /// confirmation route and is equally final, so letting a rep keep editing
  /// a lost project would just be the same hole on the other side.
  ///
  /// (`closedAt` is set alongside it and would work as a signal too, but the
  /// stage is what every other branch on this screen already reads.)
  bool get isClosed =>
      stage == ProjectStage.won || stage == ProjectStage.lost;

  /// A claim is already filed and waiting on a manager, so a new one must
  /// not be offered.
  ///
  /// The status is re-checked rather than trusting the field's name: the
  /// contract says this slot only ever carries a `PENDING` outcome, but if
  /// a confirmed or rejected one ever arrived here, silently locking the
  /// rep out of ever submitting again would be the worse failure.
  bool get hasPendingOutcome =>
      pendingOutcome != null &&
      pendingOutcome!.status == OutcomeStatus.pending;
}
