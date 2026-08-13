import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/helpers/validators.dart';
import 'enums.dart';

part 'change_status_request.freezed.dart';
part 'change_status_request.g.dart';

/// §5 `PUT /projects/{id}/status` body. `reason` is unconditionally
/// required (unlike stage's `note`). Reviving from `CANCELLED` needs a
/// `SALES_MANAGER` — enforced server-side as a `404` (control hidden
/// client-side below `SALES_MANAGER`, per §2.6), not checked here.
@freezed
abstract class ChangeStatusRequest with _$ChangeStatusRequest {
  /// Optional-and-absent must actually be absent on the wire:
  /// json_serializable emits every key by default, and this API rejects
  /// present-but-null on validated optional fields (see
  /// `SubmitWonRequest` for the case that surfaced it).
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory ChangeStatusRequest({
    required ProjectStatus status,
    required String reason,
    int? expectedVersion,
  }) = _ChangeStatusRequest;

  factory ChangeStatusRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangeStatusRequestFromJson(json);
}

extension ChangeStatusRequestValidation on ChangeStatusRequest {
  void validate() {
    AppValidators.validateReason(reason, fieldName: 'reason');
  }
}
