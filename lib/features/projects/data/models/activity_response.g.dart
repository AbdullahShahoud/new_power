// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ActivityResponse _$ActivityResponseFromJson(Map<String, dynamic> json) =>
    _ActivityResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: ActivityView.fromJson(json['data'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ActivityResponseToJson(_ActivityResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
      'meta': instance.meta,
    };
