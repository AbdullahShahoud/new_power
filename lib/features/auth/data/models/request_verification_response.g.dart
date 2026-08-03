// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_verification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RequestVerificationResponse _$RequestVerificationResponseFromJson(
  Map<String, dynamic> json,
) => _RequestVerificationResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
);

Map<String, dynamic> _$RequestVerificationResponseToJson(
  _RequestVerificationResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
};
