// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resend_verification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResendVerificationResponse _$ResendVerificationResponseFromJson(
  Map<String, dynamic> json,
) => _ResendVerificationResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
);

Map<String, dynamic> _$ResendVerificationResponseToJson(
  _ResendVerificationResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
};
