import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/helpers/validators.dart';

part 'add_contact_request.freezed.dart';
part 'add_contact_request.g.dart';

/// stakeholders.md `POST /accounts/{id}/contacts` — both name parts
/// required. `isPrimary` steps the incumbent primary down account-wide in
/// the same transaction (server-side), not something this client computes.
@freezed
abstract class AddContactRequest with _$AddContactRequest {
  /// Optional-and-absent must actually be absent on the wire:
  /// json_serializable emits every key by default, and this API rejects
  /// present-but-null on validated optional fields (see
  /// `SubmitWonRequest` for the case that surfaced it).
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory AddContactRequest({
    required String firstName,
    required String lastName,
    String? position,
    String? phone,
    String? email,
    @Default(false) bool isPrimary,
  }) = _AddContactRequest;

  factory AddContactRequest.fromJson(Map<String, dynamic> json) =>
      _$AddContactRequestFromJson(json);
}

extension AddContactRequestValidation on AddContactRequest {
  void validate() {
    AppValidators.validateContactName(firstName, fieldName: 'firstName');
    AppValidators.validateContactName(lastName, fieldName: 'lastName');
    if (phone != null && phone!.trim().isNotEmpty) {
      AppValidators.validateWesternPhone(phone!);
    }
    if (email != null && email!.trim().isNotEmpty) {
      if (!AppValidators.emailRegex.hasMatch(email!.trim())) {
        throw ArgumentError('email must be a valid address');
      }
    }
  }
}
