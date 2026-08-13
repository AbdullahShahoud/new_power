// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_detail_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ActivityRevisionView _$ActivityRevisionViewFromJson(
  Map<String, dynamic> json,
) => _ActivityRevisionView(
  id: json['id'] as String,
  activityId: json['activityId'] as String,
  before: json['before'] as Map<String, dynamic>,
  after: json['after'] as Map<String, dynamic>,
  fields: (json['fields'] as List<dynamic>).map((e) => e as String).toList(),
  revisedAt: const UtcDateTimeConverter().fromJson(json['revisedAt'] as String),
  revisedBy: json['revisedBy'] as String?,
  revisedByUser: json['revisedByUser'] == null
      ? null
      : ActorView.fromJson(json['revisedByUser'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ActivityRevisionViewToJson(
  _ActivityRevisionView instance,
) => <String, dynamic>{
  'id': instance.id,
  'activityId': instance.activityId,
  'before': instance.before,
  'after': instance.after,
  'fields': instance.fields,
  'revisedAt': const UtcDateTimeConverter().toJson(instance.revisedAt),
  'revisedBy': instance.revisedBy,
  'revisedByUser': instance.revisedByUser,
};

_ActivityDetailView _$ActivityDetailViewFromJson(
  Map<String, dynamic> json,
) => _ActivityDetailView(
  id: json['id'] as String,
  projectId: json['projectId'] as String,
  projectName: json['projectName'] as String,
  kind: $enumDecode(_$ActivityKindEnumMap, json['kind']),
  channel: $enumDecodeNullable(_$ActivityChannelEnumMap, json['channel']),
  purpose: $enumDecode(_$ActivityPurposeEnumMap, json['purpose']),
  outcome: $enumDecode(_$ActivityOutcomeEnumMap, json['outcome']),
  occurredAt: const UtcDateTimeConverter().fromJson(
    json['occurredAt'] as String,
  ),
  capturedAt: const UtcDateTimeConverter().fromJson(
    json['capturedAt'] as String,
  ),
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  locationAccuracyM: (json['locationAccuracyM'] as num?)?.toDouble(),
  locationVerified: json['locationVerified'] as bool? ?? false,
  constructionPhaseObserved: $enumDecodeNullable(
    _$ConstructionPhaseEnumMap,
    json['constructionPhaseObserved'],
  ),
  competitorAccountId: json['competitorAccountId'] as String?,
  competitorName: json['competitorName'] as String?,
  notes: json['notes'] as String,
  personsMet:
      (json['personsMet'] as List<dynamic>?)
          ?.map((e) => PersonMetRefView.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <PersonMetRefView>[],
  attachments:
      (json['attachments'] as List<dynamic>?)
          ?.map(
            (e) => ActivityAttachmentView.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <ActivityAttachmentView>[],
  nextActionAt: _$JsonConverterFromJson<String, DateTime>(
    json['nextActionAt'],
    const UtcDateTimeConverter().fromJson,
  ),
  nextActionDoneAt: _$JsonConverterFromJson<String, DateTime>(
    json['nextActionDoneAt'],
    const UtcDateTimeConverter().fromJson,
  ),
  backdated: json['backdated'] as bool? ?? false,
  backdateApprovedBy: json['backdateApprovedBy'] as String?,
  editedAfterWindow: json['editedAfterWindow'] as bool? ?? false,
  createdBy: json['createdBy'] as String?,
  createdByUser: json['createdByUser'] == null
      ? null
      : ActorView.fromJson(json['createdByUser'] as Map<String, dynamic>),
  createdAt: const UtcDateTimeConverter().fromJson(json['createdAt'] as String),
  updatedAt: const UtcDateTimeConverter().fromJson(json['updatedAt'] as String),
  revisions:
      (json['revisions'] as List<dynamic>?)
          ?.map((e) => ActivityRevisionView.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ActivityRevisionView>[],
);

Map<String, dynamic> _$ActivityDetailViewToJson(_ActivityDetailView instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'projectName': instance.projectName,
      'kind': _$ActivityKindEnumMap[instance.kind]!,
      'channel': _$ActivityChannelEnumMap[instance.channel],
      'purpose': _$ActivityPurposeEnumMap[instance.purpose]!,
      'outcome': _$ActivityOutcomeEnumMap[instance.outcome]!,
      'occurredAt': const UtcDateTimeConverter().toJson(instance.occurredAt),
      'capturedAt': const UtcDateTimeConverter().toJson(instance.capturedAt),
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'locationAccuracyM': instance.locationAccuracyM,
      'locationVerified': instance.locationVerified,
      'constructionPhaseObserved':
          _$ConstructionPhaseEnumMap[instance.constructionPhaseObserved],
      'competitorAccountId': instance.competitorAccountId,
      'competitorName': instance.competitorName,
      'notes': instance.notes,
      'personsMet': instance.personsMet,
      'attachments': instance.attachments,
      'nextActionAt': _$JsonConverterToJson<String, DateTime>(
        instance.nextActionAt,
        const UtcDateTimeConverter().toJson,
      ),
      'nextActionDoneAt': _$JsonConverterToJson<String, DateTime>(
        instance.nextActionDoneAt,
        const UtcDateTimeConverter().toJson,
      ),
      'backdated': instance.backdated,
      'backdateApprovedBy': instance.backdateApprovedBy,
      'editedAfterWindow': instance.editedAfterWindow,
      'createdBy': instance.createdBy,
      'createdByUser': instance.createdByUser,
      'createdAt': const UtcDateTimeConverter().toJson(instance.createdAt),
      'updatedAt': const UtcDateTimeConverter().toJson(instance.updatedAt),
      'revisions': instance.revisions,
    };

const _$ActivityKindEnumMap = {
  ActivityKind.visit: 'VISIT',
  ActivityKind.communication: 'COMMUNICATION',
};

const _$ActivityChannelEnumMap = {
  ActivityChannel.phoneCall: 'PHONE_CALL',
  ActivityChannel.whatsapp: 'WHATSAPP',
  ActivityChannel.email: 'EMAIL',
  ActivityChannel.sms: 'SMS',
  ActivityChannel.other: 'OTHER',
};

const _$ActivityPurposeEnumMap = {
  ActivityPurpose.discovery: 'DISCOVERY',
  ActivityPurpose.samples: 'SAMPLES',
  ActivityPurpose.catalog: 'CATALOG',
  ActivityPurpose.quantities: 'QUANTITIES',
  ActivityPurpose.priceQuote: 'PRICE_QUOTE',
  ActivityPurpose.negotiation: 'NEGOTIATION',
  ActivityPurpose.followUp: 'FOLLOW_UP',
  ActivityPurpose.gift: 'GIFT',
  ActivityPurpose.other: 'OTHER',
};

const _$ActivityOutcomeEnumMap = {
  ActivityOutcome.progressing: 'PROGRESSING',
  ActivityOutcome.needsAnotherVisit: 'NEEDS_ANOTHER_VISIT',
  ActivityOutcome.waitingOnThem: 'WAITING_ON_THEM',
  ActivityOutcome.awaitingQuantities: 'AWAITING_QUANTITIES',
  ActivityOutcome.competitorOnSite: 'COMPETITOR_ON_SITE',
  ActivityOutcome.decisionImminent: 'DECISION_IMMINENT',
  ActivityOutcome.noOnePresent: 'NO_ONE_PRESENT',
  ActivityOutcome.workStopped: 'WORK_STOPPED',
  ActivityOutcome.tooEarlyRevisitLater: 'TOO_EARLY_REVISIT_LATER',
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

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
