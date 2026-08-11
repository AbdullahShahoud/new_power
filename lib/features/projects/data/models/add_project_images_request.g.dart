// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_project_images_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddProjectImagesRequest _$AddProjectImagesRequestFromJson(
  Map<String, dynamic> json,
) => _AddProjectImagesRequest(
  files: (json['files'] as List<dynamic>)
      .map((e) => ProjectFileRefDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AddProjectImagesRequestToJson(
  _AddProjectImagesRequest instance,
) => <String, dynamic>{'files': instance.files};
