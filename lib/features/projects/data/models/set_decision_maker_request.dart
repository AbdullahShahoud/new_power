import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/helpers/validators.dart';

part 'set_decision_maker_request.freezed.dart';
part 'set_decision_maker_request.g.dart';

/// stakeholders.md `PUT /projects/{projectId}/decision-maker` — sets **or**
/// moves the flag; the server discovers which from whether the project
/// already has one. `reason` is omitted when setting the first one, and
/// **required** (SH2) on every subsequent move — the UI decides which case
/// it's in from whatever `GET .../decision-maker` last returned (`null` vs.
/// a value), so it only prompts for a reason when one is actually needed.
@freezed
abstract class SetDecisionMakerRequest with _$SetDecisionMakerRequest {
  /// Optional-and-absent must actually be absent on the wire:
  /// json_serializable emits every key by default, and this API rejects
  /// present-but-null on validated optional fields (see
  /// `SubmitWonRequest` for the case that surfaced it).
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory SetDecisionMakerRequest({
    required String contactId,
    String? reason,
  }) = _SetDecisionMakerRequest;

  factory SetDecisionMakerRequest.fromJson(Map<String, dynamic> json) =>
      _$SetDecisionMakerRequestFromJson(json);
}

extension SetDecisionMakerRequestValidation on SetDecisionMakerRequest {
  void validate() {
    AppValidators.validateUuid(contactId, fieldName: 'contactId');
    if (reason != null) {
      AppValidators.validateReason(reason!, fieldName: 'reason');
    }
  }
}
