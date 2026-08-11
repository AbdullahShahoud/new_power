import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/helpers/validators.dart';

part 'replace_stakeholder_link_request.freezed.dart';
part 'replace_stakeholder_link_request.g.dart';

/// stakeholders.md `POST /projects/{projectId}/stakeholders/{linkId}/replace`
/// (rule SH4 — "one business event, one transaction"). `newPrimaryContactId`
/// becomes server-side **required** only if the outgoing link holds the
/// decision-maker flag (`STAKEHOLDER_REPLACEMENT_CONTACT_REQUIRED` if
/// omitted then) — this client can't always know that in advance without an
/// extra round trip, so it's left optional here and the error surfaces if
/// it turns out to matter, same reasoning as `SubmitLostRequest`'s
/// server-validated conditionals.
@freezed
abstract class ReplaceStakeholderLinkRequest
    with _$ReplaceStakeholderLinkRequest {
  const factory ReplaceStakeholderLinkRequest({
    required String newAccountId,
    String? newPrimaryContactId,
    String? note,
    required String reason,
  }) = _ReplaceStakeholderLinkRequest;

  factory ReplaceStakeholderLinkRequest.fromJson(Map<String, dynamic> json) =>
      _$ReplaceStakeholderLinkRequestFromJson(json);
}

extension ReplaceStakeholderLinkRequestValidation
    on ReplaceStakeholderLinkRequest {
  void validate() {
    AppValidators.validateUuid(newAccountId, fieldName: 'newAccountId');
    if (newPrimaryContactId != null) {
      AppValidators.validateUuid(
        newPrimaryContactId!,
        fieldName: 'newPrimaryContactId',
      );
    }
    final trimmedNote = note?.trim();
    if (trimmedNote != null && trimmedNote.length > 500) {
      throw ArgumentError('note cannot exceed 500 characters');
    }
    AppValidators.validateReason(reason, fieldName: 'reason');
  }
}
