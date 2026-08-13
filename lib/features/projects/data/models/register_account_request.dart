import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/helpers/validators.dart';
import 'enums.dart';

part 'register_account_request.freezed.dart';
part 'register_account_request.g.dart';

/// stakeholders.md `POST /accounts` — "record a company they just met"
/// (SH6). Only `name` is required; everything else is what a rep happens to
/// have on hand. Arrives `isVerified: false` for a `REPRESENTATIVE` — this
/// client never sends `isVerified` itself, the server decides it from the
/// caller's role.
@freezed
abstract class RegisterAccountRequest with _$RegisterAccountRequest {
  /// Optional-and-absent must actually be absent on the wire:
  /// json_serializable emits every key by default, and this API rejects
  /// present-but-null on validated optional fields (see
  /// `SubmitWonRequest` for the case that surfaced it).
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
  }
}
