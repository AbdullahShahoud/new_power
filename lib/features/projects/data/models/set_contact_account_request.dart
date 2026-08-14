import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/helpers/validators.dart';

part 'set_contact_account_request.freezed.dart';
part 'set_contact_account_request.g.dart';

/// directory-mobile-integration.md §7.5 `PUT /contacts/{id}/account` — file
/// or move.
///
/// One route for both "this unfiled person turned out to work at X" and
/// "this person was filed under the wrong company": *"both are the same
/// fact arriving late."*
///
/// [accountId] is **required and cannot be null — there is no detach.**
/// Returning someone the field has been dealing with to the unfiled queue
/// would be a hole, not a correction.
///
/// Two behaviours worth knowing at the call site: filing a contact where
/// they already are is a **no-op returning them unchanged** (safe to
/// re-send, not a 409), and a contact holding a decision-maker flag is
/// **refused** with `409 CONTACT_IS_DECISION_MAKER` — moving them would
/// leave a project's decision maker pointing at a company they no longer
/// work for.
@freezed
abstract class SetContactAccountRequest with _$SetContactAccountRequest {
  const factory SetContactAccountRequest({required String accountId}) =
      _SetContactAccountRequest;

  factory SetContactAccountRequest.fromJson(Map<String, dynamic> json) =>
      _$SetContactAccountRequestFromJson(json);
}

extension SetContactAccountRequestValidation on SetContactAccountRequest {
  void validate() {
    AppValidators.validateUuid(accountId, fieldName: 'accountId');
  }
}
