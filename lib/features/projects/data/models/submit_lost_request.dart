import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/helpers/validators.dart';
import 'enums.dart';

part 'submit_lost_request.freezed.dart';
part 'submit_lost_request.g.dart';

/// §5 `POST /projects/{projectId}/lost` body. `someoneElseWon` must always
/// be `true` — never offer `false` in the UI at all; if nobody won, the
/// building died and the project should be cancelled instead
/// (`PUT /projects/{id}/status`), not routed through this endpoint.
@freezed
abstract class SubmitLostRequest with _$SubmitLostRequest {
  const factory SubmitLostRequest({
    @Default(true) bool someoneElseWon,
    required LossReason reason,
    double? competitorPrice,
    String? currency,
    String? competitorAccountId,
    String? narrative,
    String? notes,
  }) = _SubmitLostRequest;

  factory SubmitLostRequest.fromJson(Map<String, dynamic> json) =>
      _$SubmitLostRequestFromJson(json);
}

extension SubmitLostRequestValidation on SubmitLostRequest {
  void validate() {
    if (!someoneElseWon) {
      throw ArgumentError(
        'someoneElseWon must be true — cancel the project instead if nobody won',
      );
    }
    if (reason == LossReason.price) {
      if (competitorPrice == null) {
        throw ArgumentError(
          'competitorPrice is required when reason is PRICE',
        );
      }
    }
    if (competitorPrice != null) {
      AppValidators.validateMoney(
        amount: competitorPrice,
        currency: currency,
        fieldName: 'competitorPrice',
      );
    }
    if (competitorAccountId != null) {
      AppValidators.validateUuid(
        competitorAccountId!,
        fieldName: 'competitorAccountId',
      );
    }
    final trimmedNarrative = narrative?.trim();
    if (trimmedNarrative != null && trimmedNarrative.length > 2000) {
      throw ArgumentError('narrative cannot exceed 2000 characters');
    }
    final trimmedNotes = notes?.trim();
    if (trimmedNotes != null && trimmedNotes.length > 2000) {
      throw ArgumentError('notes cannot exceed 2000 characters');
    }
  }
}
