// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outcome_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OutcomeResponse _$OutcomeResponseFromJson(Map<String, dynamic> json) =>
    _OutcomeResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: OutcomeView.fromJson(json['data'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OutcomeResponseToJson(_OutcomeResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
      'meta': instance.meta,
    };
