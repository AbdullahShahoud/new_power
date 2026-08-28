// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_project_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectStakeholderRefDto _$ProjectStakeholderRefDtoFromJson(
  Map<String, dynamic> json,
) => _ProjectStakeholderRefDto(
  accountId: json['accountId'] as String?,
  accountName: json['accountName'] as String?,
  accountType: $enumDecodeNullable(_$AccountTypeEnumMap, json['accountType']),
  role: $enumDecode(_$StakeholderRoleEnumMap, json['role']),
  contact: json['contact'] == null
      ? null
      : NewStakeholderContact.fromJson(json['contact'] as Map<String, dynamic>),
  primaryContactId: json['primaryContactId'] as String?,
  note: json['note'] as String?,
);

Map<String, dynamic> _$ProjectStakeholderRefDtoToJson(
  _ProjectStakeholderRefDto instance,
) => <String, dynamic>{
  'accountId': ?instance.accountId,
  'accountName': ?instance.accountName,
  'accountType': ?_$AccountTypeEnumMap[instance.accountType],
  'role': _$StakeholderRoleEnumMap[instance.role]!,
  'contact': ?instance.contact,
  'primaryContactId': ?instance.primaryContactId,
  'note': ?instance.note,
};

const _$AccountTypeEnumMap = {
  AccountType.company: 'COMPANY',
  AccountType.individual: 'INDIVIDUAL',
  AccountType.unknown: null,
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

_NewStakeholderContact _$NewStakeholderContactFromJson(
  Map<String, dynamic> json,
) => _NewStakeholderContact(
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  position: json['position'] as String?,
);

Map<String, dynamic> _$NewStakeholderContactToJson(
  _NewStakeholderContact instance,
) => <String, dynamic>{
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'phone': ?instance.phone,
  'email': ?instance.email,
  'position': ?instance.position,
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
