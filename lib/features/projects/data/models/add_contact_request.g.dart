// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_contact_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddContactRequest _$AddContactRequestFromJson(Map<String, dynamic> json) =>
    _AddContactRequest(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      accountId: json['accountId'] as String?,
      company: json['company'] as String?,
      position: json['position'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      notes: json['notes'] as String?,
      isPrimary: json['isPrimary'] as bool? ?? false,
    );

Map<String, dynamic> _$AddContactRequestToJson(_AddContactRequest instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'accountId': ?instance.accountId,
      'company': ?instance.company,
      'position': ?instance.position,
      'phone': ?instance.phone,
      'email': ?instance.email,
      'notes': ?instance.notes,
      'isPrimary': instance.isPrimary,
    };

_ClassifyAccountRequest _$ClassifyAccountRequestFromJson(
  Map<String, dynamic> json,
) => _ClassifyAccountRequest(classification: json['classification'] as String);

Map<String, dynamic> _$ClassifyAccountRequestToJson(
  _ClassifyAccountRequest instance,
) => <String, dynamic>{'classification': instance.classification};
