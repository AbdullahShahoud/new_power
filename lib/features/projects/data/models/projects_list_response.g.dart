// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectsListResponse _$ProjectsListResponseFromJson(
  Map<String, dynamic> json,
) => _ProjectsListResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => ProjectSummaryView.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ProjectSummaryView>[],
  pagination: PaginationMeta.fromJson(
    json['pagination'] as Map<String, dynamic>,
  ),
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProjectsListResponseToJson(
  _ProjectsListResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'pagination': instance.pagination,
  'meta': instance.meta,
};

_NearbyProjectsResponse _$NearbyProjectsResponseFromJson(
  Map<String, dynamic> json,
) => _NearbyProjectsResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map(
            (e) => NearbyProjectCardView.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <NearbyProjectCardView>[],
  pagination: PaginationMeta.fromJson(
    json['pagination'] as Map<String, dynamic>,
  ),
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$NearbyProjectsResponseToJson(
  _NearbyProjectsResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'pagination': instance.pagination,
  'meta': instance.meta,
};
