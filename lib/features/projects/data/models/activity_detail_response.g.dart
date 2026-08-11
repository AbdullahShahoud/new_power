// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ActivityDetailResponse _$ActivityDetailResponseFromJson(
  Map<String, dynamic> json,
) => _ActivityDetailResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: ActivityDetailView.fromJson(json['data'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ActivityDetailResponseToJson(
  _ActivityDetailResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'meta': instance.meta,
};
