// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_stakeholder_link_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddStakeholderLinkRequest _$AddStakeholderLinkRequestFromJson(
  Map<String, dynamic> json,
) => _AddStakeholderLinkRequest(
  accountId: json['accountId'] as String,
  role: $enumDecode(_$StakeholderRoleEnumMap, json['role']),
  primaryContactId: json['primaryContactId'] as String?,
  note: json['note'] as String?,
  startedAt: _$JsonConverterFromJson<String, DateTime>(
    json['startedAt'],
    const UtcDateTimeConverter().fromJson,
  ),
);

Map<String, dynamic> _$AddStakeholderLinkRequestToJson(
  _AddStakeholderLinkRequest instance,
) => <String, dynamic>{
  'accountId': instance.accountId,
  'role': _$StakeholderRoleEnumMap[instance.role]!,
  'primaryContactId': ?instance.primaryContactId,
  'note': ?instance.note,
  'startedAt': ?_$JsonConverterToJson<String, DateTime>(
    instance.startedAt,
    const UtcDateTimeConverter().toJson,
  ),
};

const _$StakeholderRoleEnumMap = {
  StakeholderRole.owner: 'OWNER',
  StakeholderRole.mainContractor: 'MAIN_CONTRACTOR',
  StakeholderRole.electricalMepSubcontractor: 'ELECTRICAL_MEP_SUBCONTRACTOR',
  StakeholderRole.consultantEngineeringOffice: 'CONSULTANT_ENGINEERING_OFFICE',
  StakeholderRole.purchasingManager: 'PURCHASING_MANAGER',
  StakeholderRole.siteElectrician: 'SITE_ELECTRICIAN',
  StakeholderRole.electricalEngineer: 'ELECTRICAL_ENGINEER',
  StakeholderRole.siteSupervisor: 'SITE_SUPERVISOR',
  StakeholderRole.other: 'OTHER',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
