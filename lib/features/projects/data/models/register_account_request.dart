import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/helpers/validators.dart';
import 'enums.dart';

part 'register_account_request.freezed.dart';
part 'register_account_request.g.dart';

/// One person on a `POST /accounts` body — directory-mobile-integration.md
/// §6.1's nested `AddContactDto`.
///
/// No `accountId` and no `company` here: the account being created *is* the
/// one they belong to.
@freezed
abstract class NewAccountContact with _$NewAccountContact {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory NewAccountContact({
    required String firstName,
    required String lastName,
    String? position,
    String? phone,
    String? email,
    String? notes,
    @Default(false) bool isPrimary,
  }) = _NewAccountContact;

  factory NewAccountContact.fromJson(Map<String, dynamic> json) =>
      _$NewAccountContactFromJson(json);
}

/// directory-mobile-integration.md §6.1 `POST /accounts` — create.
///
/// **One visit, one request.** The body may inline a `classification` and
/// up to 20 `contacts`, so the common field flow (met a company, met a
/// person there) is a single call rather than three.
///
/// Validation is all-or-nothing server-side: "a bad phone on the third
/// person creates *nothing*", and an unknown classification is refused
/// before the account is written. So a rejected submission can always be
/// corrected and resubmitted safely — there is never a half-created
/// account to clean up.
///
/// Never blocked for resembling an existing account: refusing here "would
/// only teach reps to type *Al Amal 2*".
@freezed
abstract class RegisterAccountRequest with _$RegisterAccountRequest {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory RegisterAccountRequest({
    required String name,
    @Default(AccountType.company) AccountType type,
    String? registrationNumber,
    String? phone,
    String? email,
    String? city,
    String? addressLine,
    String? notes,
    AccountClassification? classification,
    @Default(<NewAccountContact>[]) List<NewAccountContact> contacts,
  }) = _RegisterAccountRequest;

  factory RegisterAccountRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterAccountRequestFromJson(json);
}

extension RegisterAccountRequestValidation on RegisterAccountRequest {
  void validate() {
    AppValidators.validateAccountName(name);
    if (registrationNumber != null && registrationNumber!.trim().isNotEmpty) {
      AppValidators.validateRegistrationNumber(registrationNumber!);
    }
    if (phone != null && phone!.trim().isNotEmpty) {
      AppValidators.validateWesternPhone(phone!);
    }
    if (email != null && email!.trim().isNotEmpty) {
      if (!AppValidators.emailRegex.hasMatch(email!.trim())) {
        throw ArgumentError('email must be a valid address');
      }
    }
    if (contacts.length > 20) {
      throw ArgumentError('contacts cannot exceed 20 entries');
    }
    for (final contact in contacts) {
      AppValidators.validateContactName(
        contact.firstName,
        fieldName: 'firstName',
      );
      AppValidators.validateContactName(
        contact.lastName,
        fieldName: 'lastName',
      );
      if (contact.phone != null && contact.phone!.trim().isNotEmpty) {
        AppValidators.validateWesternPhone(contact.phone!);
      }
      if (contact.email != null && contact.email!.trim().isNotEmpty) {
        if (!AppValidators.emailRegex.hasMatch(contact.email!.trim())) {
          throw ArgumentError('contact email must be a valid address');
        }
      }
    }
  }
}
