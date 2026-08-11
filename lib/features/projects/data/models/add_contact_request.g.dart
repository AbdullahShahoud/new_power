// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_contact_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddContactRequest _$AddContactRequestFromJson(Map<String, dynamic> json) =>
    _AddContactRequest(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      position: json['position'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      isPrimary: json['isPrimary'] as bool? ?? false,
    );

Map<String, dynamic> _$AddContactRequestToJson(_AddContactRequest instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'position': instance.position,
      'phone': instance.phone,
      'email': instance.email,
      'isPrimary': instance.isPrimary,
    };
