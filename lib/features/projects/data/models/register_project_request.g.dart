// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_project_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectStakeholderRefDto _$ProjectStakeholderRefDtoFromJson(
  Map<String, dynamic> json,
) => _ProjectStakeholderRefDto(
  accountId: json['accountId'] as String,
  role: $enumDecode(_$StakeholderRoleEnumMap, json['role']),
  primaryContactId: json['primaryContactId'] as String?,
  note: json['note'] as String?,
);

Map<String, dynamic> _$ProjectStakeholderRefDtoToJson(
  _ProjectStakeholderRefDto instance,
) => <String, dynamic>{
  'accountId': instance.accountId,
  'role': _$StakeholderRoleEnumMap[instance.role]!,
  'primaryContactId': instance.primaryContactId,
  'note': instance.note,
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

_RegisterProjectRequest _$RegisterProjectRequestFromJson(
  Map<String, dynamic> json,
) => _RegisterProjectRequest(
  name: json['name'] as String,
  buildingType: $enumDecode(_$BuildingTypeEnumMap, json['buildingType']),
  description: json['description'] as String,
  location: LocationDto.fromJson(json['location'] as Map<String, dynamic>),
  constructionPhase: $enumDecode(
    _$ConstructionPhaseEnumMap,
    json['constructionPhase'],
  ),
  files: (json['files'] as List<dynamic>)
      .map((e) => ProjectFileRefDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  addressLine: json['addressLine'] as String?,
  unitCount: (json['unitCount'] as num?)?.toInt(),
  estimatedValue: (json['estimatedValue'] as num?)?.toDouble(),
  currency: json['currency'] as String?,
  stakeholders:
      (json['stakeholders'] as List<dynamic>?)
          ?.map(
            (e) => ProjectStakeholderRefDto.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <ProjectStakeholderRefDto>[],
  decisionMakerContactId: json['decisionMakerContactId'] as String?,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$RegisterProjectRequestToJson(
  _RegisterProjectRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'buildingType': _$BuildingTypeEnumMap[instance.buildingType]!,
  'description': instance.description,
  'location': instance.location,
  'constructionPhase': _$ConstructionPhaseEnumMap[instance.constructionPhase]!,
  'files': instance.files,
  'addressLine': ?instance.addressLine,
  'unitCount': ?instance.unitCount,
  'estimatedValue': ?instance.estimatedValue,
  'currency': ?instance.currency,
  'stakeholders': instance.stakeholders,
  'decisionMakerContactId': ?instance.decisionMakerContactId,
  'notes': ?instance.notes,
};

const _$BuildingTypeEnumMap = {
  BuildingType.apartmentBuilding: 'APARTMENT_BUILDING',
  BuildingType.villa: 'VILLA',
  BuildingType.residentialComplex: 'RESIDENTIAL_COMPLEX',
  BuildingType.commercial: 'COMMERCIAL',
  BuildingType.mixedUse: 'MIXED_USE',
  BuildingType.industrial: 'INDUSTRIAL',
  BuildingType.hospitality: 'HOSPITALITY',
  BuildingType.healthcare: 'HEALTHCARE',
  BuildingType.educational: 'EDUCATIONAL',
  BuildingType.government: 'GOVERNMENT',
  BuildingType.religious: 'RELIGIOUS',
  BuildingType.infrastructure: 'INFRASTRUCTURE',
  BuildingType.other: 'OTHER',
};

const _$ConstructionPhaseEnumMap = {
  ConstructionPhase.planning: 'PLANNING',
  ConstructionPhase.excavation: 'EXCAVATION',
  ConstructionPhase.foundation: 'FOUNDATION',
  ConstructionPhase.structure: 'STRUCTURE',
  ConstructionPhase.blockwork: 'BLOCKWORK',
  ConstructionPhase.electricalRoughIn: 'ELECTRICAL_ROUGH_IN',
  ConstructionPhase.plastering: 'PLASTERING',
  ConstructionPhase.finishing: 'FINISHING',
  ConstructionPhase.electricalFitOut: 'ELECTRICAL_FIT_OUT',
  ConstructionPhase.handover: 'HANDOVER',
  ConstructionPhase.completed: 'COMPLETED',
};
