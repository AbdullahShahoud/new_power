import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/utc_date_time_converter.dart';
import 'actor_view.dart';
import 'enums.dart';

part 'activity_view.freezed.dart';
part 'activity_view.g.dart';

/// §9 — a name to call/greet, not an id or email; appears on
/// `ActivityView.personsMet`.
@freezed
abstract class PersonMetRefView with _$PersonMetRefView {
  // ignore: invalid_annotation_target
  @JsonSerializable(converters: [UtcDateTimeConverter()])
  const factory PersonMetRefView({
    required String contactId,
    required String firstName,
    required String lastName,
    String? position,
    required String accountId,
    required String accountName,
  }) = _PersonMetRefView;

  factory PersonMetRefView.fromJson(Map<String, dynamic> json) =>
      _$PersonMetRefViewFromJson(json);
}

/// §9 `StoredFileView` + `{id, uploadedAt, uploadedBy?}` — an activity's own
/// flavor of the one file shape. `key` is a bare storage key here (not
/// pre-signed like a project photo) — exchange it for a token only when the
/// rep actually opens it (Workflow 11), never eagerly for a whole list.
@Freezed(toStringOverride: false)
abstract class ActivityAttachmentView with _$ActivityAttachmentView {
  // ignore: invalid_annotation_target
  @JsonSerializable(converters: [UtcDateTimeConverter()])
  const factory ActivityAttachmentView({
    required String id,
    required String key,
    required String name,
    required String contentType,
    required int byteSize,
    String? url,
    DateTime? urlExpiresAt,
    required DateTime uploadedAt,
    String? uploadedBy,
  }) = _ActivityAttachmentView;

  factory ActivityAttachmentView.fromJson(Map<String, dynamic> json) =>
      _$ActivityAttachmentViewFromJson(json);

  @override
  String toString() =>
      'ActivityAttachmentView(id: $id, key: $key, name: $name)';
}

/// §9 — full activity-log entry. Read-only in Phase 1 (rendered inside
/// `ProjectDetailView.activities`); the create/edit forms and
/// `ActivitiesBloc` land in Phase 2.
@freezed
abstract class ActivityView with _$ActivityView {
  // ignore: invalid_annotation_target
  @JsonSerializable(converters: [UtcDateTimeConverter()])
  const factory ActivityView({
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
  }) = _ActivityView;

  factory ActivityView.fromJson(Map<String, dynamic> json) =>
      _$ActivityViewFromJson(json);
}
