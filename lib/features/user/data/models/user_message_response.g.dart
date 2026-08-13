// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserMessageResponse _$UserMessageResponseFromJson(Map<String, dynamic> json) =>
    _UserMessageResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      meta: json['meta'] == null
          ? null
          : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserMessageResponseToJson(
  _UserMessageResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'meta': instance.meta,
};

_ChangeUsernameData _$ChangeUsernameDataFromJson(Map<String, dynamic> json) =>
    _ChangeUsernameData(username: json['username'] as String);

Map<String, dynamic> _$ChangeUsernameDataToJson(_ChangeUsernameData instance) =>
    <String, dynamic>{'username': instance.username};

_ChangeUsernameResponse _$ChangeUsernameResponseFromJson(
  Map<String, dynamic> json,
) => _ChangeUsernameResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: ChangeUsernameData.fromJson(json['data'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ChangeUsernameResponseToJson(
  _ChangeUsernameResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'meta': instance.meta,
};
