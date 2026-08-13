// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_history_entry_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectStageHistoryEntryView _$ProjectStageHistoryEntryViewFromJson(
  Map<String, dynamic> json,
) => ProjectStageHistoryEntryView(
  id: json['id'] as String,
  projectId: json['projectId'] as String,
  fromStage: $enumDecodeNullable(_$ProjectStageEnumMap, json['fromStage']),
  toStage: $enumDecode(_$ProjectStageEnumMap, json['toStage']),
  source: $enumDecode(_$StageChangeSourceEnumMap, json['source']),
  note: json['note'] as String?,
  changedAt: const UtcDateTimeConverter().fromJson(json['changedAt'] as String),
  changedBy: json['changedBy'] as String?,
  changedByUser: json['changedByUser'] == null
      ? null
      : ActorView.fromJson(json['changedByUser'] as Map<String, dynamic>),
  $type: json['kind'] as String?,
);

Map<String, dynamic> _$ProjectStageHistoryEntryViewToJson(
  ProjectStageHistoryEntryView instance,
) => <String, dynamic>{
  'id': instance.id,
  'projectId': instance.projectId,
  'fromStage': _$ProjectStageEnumMap[instance.fromStage],
  'toStage': _$ProjectStageEnumMap[instance.toStage]!,
  'source': _$StageChangeSourceEnumMap[instance.source]!,
  'note': instance.note,
  'changedAt': const UtcDateTimeConverter().toJson(instance.changedAt),
  'changedBy': instance.changedBy,
  'changedByUser': instance.changedByUser,
  'kind': instance.$type,
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

const _$StageChangeSourceEnumMap = {
  StageChangeSource.rep: 'REP',
  StageChangeSource.manager: 'MANAGER',
  StageChangeSource.outcomeConfirmed: 'OUTCOME_CONFIRMED',
  StageChangeSource.outcomeRejected: 'OUTCOME_REJECTED',
};

ProjectStatusHistoryEntryView _$ProjectStatusHistoryEntryViewFromJson(
  Map<String, dynamic> json,
) => ProjectStatusHistoryEntryView(
  id: json['id'] as String,
  projectId: json['projectId'] as String,
  fromStatus: $enumDecode(_$ProjectStatusEnumMap, json['fromStatus']),
  toStatus: $enumDecode(_$ProjectStatusEnumMap, json['toStatus']),
  reason: json['reason'] as String,
  changedAt: const UtcDateTimeConverter().fromJson(json['changedAt'] as String),
  changedBy: json['changedBy'] as String?,
  changedByUser: json['changedByUser'] == null
      ? null
      : ActorView.fromJson(json['changedByUser'] as Map<String, dynamic>),
  $type: json['kind'] as String?,
);

Map<String, dynamic> _$ProjectStatusHistoryEntryViewToJson(
  ProjectStatusHistoryEntryView instance,
) => <String, dynamic>{
  'id': instance.id,
  'projectId': instance.projectId,
  'fromStatus': _$ProjectStatusEnumMap[instance.fromStatus]!,
  'toStatus': _$ProjectStatusEnumMap[instance.toStatus]!,
  'reason': instance.reason,
  'changedAt': const UtcDateTimeConverter().toJson(instance.changedAt),
  'changedBy': instance.changedBy,
  'changedByUser': instance.changedByUser,
  'kind': instance.$type,
};

const _$ProjectStatusEnumMap = {
  ProjectStatus.active: 'ACTIVE',
  ProjectStatus.dormant: 'DORMANT',
  ProjectStatus.cancelled: 'CANCELLED',
};
