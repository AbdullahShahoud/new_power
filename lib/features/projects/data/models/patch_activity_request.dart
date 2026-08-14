import '../../../../core/helpers/validators.dart';
import 'enums.dart';
import 'omit.dart';

/// §5 `PATCH /activities/{id}` body — all fields optional, at least one
/// should be present. `nextActionAt`/`competitorAccountId` are the doc's
/// "`null` clears it" nullable fields, same [omit] sentinel as
/// `PatchProjectRequest`. Not editable, by design: `kind`, `channel`,
/// `occurredAt`, `location`, `constructionPhaseObserved`, `files` — those
/// aren't fields on this class at all, so there's nothing to accidentally
/// send.
class PatchActivityRequest {
  final ActivityPurpose? purpose;
  final ActivityOutcome? outcome;
  final String? notes;
  final List<String>? personsMet;

  /// `DateTime?` value, or [omit] to leave it unchanged. `null` cancels a
  /// promise the rep no longer intends to keep.
  final Object? nextActionAt;

  /// `String?` value, or [omit] to leave it unchanged. `null` clears it.
  final Object? competitorAccountId;

  const PatchActivityRequest({
    this.purpose,
    this.outcome,
    this.notes,
    this.personsMet,
    this.nextActionAt = omit,
    this.competitorAccountId = omit,
  });

  void validate() {
    if (notes != null) {
      AppValidators.validateActivityNotes(notes!);
    }
    if (personsMet != null) {
      if (personsMet!.isEmpty || personsMet!.length > 20) {
        throw ArgumentError('personsMet must contain 1-20 items');
      }
      for (final personId in personsMet!) {
        AppValidators.validateUuid(personId, fieldName: 'personsMet');
      }
    }
    if (competitorAccountId != omit && competitorAccountId != null) {
      AppValidators.validateUuid(
        competitorAccountId as String,
        fieldName: 'competitorAccountId',
      );
    }
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (purpose != null) json['purpose'] = purpose!.wireValue;
    if (outcome != null) json['outcome'] = outcome!.wireValue;
    if (notes != null) json['notes'] = notes;
    if (personsMet != null) json['personsMet'] = personsMet;
    if (nextActionAt != omit) {
      json['nextActionAt'] = (nextActionAt as DateTime?)?.toUtc().toIso8601String();
    }
    if (competitorAccountId != omit) {
      json['competitorAccountId'] = competitorAccountId;
    }
    return json;
  }
}
