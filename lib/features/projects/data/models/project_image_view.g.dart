// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_image_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectImageView _$ProjectImageViewFromJson(Map<String, dynamic> json) =>
    _ProjectImageView(
      key: json['key'] as String,
      name: json['name'] as String,
      contentType: json['contentType'] as String,
      byteSize: (json['byteSize'] as num).toInt(),
      url: json['url'] as String?,
      urlExpiresAt: json['urlExpiresAt'] == null
          ? null
          : DateTime.parse(json['urlExpiresAt'] as String),
      id: json['id'] as String,
      caption: json['caption'] as String?,
      exifLatitude: (json['exifLatitude'] as num?)?.toDouble(),
      exifLongitude: (json['exifLongitude'] as num?)?.toDouble(),
      exifDistanceM: (json['exifDistanceM'] as num?)?.toDouble(),
      sortOrder: (json['sortOrder'] as num).toInt(),
      uploadedAt: DateTime.parse(json['uploadedAt'] as String),
      uploadedBy: json['uploadedBy'] as String?,
      uploadedByUser: json['uploadedByUser'] == null
          ? null
          : ActorView.fromJson(json['uploadedByUser'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProjectImageViewToJson(_ProjectImageView instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'contentType': instance.contentType,
      'byteSize': instance.byteSize,
      'url': instance.url,
      'urlExpiresAt': instance.urlExpiresAt?.toIso8601String(),
      'id': instance.id,
      'caption': instance.caption,
      'exifLatitude': instance.exifLatitude,
      'exifLongitude': instance.exifLongitude,
      'exifDistanceM': instance.exifDistanceM,
      'sortOrder': instance.sortOrder,
      'uploadedAt': instance.uploadedAt.toIso8601String(),
      'uploadedBy': instance.uploadedBy,
      'uploadedByUser': instance.uploadedByUser,
    };
