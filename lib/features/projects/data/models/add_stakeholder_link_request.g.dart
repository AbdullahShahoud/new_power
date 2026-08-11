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
  startedAt: json['startedAt'] == null
      ? null
      : DateTime.parse(json['startedAt'] as String),
);

Map<String, dynamic> _$AddStakeholderLinkRequestToJson(
  _AddStakeholderLinkRequest instance,
) => <String, dynamic>{
  'accountId': instance.accountId,
  'role': _$StakeholderRoleEnumMap[instance.role]!,
  'primaryContactId': instance.primaryContactId,
  'note': instance.note,
  'startedAt': instance.startedAt?.toIso8601String(),
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
