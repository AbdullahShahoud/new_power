import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/utc_date_time_converter.dart';
import '../../../../core/helpers/validators.dart';
import 'activity_location_dto.dart';
import 'enums.dart';
import 'uploaded_file_dto.dart';

part 'sync_activity_item.freezed.dart';
part 'sync_activity_item.g.dart';

/// §6 `POST /activities/sync` — a full `LogActivityDto` (every rule from
/// `POST /projects/{projectId}/activities` applies, flattened here the same
/// way `ProjectImageView extends StoredFileView` is flattened elsewhere)
/// plus `projectId`/`clientRef`. The Bloc/repository land in Phase 2; the
/// local queue that actually calls this in bulk is Phase 4
/// (projects-implementation-map.md roadmap).
@freezed
abstract class SyncActivityItem with _$SyncActivityItem {
  /// Optional-and-absent must actually be absent on the wire:
  /// json_serializable emits every key by default, and this API rejects
  /// present-but-null on validated optional fields (see
  /// `SubmitWonRequest` for the case that surfaced it).
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false, converters: [UtcDateTimeConverter()])
  const factory SyncActivityItem({
    required String projectId,
    required String clientRef,
    required ActivityKind kind,
    ActivityChannel? channel,
    required ActivityPurpose purpose,
    required ActivityOutcome outcome,
    required DateTime occurredAt,
    required String notes,
    required List<String> personsMet,
    ActivityLocationDto? location,
    ConstructionPhase? constructionPhaseObserved,
    String? competitorAccountId,
    DateTime? nextActionAt,
    @Default(<UploadedFileDto>[]) List<UploadedFileDto> files,
  }) = _SyncActivityItem;

  factory SyncActivityItem.fromJson(Map<String, dynamic> json) =>
      _$SyncActivityItemFromJson(json);
}

extension SyncActivityItemValidation on SyncActivityItem {
  void validate() {
    AppValidators.validateUuid(projectId, fieldName: 'projectId');

    final trimmedRef = clientRef.trim();
    if (trimmedRef.length < 8 || trimmedRef.length > 100) {
      throw ArgumentError('clientRef must be 8-100 characters');
    }

    final isCommunication = kind == ActivityKind.communication;
    if (isCommunication && channel == null) {
      throw ArgumentError('channel is required for a COMMUNICATION activity');
    }
    if (!isCommunication && channel != null) {
      throw ArgumentError('channel is not allowed for a VISIT activity');
    }
    AppValidators.validateActivityNotes(notes);
    if (personsMet.isEmpty || personsMet.length > 20) {
      throw ArgumentError('personsMet must contain 1-20 items');
    }
    if (isCommunication && personsMet.length != 1) {
      throw ArgumentError(
        'personsMet must contain exactly 1 item for a COMMUNICATION activity',
      );
    }
    for (final personId in personsMet) {
      AppValidators.validateUuid(personId, fieldName: 'personsMet');
    }
    location?.validate();
    if (constructionPhaseObserved != null && isCommunication) {
      throw ArgumentError(
        'constructionPhaseObserved is only allowed on a VISIT activity',
      );
    }
    if (competitorAccountId != null) {
      AppValidators.validateUuid(
        competitorAccountId!,
        fieldName: 'competitorAccountId',
      );
    }
    if (outcome == ActivityOutcome.tooEarlyRevisitLater &&
        nextActionAt == null) {
      throw ArgumentError(
        'nextActionAt is required when outcome is TOO_EARLY_REVISIT_LATER',
      );
    }
    // 5-minute clock-skew tolerance, matching the server's own rule — same
    // check as `LogActivityRequest`, since every one of its rules applies here.
    if (occurredAt.isAfter(DateTime.now().add(const Duration(minutes: 5)))) {
      throw ArgumentError('occurredAt cannot be in the future');
    }
    if (files.length > 10) {
      throw ArgumentError('files cannot exceed 10 items');
    }
    for (final file in files) {
      file.validate();
    }
  }
}
