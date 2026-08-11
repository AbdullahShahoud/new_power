// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_project_card_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NearbyOwnerRefView _$NearbyOwnerRefViewFromJson(Map<String, dynamic> json) =>
    _NearbyOwnerRefView(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$NearbyOwnerRefViewToJson(_NearbyOwnerRefView instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };

_NearbyProjectCardView _$NearbyProjectCardViewFromJson(
  Map<String, dynamic> json,
) => _NearbyProjectCardView(
  name: json['name'] as String,
  buildingType: $enumDecode(_$BuildingTypeEnumMap, json['buildingType']),
  description: json['description'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  addressLine: json['addressLine'] as String?,
  constructionPhase: $enumDecode(
    _$ConstructionPhaseEnumMap,
    json['constructionPhase'],
  ),
  stage: $enumDecode(_$ProjectStageEnumMap, json['stage']),
  status: $enumDecode(_$ProjectStatusEnumMap, json['status']),
  owner: NearbyOwnerRefView.fromJson(json['owner'] as Map<String, dynamic>),
  unitCount: (json['unitCount'] as num?)?.toInt(),
  estimatedValue: (json['estimatedValue'] as num?)?.toDouble(),
  currency: json['currency'] as String?,
  images:
      (json['images'] as List<dynamic>?)
          ?.map((e) => StoredFileView.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <StoredFileView>[],
  distanceM: (json['distanceM'] as num).toDouble(),
  projectId: json['projectId'] as String?,
  isYours: json['isYours'] as bool?,
);

Map<String, dynamic> _$NearbyProjectCardViewToJson(
  _NearbyProjectCardView instance,
) => <String, dynamic>{
  'name': instance.name,
  'buildingType': _$BuildingTypeEnumMap[instance.buildingType]!,
  'description': instance.description,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'addressLine': instance.addressLine,
  'constructionPhase': _$ConstructionPhaseEnumMap[instance.constructionPhase]!,
  'stage': _$ProjectStageEnumMap[instance.stage]!,
  'status': _$ProjectStatusEnumMap[instance.status]!,
  'owner': instance.owner,
  'unitCount': instance.unitCount,
  'estimatedValue': instance.estimatedValue,
  'currency': instance.currency,
  'images': instance.images,
  'distanceM': instance.distanceM,
  'projectId': instance.projectId,
  'isYours': instance.isYours,
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
