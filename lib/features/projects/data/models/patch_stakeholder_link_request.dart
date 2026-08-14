import '../../../../core/helpers/validators.dart';
import 'omit.dart';

/// stakeholders.md `PATCH /projects/{projectId}/stakeholders/{linkId}` —
/// "`primaryContactId` and `note` only." The role cannot be changed through
/// this route by design (it's part of the link's identity) — use
/// `ReplaceStakeholderLinkRequest`, or close and link again.
class PatchStakeholderLinkRequest {
  /// `String?` value, or [omit] to leave it unchanged.
  final Object? primaryContactId;

  /// `String?` value, or [omit] to leave it unchanged.
  final Object? note;

  const PatchStakeholderLinkRequest({
    this.primaryContactId = omit,
    this.note = omit,
  });

  void validate() {
    if (primaryContactId != omit && primaryContactId != null) {
      AppValidators.validateUuid(
        primaryContactId as String,
        fieldName: 'primaryContactId',
      );
    }
    if (note != omit && note != null) {
      final trimmed = (note as String).trim();
      if (trimmed.length > 500) {
        throw ArgumentError('note cannot exceed 500 characters');
      }
    }
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (primaryContactId != omit) json['primaryContactId'] = primaryContactId;
    if (note != omit) json['note'] = note;
    return json;
  }
}
