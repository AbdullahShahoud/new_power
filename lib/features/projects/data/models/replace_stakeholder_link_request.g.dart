// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'replace_stakeholder_link_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReplaceStakeholderLinkRequest _$ReplaceStakeholderLinkRequestFromJson(
  Map<String, dynamic> json,
) => _ReplaceStakeholderLinkRequest(
  newAccountId: json['newAccountId'] as String,
  newPrimaryContactId: json['newPrimaryContactId'] as String?,
  note: json['note'] as String?,
  reason: json['reason'] as String,
);

Map<String, dynamic> _$ReplaceStakeholderLinkRequestToJson(
  _ReplaceStakeholderLinkRequest instance,
) => <String, dynamic>{
  'newAccountId': instance.newAccountId,
  'newPrimaryContactId': ?instance.newPrimaryContactId,
  'note': ?instance.note,
  'reason': instance.reason,
};
