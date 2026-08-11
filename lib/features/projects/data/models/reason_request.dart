import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/helpers/validators.dart';

part 'reason_request.freezed.dart';
part 'reason_request.g.dart';

/// The bare `{ reason }` body shape shared by every stakeholders.md
/// mutation whose only field is the mandatory explanation: `DELETE
/// /accounts/{id}/contacts/{contactId}`, `DELETE .../decision-maker`. One
/// type instead of four near-identical ones — same reasoning as
/// `RejectOutcomeRequest`'s shape being reused nowhere else, except here
/// the shape genuinely repeats verbatim across endpoints.
@freezed
abstract class ReasonRequest with _$ReasonRequest {
  const factory ReasonRequest({required String reason}) = _ReasonRequest;

  factory ReasonRequest.fromJson(Map<String, dynamic> json) =>
      _$ReasonRequestFromJson(json);
}

extension ReasonRequestValidation on ReasonRequest {
  void validate() {
    AppValidators.validateReason(reason, fieldName: 'reason');
  }
}
