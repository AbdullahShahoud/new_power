import 'package:freezed_annotation/freezed_annotation.dart';
import 'enums.dart';

part 'stakeholder_link_view.freezed.dart';
part 'stakeholder_link_view.g.dart';

/// Confirmed against a live `POST /projects/{projectId}/stakeholders`
/// response — **not** the `linkId`/flat-`accountName`/flat-`accountType`
/// shape `stakeholders.md` implied by reusing `ProjectDetailView`'s
/// `StakeholderRefView` wording (projects-implementation-map.md decision
/// 20's sibling issue). The live shape nests the account and uses `id`
/// throughout: `{ id, projectId, accountId, account: {id, name, type},
/// role, primaryContactId, primaryContact: {id, ...}, note, startedAt,
/// endedAt, endReason, replacedByLinkId, isActive }`. Kept as its own type
/// rather than reusing `StakeholderRefView` (the doc-documented, still
/// unverified shape `GET /projects/{id}` embeds) — the two response
/// shapes genuinely differ, so forcing one type to parse both was the bug.
@freezed
abstract class StakeholderLinkAccountView with _$StakeholderLinkAccountView {
  const factory StakeholderLinkAccountView({
    required String id,
    required String name,
    required String type,
  }) = _StakeholderLinkAccountView;

  factory StakeholderLinkAccountView.fromJson(Map<String, dynamic> json) =>
      _$StakeholderLinkAccountViewFromJson(json);
}

@freezed
abstract class StakeholderLinkContactView with _$StakeholderLinkContactView {
  const factory StakeholderLinkContactView({
    required String id,
    required String accountId,
    required String firstName,
    required String lastName,
    String? position,
    String? phone,
    String? email,
  }) = _StakeholderLinkContactView;

  factory StakeholderLinkContactView.fromJson(Map<String, dynamic> json) =>
      _$StakeholderLinkContactViewFromJson(json);
}

@freezed
abstract class StakeholderLinkView with _$StakeholderLinkView {
  const factory StakeholderLinkView({
    required String id,
    required String projectId,
    required String accountId,
    required StakeholderLinkAccountView account,
    required StakeholderRole role,
    String? primaryContactId,
    StakeholderLinkContactView? primaryContact,
    String? note,
    required DateTime startedAt,
    DateTime? endedAt,
    String? endReason,
    String? replacedByLinkId,
    @Default(true) bool isActive,
  }) = _StakeholderLinkView;

  factory StakeholderLinkView.fromJson(Map<String, dynamic> json) =>
      _$StakeholderLinkViewFromJson(json);
}
