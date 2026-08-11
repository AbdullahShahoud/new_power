// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activities_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ActivitiesListResponse _$ActivitiesListResponseFromJson(
  Map<String, dynamic> json,
) => _ActivitiesListResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => ActivityView.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ActivityView>[],
  pagination: PaginationMeta.fromJson(
    json['pagination'] as Map<String, dynamic>,
  ),
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ActivitiesListResponseToJson(
  _ActivitiesListResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'pagination': instance.pagination,
  'meta': instance.meta,
};
