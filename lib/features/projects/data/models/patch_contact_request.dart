import '../../../../core/helpers/validators.dart';
import 'omit.dart';

/// directory-mobile-integration.md §7.2 `PATCH /contacts/{id}` — correct.
///
/// Own records only. Omitted leaves alone; explicit `null`/`""` clears.
/// `isPrimary` isn't nullable (a boolean has no "cleared" state), so it's
/// plain-optional rather than `omit`-sentineled.
///
/// **Two fields are deliberately absent from this body:**
///  - `accountId` — filing/moving is its own route (`PUT
///    /contacts/{id}/account`), because it has side effects PATCH doesn't:
///    primary status is stepped down on the way out, and a decision-maker
///    is refused outright.
///  - `company` — "never cleared and not editable by PATCH": it is the raw
///    capture of what the person *said*, and the clue that later found the
///    account. Reads render the account's name in preference to it anyway.
class PatchContactRequest {
  final String? firstName;
  final String? lastName;

  /// `String?` value, or [omit] to leave it unchanged. `null`/`""` clears.
  final Object? position;

  /// `String?` value, or [omit] to leave it unchanged. `null`/`""` clears.
  final Object? phone;

  /// `String?` value, or [omit] to leave it unchanged. `null`/`""` clears.
  final Object? email;

  /// `String?` value, or [omit] to leave it unchanged. `null`/`""` clears.
  final Object? notes;

  final bool? isPrimary;

  const PatchContactRequest({
    this.firstName,
    this.lastName,
    this.position = omit,
    this.phone = omit,
    this.email = omit,
    this.notes = omit,
    this.isPrimary,
  });

  void validate() {
    if (firstName != null) {
      AppValidators.validateContactName(firstName!, fieldName: 'firstName');
    }
    if (lastName != null) {
      AppValidators.validateContactName(lastName!, fieldName: 'lastName');
    }
    if (phone != omit && phone != null) {
      AppValidators.validateWesternPhone(phone as String);
    }
    if (email != omit && email != null) {
      final trimmed = (email as String).trim();
      if (trimmed.isNotEmpty && !AppValidators.emailRegex.hasMatch(trimmed)) {
        throw ArgumentError('email must be a valid address');
      }
    }
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (firstName != null) json['firstName'] = firstName;
    if (lastName != null) json['lastName'] = lastName;
    if (position != omit) json['position'] = position;
    if (phone != omit) json['phone'] = phone;
    if (email != omit) json['email'] = email;
    if (notes != omit) json['notes'] = notes;
    if (isPrimary != null) json['isPrimary'] = isPrimary;
    return json;
  }
}
