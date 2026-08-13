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
  setAt: const UtcDateTimeConverter().fromJson(json['setAt'] as String),
  endedAt: _$JsonConverterFromJson<String, DateTime>(
    json['endedAt'],
    const UtcDateTimeConverter().fromJson,
  ),
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
  'setAt': const UtcDateTimeConverter().toJson(instance.setAt),
  'endedAt': _$JsonConverterToJson<String, DateTime>(
    instance.endedAt,
    const UtcDateTimeConverter().toJson,
  ),
  'endReason': instance.endReason,
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
