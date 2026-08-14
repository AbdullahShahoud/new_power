// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContactAccountRefView _$ContactAccountRefViewFromJson(
  Map<String, dynamic> json,
) => _ContactAccountRefView(
  id: json['id'] as String,
  name: json['name'] as String,
  type: $enumDecode(_$AccountTypeEnumMap, json['type']),
);

Map<String, dynamic> _$ContactAccountRefViewToJson(
  _ContactAccountRefView instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': _$AccountTypeEnumMap[instance.type]!,
};

const _$AccountTypeEnumMap = {
  AccountType.company: 'COMPANY',
  AccountType.individual: 'INDIVIDUAL',
};

_ContactView _$ContactViewFromJson(Map<String, dynamic> json) => _ContactView(
  id: json['id'] as String,
  accountId: json['accountId'] as String?,
  account: json['account'] == null
      ? null
      : ContactAccountRefView.fromJson(json['account'] as Map<String, dynamic>),
  company: json['company'] as String?,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  position: json['position'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  notes: json['notes'] as String?,
  isPrimary: json['isPrimary'] as bool? ?? false,
  createdAt: _$JsonConverterFromJson<String, DateTime>(
    json['createdAt'],
    const UtcDateTimeConverter().fromJson,
  ),
  updatedAt: _$JsonConverterFromJson<String, DateTime>(
    json['updatedAt'],
    const UtcDateTimeConverter().fromJson,
  ),
  archivedAt: _$JsonConverterFromJson<String, DateTime>(
    json['archivedAt'],
    const UtcDateTimeConverter().fromJson,
  ),
);

Map<String, dynamic> _$ContactViewToJson(_ContactView instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountId': instance.accountId,
      'account': instance.account,
      'company': instance.company,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'position': instance.position,
      'phone': instance.phone,
      'email': instance.email,
      'notes': instance.notes,
      'isPrimary': instance.isPrimary,
      'createdAt': _$JsonConverterToJson<String, DateTime>(
        instance.createdAt,
        const UtcDateTimeConverter().toJson,
      ),
      'updatedAt': _$JsonConverterToJson<String, DateTime>(
        instance.updatedAt,
        const UtcDateTimeConverter().toJson,
      ),
      'archivedAt': _$JsonConverterToJson<String, DateTime>(
        instance.archivedAt,
        const UtcDateTimeConverter().toJson,
      ),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
