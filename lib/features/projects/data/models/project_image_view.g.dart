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
      urlExpiresAt: _$JsonConverterFromJson<String, DateTime>(
        json['urlExpiresAt'],
        const UtcDateTimeConverter().fromJson,
      ),
      id: json['id'] as String,
      caption: json['caption'] as String?,
      exifLatitude: (json['exifLatitude'] as num?)?.toDouble(),
      exifLongitude: (json['exifLongitude'] as num?)?.toDouble(),
      exifDistanceM: (json['exifDistanceM'] as num?)?.toDouble(),
      sortOrder: (json['sortOrder'] as num).toInt(),
      uploadedAt: const UtcDateTimeConverter().fromJson(
        json['uploadedAt'] as String,
      ),
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
      'urlExpiresAt': _$JsonConverterToJson<String, DateTime>(
        instance.urlExpiresAt,
        const UtcDateTimeConverter().toJson,
      ),
      'id': instance.id,
      'caption': instance.caption,
      'exifLatitude': instance.exifLatitude,
      'exifLongitude': instance.exifLongitude,
      'exifDistanceM': instance.exifDistanceM,
      'sortOrder': instance.sortOrder,
      'uploadedAt': const UtcDateTimeConverter().toJson(instance.uploadedAt),
      'uploadedBy': instance.uploadedBy,
      'uploadedByUser': instance.uploadedByUser,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
