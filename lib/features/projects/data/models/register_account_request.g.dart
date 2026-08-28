// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_account_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NewAccountContact _$NewAccountContactFromJson(Map<String, dynamic> json) =>
    _NewAccountContact(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      position: json['position'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      notes: json['notes'] as String?,
      isPrimary: json['isPrimary'] as bool? ?? false,
    );

Map<String, dynamic> _$NewAccountContactToJson(_NewAccountContact instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'position': ?instance.position,
      'phone': ?instance.phone,
      'email': ?instance.email,
      'notes': ?instance.notes,
      'isPrimary': instance.isPrimary,
    };

_RegisterAccountRequest _$RegisterAccountRequestFromJson(
  Map<String, dynamic> json,
) => _RegisterAccountRequest(
  name: json['name'] as String,
  type:
      $enumDecodeNullable(_$AccountTypeEnumMap, json['type']) ??
      AccountType.company,
  registrationNumber: json['registrationNumber'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  city: json['city'] as String?,
  addressLine: json['addressLine'] as String?,
  notes: json['notes'] as String?,
  classification: $enumDecodeNullable(
    _$AccountClassificationEnumMap,
    json['classification'],
  ),
  contacts:
      (json['contacts'] as List<dynamic>?)
          ?.map((e) => NewAccountContact.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <NewAccountContact>[],
);

Map<String, dynamic> _$RegisterAccountRequestToJson(
  _RegisterAccountRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'type': ?_$AccountTypeEnumMap[instance.type],
  'registrationNumber': ?instance.registrationNumber,
  'phone': ?instance.phone,
  'email': ?instance.email,
  'city': ?instance.city,
  'addressLine': ?instance.addressLine,
  'notes': ?instance.notes,
  'classification': ?_$AccountClassificationEnumMap[instance.classification],
  'contacts': instance.contacts,
};

const _$AccountTypeEnumMap = {
  AccountType.company: 'COMPANY',
  AccountType.individual: 'INDIVIDUAL',
  AccountType.unknown: null,
};

const _$AccountClassificationEnumMap = {
  AccountClassification.projectStakeholder: 'PROJECT_STAKEHOLDER',
  AccountClassification.distributor: 'DISTRIBUTOR',
  AccountClassification.competitor: 'COMPETITOR',
};
