// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectDetailResponse _$ProjectDetailResponseFromJson(
  Map<String, dynamic> json,
) => _ProjectDetailResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: ProjectDetailView.fromJson(json['data'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProjectDetailResponseToJson(
  _ProjectDetailResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'meta': instance.meta,
};
