// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_status_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChangeStatusRequest _$ChangeStatusRequestFromJson(Map<String, dynamic> json) =>
    _ChangeStatusRequest(
      status: $enumDecode(_$ProjectStatusEnumMap, json['status']),
      reason: json['reason'] as String,
      expectedVersion: (json['expectedVersion'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ChangeStatusRequestToJson(
  _ChangeStatusRequest instance,
) => <String, dynamic>{
  'status': _$ProjectStatusEnumMap[instance.status]!,
  'reason': instance.reason,
  'expectedVersion': ?instance.expectedVersion,
};

const _$ProjectStatusEnumMap = {
  ProjectStatus.active: 'ACTIVE',
  ProjectStatus.dormant: 'DORMANT',
  ProjectStatus.cancelled: 'CANCELLED',
};
