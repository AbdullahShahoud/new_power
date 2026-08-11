// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decision_maker_history_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DecisionMakerHistoryEntry _$DecisionMakerHistoryEntryFromJson(
  Map<String, dynamic> json,
) => _DecisionMakerHistoryEntry(
  periodId: json['periodId'] as String,
  projectId: json['projectId'] as String,
  linkId: json['linkId'] as String,
  accountId: json['accountId'] as String,
  account: StakeholderLinkAccountView.fromJson(
    json['account'] as Map<String, dynamic>,
  ),
  contactId: json['contactId'] as String,
  contact: StakeholderLinkContactView.fromJson(
    json['contact'] as Map<String, dynamic>,
  ),
  setAt: DateTime.parse(json['setAt'] as String),
  endedAt: json['endedAt'] == null
      ? null
      : DateTime.parse(json['endedAt'] as String),
  endReason: json['endReason'] as String?,
);

Map<String, dynamic> _$DecisionMakerHistoryEntryToJson(
  _DecisionMakerHistoryEntry instance,
) => <String, dynamic>{
  'periodId': instance.periodId,
  'projectId': instance.projectId,
  'linkId': instance.linkId,
  'accountId': instance.accountId,
  'account': instance.account,
  'contactId': instance.contactId,
  'contact': instance.contact,
  'setAt': instance.setAt.toIso8601String(),
  'endedAt': instance.endedAt?.toIso8601String(),
  'endReason': instance.endReason,
};
