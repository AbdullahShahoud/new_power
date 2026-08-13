// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiResponseMeta _$ApiResponseMetaFromJson(Map<String, dynamic> json) =>
    _ApiResponseMeta(
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      path: json['path'] as String?,
      correlationId: json['correlationId'] as String?,
    );

Map<String, dynamic> _$ApiResponseMetaToJson(_ApiResponseMeta instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp?.toIso8601String(),
      'path': instance.path,
      'correlationId': instance.correlationId,
    };
