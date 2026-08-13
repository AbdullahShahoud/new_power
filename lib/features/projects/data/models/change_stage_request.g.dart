// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_stage_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChangeStageRequest _$ChangeStageRequestFromJson(Map<String, dynamic> json) =>
    _ChangeStageRequest(
      stage: $enumDecode(_$ProjectStageEnumMap, json['stage']),
      note: json['note'] as String?,
      expectedVersion: (json['expectedVersion'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ChangeStageRequestToJson(_ChangeStageRequest instance) =>
    <String, dynamic>{
      'stage': _$ProjectStageEnumMap[instance.stage]!,
      'note': ?instance.note,
      'expectedVersion': ?instance.expectedVersion,
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
