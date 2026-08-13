// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stored_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoredFileView _$StoredFileViewFromJson(Map<String, dynamic> json) =>
    _StoredFileView(
      key: json['key'] as String,
      name: json['name'] as String,
      contentType: json['contentType'] as String,
      byteSize: (json['byteSize'] as num).toInt(),
      url: json['url'] as String?,
      urlExpiresAt: json['urlExpiresAt'] == null
          ? null
          : DateTime.parse(json['urlExpiresAt'] as String),
    );

Map<String, dynamic> _$StoredFileViewToJson(_StoredFileView instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'contentType': instance.contentType,
      'byteSize': instance.byteSize,
      'url': instance.url,
      'urlExpiresAt': instance.urlExpiresAt?.toIso8601String(),
    };

_ProjectFileRefDto _$ProjectFileRefDtoFromJson(Map<String, dynamic> json) =>
    _ProjectFileRefDto(
      key: json['key'] as String,
      name: json['name'] as String,
      caption: json['caption'] as String?,
      exifLatitude: (json['exifLatitude'] as num?)?.toDouble(),
      exifLongitude: (json['exifLongitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProjectFileRefDtoToJson(_ProjectFileRefDto instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'caption': ?instance.caption,
      'exifLatitude': ?instance.exifLatitude,
      'exifLongitude': ?instance.exifLongitude,
    };
