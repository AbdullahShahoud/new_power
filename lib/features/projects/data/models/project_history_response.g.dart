// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectHistoryResponse _$ProjectHistoryResponseFromJson(
  Map<String, dynamic> json,
) => _ProjectHistoryResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map(
            (e) => ProjectHistoryEntryView.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <ProjectHistoryEntryView>[],
  pagination: PaginationMeta.fromJson(
    json['pagination'] as Map<String, dynamic>,
  ),
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProjectHistoryResponseToJson(
  _ProjectHistoryResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'pagination': instance.pagination,
  'meta': instance.meta,
};
