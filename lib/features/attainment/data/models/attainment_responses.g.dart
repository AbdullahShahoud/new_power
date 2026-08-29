// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attainment_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MyAttainmentResponse _$MyAttainmentResponseFromJson(
  Map<String, dynamic> json,
) => _MyAttainmentResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? const MyAttainmentView()
      : MyAttainmentView.fromJson(json['data'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MyAttainmentResponseToJson(
  _MyAttainmentResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'meta': instance.meta,
};
