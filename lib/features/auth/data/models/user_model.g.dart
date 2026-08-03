// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  email: json['email'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  username: json['username'] as String?,
  usernameChangedAt: json['usernameChangedAt'] == null
      ? null
      : DateTime.parse(json['usernameChangedAt'] as String),
  role: json['role'] as String?,
  status: json['status'] as String?,
  emailVerified: json['emailVerified'] as bool?,
  phoneVerified: json['phoneVerified'] as bool?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'username': instance.username,
      'usernameChangedAt': instance.usernameChangedAt?.toIso8601String(),
      'role': instance.role,
      'status': instance.status,
      'emailVerified': instance.emailVerified,
      'phoneVerified': instance.phoneVerified,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
