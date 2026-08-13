import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/utc_date_time_converter.dart';
import '../../../../core/helpers/validators.dart';
import 'activity_location_dto.dart';
import 'enums.dart';
import 'uploaded_file_dto.dart';

part 'log_activity_request.freezed.dart';
part 'log_activity_request.g.dart';

/// §5 `POST /projects/{projectId}/activities` body — "one form, four things
/// differ" (Workflow 4). Every conditional rule from the doc's table lives
/// in `.validate()`, not scattered across the UI, so the Bloc/repository
/// path is authoritative regardless of which screen builds the request.
@freezed
abstract class LogActivityRequest with _$LogActivityRequest {
  /// Optional-and-absent must actually be absent on the wire:
  /// json_serializable emits every key by default, and this API rejects
  /// present-but-null on validated optional fields (see
  /// `SubmitWonRequest` for the case that surfaced it).
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false, converters: [UtcDateTimeConverter()])
  const factory LogActivityRequest({
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
  }) = _LogActivityRequest;

  factory LogActivityRequest.fromJson(Map<String, dynamic> json) =>
      _$LogActivityRequestFromJson(json);
}

extension LogActivityRequestValidation on LogActivityRequest {
  void validate() {
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

    // 5-minute clock-skew tolerance, matching the server's own rule.
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
