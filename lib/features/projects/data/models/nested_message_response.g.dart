// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nested_message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NestedMessageResponse _$NestedMessageResponseFromJson(
  Map<String, dynamic> json,
) => _NestedMessageResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: NestedMessage.fromJson(json['data'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$NestedMessageResponseToJson(
  _NestedMessageResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'meta': instance.meta,
};

_NestedMessage _$NestedMessageFromJson(Map<String, dynamic> json) =>
    _NestedMessage(message: json['message'] as String);

Map<String, dynamic> _$NestedMessageToJson(_NestedMessage instance) =>
    <String, dynamic>{'message': instance.message};
