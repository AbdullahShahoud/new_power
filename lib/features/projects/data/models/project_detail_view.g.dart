// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_detail_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PrimaryContactRefView _$PrimaryContactRefViewFromJson(
  Map<String, dynamic> json,
) => _PrimaryContactRefView(
  contactId: json['contactId'] as String,
  accountId: json['accountId'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  position: json['position'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
);

Map<String, dynamic> _$PrimaryContactRefViewToJson(
  _PrimaryContactRefView instance,
) => <String, dynamic>{
  'contactId': instance.contactId,
  'accountId': instance.accountId,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'position': instance.position,
  'phone': instance.phone,
  'email': instance.email,
};

_StakeholderRefView _$StakeholderRefViewFromJson(Map<String, dynamic> json) =>
    _StakeholderRefView(
      linkId: json['linkId'] as String,
      accountId: json['accountId'] as String,
      accountName: json['accountName'] as String,
      accountType: json['accountType'] as String,
      role: $enumDecode(_$StakeholderRoleEnumMap, json['role']),
      primaryContact: json['primaryContact'] == null
          ? null
          : PrimaryContactRefView.fromJson(
              json['primaryContact'] as Map<String, dynamic>,
            ),
      note: json['note'] as String?,
      startedAt: const UtcDateTimeConverter().fromJson(
        json['startedAt'] as String,
      ),
      endedAt: _$JsonConverterFromJson<String, DateTime>(
        json['endedAt'],
        const UtcDateTimeConverter().fromJson,
      ),
      isActive: json['isActive'] as bool? ?? true,
      replacedByLinkId: json['replacedByLinkId'] as String?,
      linkedBy: json['linkedBy'] as String?,
      linkedByUser: json['linkedByUser'] == null
          ? null
          : ActorView.fromJson(json['linkedByUser'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StakeholderRefViewToJson(_StakeholderRefView instance) =>
    <String, dynamic>{
      'linkId': instance.linkId,
      'accountId': instance.accountId,
      'accountName': instance.accountName,
      'accountType': instance.accountType,
      'role': _$StakeholderRoleEnumMap[instance.role]!,
      'primaryContact': instance.primaryContact,
      'note': instance.note,
      'startedAt': const UtcDateTimeConverter().toJson(instance.startedAt),
      'endedAt': _$JsonConverterToJson<String, DateTime>(
        instance.endedAt,
        const UtcDateTimeConverter().toJson,
      ),
      'isActive': instance.isActive,
      'replacedByLinkId': instance.replacedByLinkId,
      'linkedBy': instance.linkedBy,
      'linkedByUser': instance.linkedByUser,
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

_DecisionMakerRefView _$DecisionMakerRefViewFromJson(
  Map<String, dynamic> json,
) => _DecisionMakerRefView(
  contactId: json['contactId'] as String,
  contactName: json['contactName'] as String,
  accountId: json['accountId'] as String,
  accountName: json['accountName'] as String,
);

Map<String, dynamic> _$DecisionMakerRefViewToJson(
  _DecisionMakerRefView instance,
) => <String, dynamic>{
  'contactId': instance.contactId,
  'contactName': instance.contactName,
  'accountId': instance.accountId,
  'accountName': instance.accountName,
};

_ProjectDetailView _$ProjectDetailViewFromJson(
  Map<String, dynamic> json,
) => _ProjectDetailView(
  id: json['id'] as String,
  name: json['name'] as String,
  buildingType: $enumDecode(_$BuildingTypeEnumMap, json['buildingType']),
  description: json['description'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  addressLine: json['addressLine'] as String?,
  territoryId: json['territoryId'] as String?,
  territory: json['territory'] == null
      ? null
      : TerritoryRefView.fromJson(json['territory'] as Map<String, dynamic>),
  outsideTerritory: json['outsideTerritory'] as bool? ?? false,
  constructionPhase: $enumDecode(
    _$ConstructionPhaseEnumMap,
    json['constructionPhase'],
  ),
  stage: $enumDecode(_$ProjectStageEnumMap, json['stage']),
  status: $enumDecode(_$ProjectStatusEnumMap, json['status']),
  ownerId: json['ownerId'] as String,
  owner: json['owner'] == null
      ? null
      : ActorView.fromJson(json['owner'] as Map<String, dynamic>),
  unitCount: (json['unitCount'] as num?)?.toInt(),
  estimatedValue: (json['estimatedValue'] as num?)?.toDouble(),
  currency: json['currency'] as String?,
  notes: json['notes'] as String?,
  lastActivityAt: _$JsonConverterFromJson<String, DateTime>(
    json['lastActivityAt'],
    const UtcDateTimeConverter().fromJson,
  ),
  nextActionAt: _$JsonConverterFromJson<String, DateTime>(
    json['nextActionAt'],
    const UtcDateTimeConverter().fromJson,
  ),
  closedAt: _$JsonConverterFromJson<String, DateTime>(
    json['closedAt'],
    const UtcDateTimeConverter().fromJson,
  ),
  closedBy: json['closedBy'] as String?,
  version: (json['version'] as num).toInt(),
  createdBy: json['createdBy'] as String?,
  createdByUser: json['createdByUser'] == null
      ? null
      : ActorView.fromJson(json['createdByUser'] as Map<String, dynamic>),
  createdAt: const UtcDateTimeConverter().fromJson(json['createdAt'] as String),
  updatedAt: const UtcDateTimeConverter().fromJson(json['updatedAt'] as String),
  imageCount: (json['imageCount'] as num).toInt(),
  images:
      (json['images'] as List<dynamic>?)
          ?.map((e) => ProjectImageView.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ProjectImageView>[],
  activities:
      (json['activities'] as List<dynamic>?)
          ?.map((e) => ActivityView.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ActivityView>[],
  stakeholders:
      (json['stakeholders'] as List<dynamic>?)
          ?.map((e) => StakeholderRefView.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <StakeholderRefView>[],
  decisionMaker: json['decisionMaker'] == null
      ? null
      : DecisionMakerRefView.fromJson(
          json['decisionMaker'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ProjectDetailViewToJson(
  _ProjectDetailView instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'buildingType': _$BuildingTypeEnumMap[instance.buildingType]!,
  'description': instance.description,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'addressLine': instance.addressLine,
  'territoryId': instance.territoryId,
  'territory': instance.territory,
  'outsideTerritory': instance.outsideTerritory,
  'constructionPhase': _$ConstructionPhaseEnumMap[instance.constructionPhase]!,
  'stage': _$ProjectStageEnumMap[instance.stage]!,
  'status': _$ProjectStatusEnumMap[instance.status]!,
  'ownerId': instance.ownerId,
  'owner': instance.owner,
  'unitCount': instance.unitCount,
  'estimatedValue': instance.estimatedValue,
  'currency': instance.currency,
  'notes': instance.notes,
  'lastActivityAt': _$JsonConverterToJson<String, DateTime>(
    instance.lastActivityAt,
    const UtcDateTimeConverter().toJson,
  ),
  'nextActionAt': _$JsonConverterToJson<String, DateTime>(
    instance.nextActionAt,
    const UtcDateTimeConverter().toJson,
  ),
  'closedAt': _$JsonConverterToJson<String, DateTime>(
    instance.closedAt,
    const UtcDateTimeConverter().toJson,
  ),
  'closedBy': instance.closedBy,
  'version': instance.version,
  'createdBy': instance.createdBy,
  'createdByUser': instance.createdByUser,
  'createdAt': const UtcDateTimeConverter().toJson(instance.createdAt),
  'updatedAt': const UtcDateTimeConverter().toJson(instance.updatedAt),
  'imageCount': instance.imageCount,
  'images': instance.images,
  'activities': instance.activities,
  'stakeholders': instance.stakeholders,
  'decisionMaker': instance.decisionMaker,
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

const _$ProjectStageEnumMap = {
  ProjectStage.lead: 'LEAD',
  ProjectStage.qualified: 'QUALIFIED',
  ProjectStage.engagement: 'ENGAGEMENT',
  ProjectStage.approval: 'APPROVAL',
  ProjectStage.boqReceived: 'BOQ_RECEIVED',
  ProjectStage.quoteIssued: 'QUOTE_ISSUED',
  ProjectStage.committed: 'COMMITTED',
  ProjectStage.won: 'WON',
  ProjectStage.lost: 'LOST',
};

const _$ProjectStatusEnumMap = {
  ProjectStatus.active: 'ACTIVE',
  ProjectStatus.dormant: 'DORMANT',
  ProjectStatus.cancelled: 'CANCELLED',
};
