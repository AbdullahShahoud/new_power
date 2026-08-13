// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_activity_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SyncActivityItem _$SyncActivityItemFromJson(Map<String, dynamic> json) =>
    _SyncActivityItem(
      projectId: json['projectId'] as String,
      clientRef: json['clientRef'] as String,
      kind: $enumDecode(_$ActivityKindEnumMap, json['kind']),
      channel: $enumDecodeNullable(_$ActivityChannelEnumMap, json['channel']),
      purpose: $enumDecode(_$ActivityPurposeEnumMap, json['purpose']),
      outcome: $enumDecode(_$ActivityOutcomeEnumMap, json['outcome']),
      occurredAt: const UtcDateTimeConverter().fromJson(
        json['occurredAt'] as String,
      ),
      notes: json['notes'] as String,
      personsMet: (json['personsMet'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      location: json['location'] == null
          ? null
          : ActivityLocationDto.fromJson(
              json['location'] as Map<String, dynamic>,
            ),
      constructionPhaseObserved: $enumDecodeNullable(
        _$ConstructionPhaseEnumMap,
        json['constructionPhaseObserved'],
      ),
      competitorAccountId: json['competitorAccountId'] as String?,
      nextActionAt: _$JsonConverterFromJson<String, DateTime>(
        json['nextActionAt'],
        const UtcDateTimeConverter().fromJson,
      ),
      files:
          (json['files'] as List<dynamic>?)
              ?.map((e) => UploadedFileDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <UploadedFileDto>[],
    );

Map<String, dynamic> _$SyncActivityItemToJson(_SyncActivityItem instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'clientRef': instance.clientRef,
      'kind': _$ActivityKindEnumMap[instance.kind]!,
      'channel': ?_$ActivityChannelEnumMap[instance.channel],
      'purpose': _$ActivityPurposeEnumMap[instance.purpose]!,
      'outcome': _$ActivityOutcomeEnumMap[instance.outcome]!,
      'occurredAt': const UtcDateTimeConverter().toJson(instance.occurredAt),
      'notes': instance.notes,
      'personsMet': instance.personsMet,
      'location': ?instance.location,
      'constructionPhaseObserved':
          ?_$ConstructionPhaseEnumMap[instance.constructionPhaseObserved],
      'competitorAccountId': ?instance.competitorAccountId,
      'nextActionAt': ?_$JsonConverterToJson<String, DateTime>(
        instance.nextActionAt,
        const UtcDateTimeConverter().toJson,
      ),
      'files': instance.files,
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
