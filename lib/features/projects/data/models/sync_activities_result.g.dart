// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_activities_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SyncActivityItemResult _$SyncActivityItemResultFromJson(
  Map<String, dynamic> json,
) => _SyncActivityItemResult(
  clientRef: json['clientRef'] as String,
  status: $enumDecode(_$SyncItemStatusEnumMap, json['status']),
  activityId: json['activityId'] as String?,
  error: json['error'] == null
      ? null
      : SyncActivityItemError.fromJson(json['error'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SyncActivityItemResultToJson(
  _SyncActivityItemResult instance,
) => <String, dynamic>{
  'clientRef': instance.clientRef,
  'status': _$SyncItemStatusEnumMap[instance.status]!,
  'activityId': instance.activityId,
  'error': instance.error,
};

const _$SyncItemStatusEnumMap = {
  SyncItemStatus.created: 'CREATED',
  SyncItemStatus.duplicate: 'DUPLICATE',
  SyncItemStatus.rejected: 'REJECTED',
};

_SyncActivityItemError _$SyncActivityItemErrorFromJson(
  Map<String, dynamic> json,
) => _SyncActivityItemError(
  code: json['code'] as String,
  message: json['message'] as String,
);

Map<String, dynamic> _$SyncActivityItemErrorToJson(
  _SyncActivityItemError instance,
) => <String, dynamic>{'code': instance.code, 'message': instance.message};

_SyncActivitiesResult _$SyncActivitiesResultFromJson(
  Map<String, dynamic> json,
) => _SyncActivitiesResult(
  results:
      (json['results'] as List<dynamic>?)
          ?.map(
            (e) => SyncActivityItemResult.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <SyncActivityItemResult>[],
  created: (json['created'] as num).toInt(),
  duplicates: (json['duplicates'] as num).toInt(),
  rejected: (json['rejected'] as num).toInt(),
);

Map<String, dynamic> _$SyncActivitiesResultToJson(
  _SyncActivitiesResult instance,
) => <String, dynamic>{
  'results': instance.results,
  'created': instance.created,
  'duplicates': instance.duplicates,
  'rejected': instance.rejected,
};
