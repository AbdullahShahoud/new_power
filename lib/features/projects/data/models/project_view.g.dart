// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectView _$ProjectViewFromJson(Map<String, dynamic> json) => _ProjectView(
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
  lastActivityAt: json['lastActivityAt'] == null
      ? null
      : DateTime.parse(json['lastActivityAt'] as String),
  nextActionAt: json['nextActionAt'] == null
      ? null
      : DateTime.parse(json['nextActionAt'] as String),
  closedAt: json['closedAt'] == null
      ? null
      : DateTime.parse(json['closedAt'] as String),
  closedBy: json['closedBy'] as String?,
  version: (json['version'] as num).toInt(),
  createdBy: json['createdBy'] as String?,
  createdByUser: json['createdByUser'] == null
      ? null
      : ActorView.fromJson(json['createdByUser'] as Map<String, dynamic>),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$ProjectViewToJson(
  _ProjectView instance,
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
  'lastActivityAt': instance.lastActivityAt?.toIso8601String(),
  'nextActionAt': instance.nextActionAt?.toIso8601String(),
  'closedAt': instance.closedAt?.toIso8601String(),
  'closedBy': instance.closedBy,
  'version': instance.version,
  'createdBy': instance.createdBy,
  'createdByUser': instance.createdByUser,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
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

_ProjectSummaryView _$ProjectSummaryViewFromJson(Map<String, dynamic> json) =>
    _ProjectSummaryView(
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
          : TerritoryRefView.fromJson(
              json['territory'] as Map<String, dynamic>,
            ),
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
      lastActivityAt: json['lastActivityAt'] == null
          ? null
          : DateTime.parse(json['lastActivityAt'] as String),
      nextActionAt: json['nextActionAt'] == null
          ? null
          : DateTime.parse(json['nextActionAt'] as String),
      closedAt: json['closedAt'] == null
          ? null
          : DateTime.parse(json['closedAt'] as String),
      closedBy: json['closedBy'] as String?,
      version: (json['version'] as num).toInt(),
      createdBy: json['createdBy'] as String?,
      createdByUser: json['createdByUser'] == null
          ? null
          : ActorView.fromJson(json['createdByUser'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      imageCount: (json['imageCount'] as num).toInt(),
      activityCount: (json['activityCount'] as num).toInt(),
      stakeholderCount: (json['stakeholderCount'] as num).toInt(),
      distanceM: (json['distanceM'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProjectSummaryViewToJson(
  _ProjectSummaryView instance,
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
  'lastActivityAt': instance.lastActivityAt?.toIso8601String(),
  'nextActionAt': instance.nextActionAt?.toIso8601String(),
  'closedAt': instance.closedAt?.toIso8601String(),
  'closedBy': instance.closedBy,
  'version': instance.version,
  'createdBy': instance.createdBy,
  'createdByUser': instance.createdByUser,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'imageCount': instance.imageCount,
  'activityCount': instance.activityCount,
  'stakeholderCount': instance.stakeholderCount,
  'distanceM': instance.distanceM,
};
