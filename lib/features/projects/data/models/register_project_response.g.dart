// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_project_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterProjectResponse _$RegisterProjectResponseFromJson(
  Map<String, dynamic> json,
) => _RegisterProjectResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: RegisterProjectResult.fromJson(json['data'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RegisterProjectResponseToJson(
  _RegisterProjectResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'meta': instance.meta,
};
