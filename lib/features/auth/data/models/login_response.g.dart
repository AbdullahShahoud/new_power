// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    _LoginResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: LoginData.fromJson(json['data'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : LoginResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(_LoginResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
      'meta': instance.meta,
    };

_LoginData _$LoginDataFromJson(Map<String, dynamic> json) => _LoginData(
  verificationType: json['verificationType'] as String,
  verificationId: json['verificationId'] as String?,
  tokens: json['tokens'] == null
      ? null
      : LoginTokens.fromJson(json['tokens'] as Map<String, dynamic>),
  role: json['role'] as String?,
);

Map<String, dynamic> _$LoginDataToJson(_LoginData instance) =>
    <String, dynamic>{
      'verificationType': instance.verificationType,
      'verificationId': instance.verificationId,
      'tokens': instance.tokens,
      'role': instance.role,
    };

_LoginTokens _$LoginTokensFromJson(Map<String, dynamic> json) => _LoginTokens(
  accessToken: json['accessToken'] as String,
  refreshToken: json['refreshToken'] as String,
  expiresIn: (json['expiresIn'] as num).toInt(),
  refreshExpiresIn: (json['refreshExpiresIn'] as num?)?.toInt(),
);

Map<String, dynamic> _$LoginTokensToJson(_LoginTokens instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'expiresIn': instance.expiresIn,
      'refreshExpiresIn': instance.refreshExpiresIn,
    };

_LoginResponseMeta _$LoginResponseMetaFromJson(Map<String, dynamic> json) =>
    _LoginResponseMeta(
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      path: json['path'] as String?,
      correlationId: json['correlationId'] as String?,
    );

Map<String, dynamic> _$LoginResponseMetaToJson(_LoginResponseMeta instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp?.toIso8601String(),
      'path': instance.path,
      'correlationId': instance.correlationId,
    };
