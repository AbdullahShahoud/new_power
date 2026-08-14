import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/helpers/validators.dart';

part 'reason_request.freezed.dart';
part 'reason_request.g.dart';

/// The bare `{ reason }` body shape shared by every directory mutation
/// whose only field is the mandatory explanation: `DELETE /contacts/{id}`
/// and `DELETE /projects/{id}/decision-maker`. One type instead of two
/// near-identical ones — the shape repeats verbatim across them.
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
