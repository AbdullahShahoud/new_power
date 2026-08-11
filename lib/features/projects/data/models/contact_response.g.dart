// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContactResponse _$ContactResponseFromJson(Map<String, dynamic> json) =>
    _ContactResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: ContactView.fromJson(json['data'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContactResponseToJson(_ContactResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
      'meta': instance.meta,
    };

_ContactsListResponse _$ContactsListResponseFromJson(
  Map<String, dynamic> json,
) => _ContactsListResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => ContactView.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ContactView>[],
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ContactsListResponseToJson(
  _ContactsListResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'meta': instance.meta,
};
