// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_account_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
);

Map<String, dynamic> _$RegisterAccountRequestToJson(
  _RegisterAccountRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'type': _$AccountTypeEnumMap[instance.type]!,
  'registrationNumber': instance.registrationNumber,
  'phone': instance.phone,
  'email': instance.email,
  'city': instance.city,
  'addressLine': instance.addressLine,
  'notes': instance.notes,
};

const _$AccountTypeEnumMap = {
  AccountType.company: 'COMPANY',
  AccountType.individual: 'INDIVIDUAL',
};
