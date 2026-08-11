// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_activities_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SyncActivitiesResponse _$SyncActivitiesResponseFromJson(
  Map<String, dynamic> json,
) => _SyncActivitiesResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: SyncActivitiesResult.fromJson(json['data'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SyncActivitiesResponseToJson(
  _SyncActivitiesResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'meta': instance.meta,
};
