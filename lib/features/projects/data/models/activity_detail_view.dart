import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/utc_date_time_converter.dart';
import 'activity_view.dart';
import 'actor_view.dart';
import 'enums.dart';

part 'activity_detail_view.freezed.dart';
part 'activity_detail_view.g.dart';

/// §9 — one entry in `ActivityDetailView.revisions`. Populated only for an
/// activity edited after its 24h window; `before`/`after`/`fields` is what
/// settles an ownership dispute (Workflow 13). `revisedBy`/`revisedByUser`
/// are stripped for a `REPRESENTATIVE` — the diff stays visible, the
/// reviser's name does not.
@freezed
abstract class ActivityRevisionView with _$ActivityRevisionView {
  // ignore: invalid_annotation_target
  @JsonSerializable(converters: [UtcDateTimeConverter()])
  const factory ActivityRevisionView({
    required String id,
    required String activityId,
    required Map<String, dynamic> before,
    required Map<String, dynamic> after,
    required List<String> fields,
    required DateTime revisedAt,
    String? revisedBy,
    ActorView? revisedByUser,
  }) = _ActivityRevisionView;

  factory ActivityRevisionView.fromJson(Map<String, dynamic> json) =>
      _$ActivityRevisionViewFromJson(json);
}

/// §9 `ActivityDetailView extends ActivityView` — flattened (same reasoning
/// as `ProjectImageView extends StoredFileView`), returned by
/// `GET /activities/{id}`.
@freezed
abstract class ActivityDetailView with _$ActivityDetailView {
  // ignore: invalid_annotation_target
  @JsonSerializable(converters: [UtcDateTimeConverter()])
  const factory ActivityDetailView({
    required String id,
    required String projectId,
    required String projectName,
    required ActivityKind kind,
    ActivityChannel? channel,
    required ActivityPurpose purpose,
    required ActivityOutcome outcome,
    required DateTime occurredAt,
    required DateTime capturedAt,
    double? latitude,
    double? longitude,
    double? locationAccuracyM,
    @Default(false) bool locationVerified,
    ConstructionPhase? constructionPhaseObserved,
    String? competitorAccountId,
    String? competitorName,
    required String notes,
    @Default(<PersonMetRefView>[]) List<PersonMetRefView> personsMet,
    @Default(<ActivityAttachmentView>[])
    List<ActivityAttachmentView> attachments,
    DateTime? nextActionAt,
    DateTime? nextActionDoneAt,
    @Default(false) bool backdated,
    String? backdateApprovedBy,
    @Default(false) bool editedAfterWindow,
    String? createdBy,
    ActorView? createdByUser,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(<ActivityRevisionView>[]) List<ActivityRevisionView> revisions,
  }) = _ActivityDetailView;

  factory ActivityDetailView.fromJson(Map<String, dynamic> json) =>
      _$ActivityDetailViewFromJson(json);
}
