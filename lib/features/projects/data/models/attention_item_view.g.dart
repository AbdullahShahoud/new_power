// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attention_item_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AttentionItemView _$AttentionItemViewFromJson(Map<String, dynamic> json) =>
    _AttentionItemView(
      projectId: json['projectId'] as String,
      name: json['name'] as String,
      reason: $enumDecode(_$AttentionReasonEnumMap, json['reason']),
      message: json['message'] as String,
      dueAt: json['dueAt'] == null
          ? null
          : DateTime.parse(json['dueAt'] as String),
      daysWaiting: (json['daysWaiting'] as num).toInt(),
    );

Map<String, dynamic> _$AttentionItemViewToJson(_AttentionItemView instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'name': instance.name,
      'reason': _$AttentionReasonEnumMap[instance.reason]!,
      'message': instance.message,
      'dueAt': instance.dueAt?.toIso8601String(),
      'daysWaiting': instance.daysWaiting,
    };

const _$AttentionReasonEnumMap = {
  AttentionReason.followUpDue: 'FOLLOW_UP_DUE',
  AttentionReason.awaitingThem: 'AWAITING_THEM',
  AttentionReason.stageWithoutEvidence: 'STAGE_WITHOUT_EVIDENCE',
  AttentionReason.noActivity: 'NO_ACTIVITY',
};
