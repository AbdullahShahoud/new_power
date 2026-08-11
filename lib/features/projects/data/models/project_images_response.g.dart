// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_images_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectImagesResponse _$ProjectImagesResponseFromJson(
  Map<String, dynamic> json,
) => _ProjectImagesResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => ProjectImageView.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ProjectImageView>[],
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProjectImagesResponseToJson(
  _ProjectImagesResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'meta': instance.meta,
};
