// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queued_activity_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QueuedActivityRecord _$QueuedActivityRecordFromJson(
  Map<String, dynamic> json,
) => _QueuedActivityRecord(
  item: SyncActivityItem.fromJson(json['item'] as Map<String, dynamic>),
  queuedAt: const UtcDateTimeConverter().fromJson(json['queuedAt'] as String),
  lastErrorCode: json['lastErrorCode'] as String?,
  lastErrorMessage: json['lastErrorMessage'] as String?,
);

Map<String, dynamic> _$QueuedActivityRecordToJson(
  _QueuedActivityRecord instance,
) => <String, dynamic>{
  'item': instance.item,
  'queuedAt': const UtcDateTimeConverter().toJson(instance.queuedAt),
  'lastErrorCode': instance.lastErrorCode,
  'lastErrorMessage': instance.lastErrorMessage,
};
