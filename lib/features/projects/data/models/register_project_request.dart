import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/helpers/validators.dart';
import 'enums.dart';
import 'location_dto.dart';
import 'stored_file.dart';

part 'register_project_request.freezed.dart';
part 'register_project_request.g.dart';

/// §4 — one stakeholder on a registration body.
///
/// The server accepts **four shapes** through this one object, and the rule
/// binding them is: *each element names its account exactly one way*.
///
/// | Shape | Fields | Meaning |
/// | --- | --- | --- |
/// | New company + its first contact | `accountName` + `accountType` + `contact` | Both are created now |
/// | New individual, no contact | `accountName` + `accountType: INDIVIDUAL` | A person who *is* the account (an owner) |
/// | Existing account + a new face | `accountId` + `contact` | The person is created and linked |
/// | Existing account + existing contact | `accountId` + `primaryContactId` | The original shape |
///
/// ⚠️ `accountId` and `accountName` are **mutually exclusive** — sending
/// both is ambiguous about whether to create or reuse. `primaryContactId`
/// is only meaningful beside `accountId`: a contact id cannot refer into an
/// account that does not exist yet.
///
/// `includeIfNull: false` is load-bearing rather than cosmetic. Without it
/// json_serializable emits every key, so a "create new" element would ship
/// `"accountId": null` next to its `accountName` and trip the server's
/// one-way rule.
@freezed
abstract class ProjectStakeholderRefDto with _$ProjectStakeholderRefDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory ProjectStakeholderRefDto({
    /// An account already in the directory.
    String? accountId,

    /// A company or person to create as part of this registration.
    String? accountName,

    /// Only meaningful with [accountName]. Defaults to `COMPANY`
    /// server-side; sent explicitly so an individual owner is unambiguous.
    AccountType? accountType,
    required StakeholderRole role,

    /// A contact to create and attach. Valid with either account form.
    NewStakeholderContact? contact,

    /// An existing contact. ⚠️ Never sent without [accountId].
    String? primaryContactId,
    String? note,
  }) = _ProjectStakeholderRefDto;

  factory ProjectStakeholderRefDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectStakeholderRefDtoFromJson(json);
}

/// The person inlined beside a stakeholder — created with the link rather
/// than in a separate round trip.
@freezed
abstract class NewStakeholderContact with _$NewStakeholderContact {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory NewStakeholderContact({
    required String firstName,
    required String lastName,
    String? phone,
    String? email,
    String? position,
  }) = _NewStakeholderContact;

  factory NewStakeholderContact.fromJson(Map<String, dynamic> json) =>
      _$NewStakeholderContactFromJson(json);
}

extension NewStakeholderContactValidation on NewStakeholderContact {
  /// The same rules the standalone contact endpoints apply — an inlined
  /// person is created through the same path, so a value this form accepts
  /// but `POST /accounts/{id}/contacts` would refuse is a 400 that costs
  /// the rep the whole registration.
  void validate() {
    AppValidators.validateContactName(firstName, fieldName: 'firstName');
    AppValidators.validateContactName(lastName, fieldName: 'lastName');
    final trimmedPhone = phone?.trim();
    if (trimmedPhone != null && trimmedPhone.isNotEmpty) {
      AppValidators.validateWesternPhone(trimmedPhone);
    }
  }
}

extension ProjectStakeholderRefDtoValidation on ProjectStakeholderRefDto {
  void validate() {
    final id = accountId?.trim();
    final name = accountName?.trim();
    final hasId = id != null && id.isNotEmpty;
    final hasName = name != null && name.isNotEmpty;

    // Caught here rather than at the server: a 400 on registration loses the
    // whole form, including photos the rep already waited to upload.
    if (hasId == hasName) {
      throw ArgumentError(
        'a stakeholder needs exactly one of accountId or accountName',
      );
    }
    if (primaryContactId != null && !hasId) {
      throw ArgumentError(
        'primaryContactId is only valid alongside accountId',
      );
    }
    // You either point at an existing person or describe a new one, never
    // both — the server would have to guess which is the link's primary
    // contact.
    if (primaryContactId != null && contact != null) {
      throw ArgumentError(
        'a stakeholder needs at most one of primaryContactId or contact',
      );
    }
    if (hasName) {
      AppValidators.validateAccountName(name, fieldName: 'accountName');
    }
    // `accountType` only says anything about an account being created; next
    // to an `accountId` it is a claim about a record this request does not
    // own.
    if (accountType != null && !hasName) {
      throw ArgumentError('accountType is only valid alongside accountName');
    }
    contact?.validate();
    final trimmedNote = note?.trim();
    if (trimmedNote != null && trimmedNote.length > 500) {
      throw ArgumentError('stakeholder note cannot exceed 500 characters');
    }
  }
}

/// §5 `POST /projects` body. `currency` is required exactly when
/// `estimatedValue` is present — enforced by `AppValidators.validateMoney`
/// in `.validate()`, not by the type system.
@freezed
abstract class RegisterProjectRequest with _$RegisterProjectRequest {
  /// Optional-and-absent must actually be absent on the wire:
  /// json_serializable emits every key by default, and this API rejects
  /// present-but-null on validated optional fields (see
  /// `SubmitWonRequest` for the case that surfaced it).
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory RegisterProjectRequest({
    required String name,
    required BuildingType buildingType,
    required String description,
    required LocationDto location,
    required ConstructionPhase constructionPhase,
    required List<ProjectFileRefDto> files,
    String? addressLine,
    int? unitCount,
    double? estimatedValue,
    String? currency,
    @Default(<ProjectStakeholderRefDto>[])
    List<ProjectStakeholderRefDto> stakeholders,
    String? decisionMakerContactId,
    String? notes,
  }) = _RegisterProjectRequest;

  factory RegisterProjectRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterProjectRequestFromJson(json);
}

extension RegisterProjectRequestValidation on RegisterProjectRequest {
  /// Mirrors the auth module's per-model `.validate()` extension pattern —
  /// called before the network request, server response is the fallback.
  void validate() {
    final trimmedName = name.trim();
    if (trimmedName.length < 3 || trimmedName.length > 200) {
      throw ArgumentError('name must be 3-200 characters');
    }
    final trimmedDescription = description.trim();
    if (trimmedDescription.length < 10 || trimmedDescription.length > 2000) {
      throw ArgumentError('description must be 10-2000 characters');
    }
    location.validate();
    if (files.isEmpty || files.length > 10) {
      throw ArgumentError('files must contain 1-10 items');
    }
    for (final file in files) {
      file.validate();
    }
    final trimmedAddress = addressLine?.trim();
    if (trimmedAddress != null && trimmedAddress.length > 500) {
      throw ArgumentError('addressLine cannot exceed 500 characters');
    }
    if (unitCount != null && (unitCount! < 1 || unitCount! > 100000)) {
      throw ArgumentError('unitCount must be 1-100000');
    }
    AppValidators.validateMoney(
      amount: estimatedValue,
      currency: currency,
      fieldName: 'estimatedValue',
    );
    if (stakeholders.length > 20) {
      throw ArgumentError('stakeholders cannot exceed 20 items');
    }
    for (final stakeholder in stakeholders) {
      stakeholder.validate();
    }
    final trimmedNotes = notes?.trim();
    if (trimmedNotes != null && trimmedNotes.length > 2000) {
      throw ArgumentError('notes cannot exceed 2000 characters');
    }
  }
}
