// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_activity_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LogActivityData _$LogActivityDataFromJson(Map<String, dynamic> json) =>
    _LogActivityData(
      activity: ActivityView.fromJson(json['activity'] as Map<String, dynamic>),
      suggestion: json['suggestion'] as String?,
    );

Map<String, dynamic> _$LogActivityDataToJson(_LogActivityData instance) =>
    <String, dynamic>{
      'activity': instance.activity,
      'suggestion': instance.suggestion,
    };

_LogActivityResponse _$LogActivityResponseFromJson(Map<String, dynamic> json) =>
    _LogActivityResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: LogActivityData.fromJson(json['data'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LogActivityResponseToJson(
  _LogActivityResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'meta': instance.meta,
};
