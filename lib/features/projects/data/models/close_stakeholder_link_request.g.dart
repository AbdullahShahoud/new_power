// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'close_stakeholder_link_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CloseStakeholderLinkRequest _$CloseStakeholderLinkRequestFromJson(
  Map<String, dynamic> json,
) => _CloseStakeholderLinkRequest(
  reason: json['reason'] as String,
  endedAt: _$JsonConverterFromJson<String, DateTime>(
    json['endedAt'],
    const UtcDateTimeConverter().fromJson,
  ),
);

Map<String, dynamic> _$CloseStakeholderLinkRequestToJson(
  _CloseStakeholderLinkRequest instance,
) => <String, dynamic>{
  'reason': instance.reason,
  'endedAt': ?_$JsonConverterToJson<String, DateTime>(
    instance.endedAt,
    const UtcDateTimeConverter().toJson,
  ),
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
