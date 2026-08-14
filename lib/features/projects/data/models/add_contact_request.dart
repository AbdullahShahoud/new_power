import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/helpers/validators.dart';

part 'add_contact_request.freezed.dart';
part 'add_contact_request.g.dart';

/// directory-mobile-integration.md §7.1 `POST /contacts` — record a person.
///
/// **Moved off `/accounts/{id}/contacts`.** `accountId` is now optional on
/// purpose: "a rep takes a name and a number at a site gate, at a trade
/// counter, off a business card, and only later finds out which company is
/// behind it." Forcing an account at that moment is what produced throwaway
/// "Unknown Contractor" records.
///
/// [company] is free text — what the person *said* they work for — and is
/// not a reference to anything. Sending both [accountId] and [company] is
/// normal: it's what a contact looks like the moment after being filed.
///
/// [isPrimary] is an **account-level** attribute: setting it demotes the
/// incumbent in the same transaction, including a contact another rep
/// added. Without an [accountId] it is refused
/// (`CONTACT_UNATTACHED_CANNOT_BE_PRIMARY`), which `.validate()` catches
/// before the request leaves.
@freezed
abstract class AddContactRequest with _$AddContactRequest {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory AddContactRequest({
    required String firstName,
    required String lastName,
    String? accountId,
    String? company,
    String? position,
    String? phone,
    String? email,
    String? notes,
    @Default(false) bool isPrimary,
  }) = _AddContactRequest;

  factory AddContactRequest.fromJson(Map<String, dynamic> json) =>
      _$AddContactRequestFromJson(json);
}

extension AddContactRequestValidation on AddContactRequest {
  void validate() {
    AppValidators.validateContactName(firstName, fieldName: 'firstName');
    AppValidators.validateContactName(lastName, fieldName: 'lastName');
    if (accountId != null) {
      AppValidators.validateUuid(accountId!, fieldName: 'accountId');
    }
    if (isPrimary && accountId == null) {
      throw ArgumentError(
        'isPrimary requires an accountId — an unfiled contact cannot be primary',
      );
    }
    if (phone != null && phone!.trim().isNotEmpty) {
      AppValidators.validateWesternPhone(phone!);
    }
    if (email != null && email!.trim().isNotEmpty) {
      if (!AppValidators.emailRegex.hasMatch(email!.trim())) {
        throw ArgumentError('email must be a valid address');
      }
    }
    if (company != null && company!.trim().length > 200) {
      throw ArgumentError('company cannot exceed 200 characters');
    }
  }
}

/// §6.3 `POST /accounts/{id}/classifications` — the endpoint that was
/// undocumented when Outcomes was built, and whose absence blocked the
/// Won-distributor and competitor pickers.
///
/// Classifying an account that already carries the classification is a
/// **409 `ACCOUNT_ALREADY_CLASSIFIED`**, not a no-op. The doc's UI rule:
/// disable a classification the account already shows, and if the 409
/// arrives anyway, treat it as success-with-refresh rather than an error.
@freezed
abstract class ClassifyAccountRequest with _$ClassifyAccountRequest {
  const factory ClassifyAccountRequest({required String classification}) =
      _ClassifyAccountRequest;

  factory ClassifyAccountRequest.fromJson(Map<String, dynamic> json) =>
      _$ClassifyAccountRequestFromJson(json);
}
