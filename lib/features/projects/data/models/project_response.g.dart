// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectResponse _$ProjectResponseFromJson(Map<String, dynamic> json) =>
    _ProjectResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: ProjectView.fromJson(json['data'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProjectResponseToJson(_ProjectResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
      'meta': instance.meta,
    };
