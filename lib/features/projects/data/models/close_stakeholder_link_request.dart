import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/helpers/validators.dart';

part 'close_stakeholder_link_request.freezed.dart';
part 'close_stakeholder_link_request.g.dart';

/// stakeholders.md `DELETE /projects/{projectId}/stakeholders/{linkId}` —
/// closes with an end date, never deletes. `endedAt` is optional, "for a
/// departure noticed late"; omitted means "ended now."
@freezed
abstract class CloseStakeholderLinkRequest
    with _$CloseStakeholderLinkRequest {
  const factory CloseStakeholderLinkRequest({
    required String reason,
    DateTime? endedAt,
  }) = _CloseStakeholderLinkRequest;

  factory CloseStakeholderLinkRequest.fromJson(Map<String, dynamic> json) =>
      _$CloseStakeholderLinkRequestFromJson(json);
}

extension CloseStakeholderLinkRequestValidation
    on CloseStakeholderLinkRequest {
  void validate() {
    AppValidators.validateReason(reason, fieldName: 'reason');
  }
}
