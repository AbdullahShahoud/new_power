// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'close_stakeholder_link_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CloseStakeholderLinkRequest _$CloseStakeholderLinkRequestFromJson(
  Map<String, dynamic> json,
) => _CloseStakeholderLinkRequest(
  reason: json['reason'] as String,
  endedAt: json['endedAt'] == null
      ? null
      : DateTime.parse(json['endedAt'] as String),
);

Map<String, dynamic> _$CloseStakeholderLinkRequestToJson(
  _CloseStakeholderLinkRequest instance,
) => <String, dynamic>{
  'reason': instance.reason,
  'endedAt': instance.endedAt?.toIso8601String(),
};
