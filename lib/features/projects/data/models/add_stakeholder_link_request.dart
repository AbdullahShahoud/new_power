import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/utc_date_time_converter.dart';
import '../../../../core/helpers/validators.dart';
import 'enums.dart';

part 'add_stakeholder_link_request.freezed.dart';
part 'add_stakeholder_link_request.g.dart';

/// stakeholders.md `POST /projects/{projectId}/stakeholders`.
/// `primaryContactId` is optional — "a rep often knows the company before
/// they know who to ask for" — and must be a contact of [accountId].
/// `startedAt` back-dates an involvement recorded after the fact.
@freezed
abstract class AddStakeholderLinkRequest with _$AddStakeholderLinkRequest {
  /// Optional-and-absent must actually be absent on the wire:
  /// json_serializable emits every key by default, and this API rejects
  /// present-but-null on validated optional fields (see
  /// `SubmitWonRequest` for the case that surfaced it).
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false, converters: [UtcDateTimeConverter()])
  const factory AddStakeholderLinkRequest({
    required String accountId,
    required StakeholderRole role,
    String? primaryContactId,
    String? note,
    DateTime? startedAt,
  }) = _AddStakeholderLinkRequest;

  factory AddStakeholderLinkRequest.fromJson(Map<String, dynamic> json) =>
      _$AddStakeholderLinkRequestFromJson(json);
}

extension AddStakeholderLinkRequestValidation on AddStakeholderLinkRequest {
  void validate() {
    AppValidators.validateUuid(accountId, fieldName: 'accountId');
    if (primaryContactId != null) {
      AppValidators.validateUuid(
        primaryContactId!,
        fieldName: 'primaryContactId',
      );
    }
    final trimmedNote = note?.trim();
    if (trimmedNote != null && trimmedNote.length > 500) {
      throw ArgumentError('note cannot exceed 500 characters');
    }
  }
}
