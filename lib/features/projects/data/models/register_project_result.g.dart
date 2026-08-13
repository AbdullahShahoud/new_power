// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_project_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisteredProjectView _$RegisteredProjectViewFromJson(
  Map<String, dynamic> json,
) => _RegisteredProjectView(
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
  activityCount: (json['activityCount'] as num).toInt(),
  stakeholderCount: (json['stakeholderCount'] as num).toInt(),
  distanceM: (json['distanceM'] as num?)?.toDouble(),
  images:
      (json['images'] as List<dynamic>?)
          ?.map((e) => ProjectImageView.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ProjectImageView>[],
);

Map<String, dynamic> _$RegisteredProjectViewToJson(
  _RegisteredProjectView instance,
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
  'activityCount': instance.activityCount,
  'stakeholderCount': instance.stakeholderCount,
  'distanceM': instance.distanceM,
  'images': instance.images,
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

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

_StakeholderLinkFailure _$StakeholderLinkFailureFromJson(
  Map<String, dynamic> json,
) => _StakeholderLinkFailure(
  accountId: json['accountId'] as String,
  reason: json['reason'] as String,
);

Map<String, dynamic> _$StakeholderLinkFailureToJson(
  _StakeholderLinkFailure instance,
) => <String, dynamic>{
  'accountId': instance.accountId,
  'reason': instance.reason,
};

_RegisterProjectResult _$RegisterProjectResultFromJson(
  Map<String, dynamic> json,
) => _RegisterProjectResult(
  project: RegisteredProjectView.fromJson(
    json['project'] as Map<String, dynamic>,
  ),
  nearbyProjects:
      (json['nearbyProjects'] as List<dynamic>?)
          ?.map(
            (e) => NearbyProjectCardView.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <NearbyProjectCardView>[],
  stakeholderLinkFailures:
      (json['stakeholderLinkFailures'] as List<dynamic>?)
          ?.map(
            (e) => StakeholderLinkFailure.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <StakeholderLinkFailure>[],
);

Map<String, dynamic> _$RegisterProjectResultToJson(
  _RegisterProjectResult instance,
) => <String, dynamic>{
  'project': instance.project,
  'nearbyProjects': instance.nearbyProjects,
  'stakeholderLinkFailures': instance.stakeholderLinkFailures,
};
