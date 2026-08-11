// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attention_items_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AttentionItemsResponse _$AttentionItemsResponseFromJson(
  Map<String, dynamic> json,
) => _AttentionItemsResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => AttentionItemView.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <AttentionItemView>[],
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AttentionItemsResponseToJson(
  _AttentionItemsResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'meta': instance.meta,
};
