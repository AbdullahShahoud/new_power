import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/helpers/validators.dart';

part 'reject_outcome_request.freezed.dart';
part 'reject_outcome_request.g.dart';

/// §5 `POST /outcomes/{id}/reject` body — same shape whether it's a
/// manager's rejection or the submitter's own withdrawal (§10 Workflow 8:
/// "Unlike confirmation, the submitter may reject their own"). `reason`
/// **will be read by the rep**.
@freezed
abstract class RejectOutcomeRequest with _$RejectOutcomeRequest {
  const factory RejectOutcomeRequest({required String reason}) =
      _RejectOutcomeRequest;

  factory RejectOutcomeRequest.fromJson(Map<String, dynamic> json) =>
      _$RejectOutcomeRequestFromJson(json);
}

extension RejectOutcomeRequestValidation on RejectOutcomeRequest {
  void validate() {
    AppValidators.validateReason(reason, fieldName: 'reason');
  }
}
