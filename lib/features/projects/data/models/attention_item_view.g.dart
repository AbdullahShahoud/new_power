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
      dueAt: _$JsonConverterFromJson<String, DateTime>(
        json['dueAt'],
        const UtcDateTimeConverter().fromJson,
      ),
      daysWaiting: (json['daysWaiting'] as num).toInt(),
    );

Map<String, dynamic> _$AttentionItemViewToJson(_AttentionItemView instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'name': instance.name,
      'reason': _$AttentionReasonEnumMap[instance.reason]!,
      'message': instance.message,
      'dueAt': _$JsonConverterToJson<String, DateTime>(
        instance.dueAt,
        const UtcDateTimeConverter().toJson,
      ),
      'daysWaiting': instance.daysWaiting,
    };

const _$AttentionReasonEnumMap = {
  AttentionReason.followUpDue: 'FOLLOW_UP_DUE',
  AttentionReason.awaitingThem: 'AWAITING_THEM',
  AttentionReason.stageWithoutEvidence: 'STAGE_WITHOUT_EVIDENCE',
  AttentionReason.noActivity: 'NO_ACTIVITY',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
