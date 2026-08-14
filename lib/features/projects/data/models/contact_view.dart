import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/utc_date_time_converter.dart';
import 'enums.dart';

part 'contact_view.freezed.dart';
part 'contact_view.g.dart';

/// The account a contact is filed under, joined onto every contact read.
/// directory-mobile-integration.md §7.1: "`account` is **null exactly when
/// `accountId` is null** — every read joins it, so a null means *nobody has
/// filed this person*, never *the join was skipped*."
@freezed
abstract class ContactAccountRefView with _$ContactAccountRefView {
  // ignore: invalid_annotation_target
  @JsonSerializable(converters: [UtcDateTimeConverter()])
  const factory ContactAccountRefView({
    required String id,
    required String name,
    required AccountType type,
  }) = _ContactAccountRefView;

  factory ContactAccountRefView.fromJson(Map<String, dynamic> json) =>
      _$ContactAccountRefViewFromJson(json);
}

/// directory-mobile-integration.md §7 — a person, filed or not.
///
/// **`accountId` is optional by design.** The top-level `/contacts`
/// resource exists precisely because the old account-nested route "could
/// not express an unfiled person — and forcing an account at that moment is
/// what produced throwaway *Unknown Contractor* records." A rep takes a
/// name and a number at a site gate and only later learns which company is
/// behind it.
///
/// [company] is **free text, not a reference** — what the person *said*
/// they work for. Carrying both [accountId] and [company] is normal, not a
/// contradiction: it's what every contact looks like the moment after being
/// filed. The account wins on read; `company` is never cleared and isn't
/// editable by PATCH, because it's the raw capture that later found the
/// account.
@freezed
abstract class ContactView with _$ContactView {
  // ignore: invalid_annotation_target
  @JsonSerializable(converters: [UtcDateTimeConverter()])
  const factory ContactView({
    required String id,
    String? accountId,
    ContactAccountRefView? account,
    String? company,
    required String firstName,
    required String lastName,
    String? position,
    String? phone,
    String? email,
    String? notes,
    @Default(false) bool isPrimary,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? archivedAt,
  }) = _ContactView;

  factory ContactView.fromJson(Map<String, dynamic> json) =>
      _$ContactViewFromJson(json);
}

extension ContactViewX on ContactView {
  String get fullName => '$firstName $lastName';

  /// What to show under the name: the filed account if there is one, else
  /// the raw captured company. Mirrors "the account wins on read".
  String? get affiliation => account?.name ?? company;

  /// Nobody has filed this person against a company yet.
  bool get isUnfiled => accountId == null;
}
