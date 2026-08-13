import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/helpers/validators.dart';
import 'enums.dart';

part 'change_stage_request.freezed.dart';
part 'change_stage_request.g.dart';

/// §5 `PUT /projects/{id}/stage` body. `WON`/`LOST` are refused by the
/// server (`PROJECT_STAGE_REQUIRES_OUTCOME`) — the UI never offers them in
/// the funnel dropdown (`openProjectStages`), this is defense-in-depth only.
/// `note` is optional in general but required when reopening a `WON`/`LOST`
/// project — that condition depends on the project's *current* stage, which
/// this request doesn't carry, so the caller (Bloc/UI) enforces it, not
/// `.validate()`.
@freezed
abstract class ChangeStageRequest with _$ChangeStageRequest {
  /// Optional-and-absent must actually be absent on the wire:
  /// json_serializable emits every key by default, and this API rejects
  /// present-but-null on validated optional fields (see
  /// `SubmitWonRequest` for the case that surfaced it).
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory ChangeStageRequest({
    required ProjectStage stage,
    String? note,
    int? expectedVersion,
  }) = _ChangeStageRequest;

  factory ChangeStageRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangeStageRequestFromJson(json);
}

extension ChangeStageRequestValidation on ChangeStageRequest {
  void validate() {
    if (stage == ProjectStage.won || stage == ProjectStage.lost) {
      throw ArgumentError(
        'WON/LOST cannot be set directly — submit an outcome instead',
      );
    }
    if (note != null) {
      AppValidators.validateReason(note!, fieldName: 'note');
    }
  }
}
