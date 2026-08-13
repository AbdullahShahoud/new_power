// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountView _$AccountViewFromJson(Map<String, dynamic> json) => _AccountView(
  id: json['id'] as String,
  name: json['name'] as String,
  type: $enumDecode(_$AccountTypeEnumMap, json['type']),
  registrationNumber: json['registrationNumber'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  city: json['city'] as String?,
  addressLine: json['addressLine'] as String?,
  notes: json['notes'] as String?,
  isVerified: json['isVerified'] as bool,
  verifiedAt: _$JsonConverterFromJson<String, DateTime>(
    json['verifiedAt'],
    const UtcDateTimeConverter().fromJson,
  ),
  verifiedBy: json['verifiedBy'] as String?,
  verifiedByUser: json['verifiedByUser'] == null
      ? null
      : ActorView.fromJson(json['verifiedByUser'] as Map<String, dynamic>),
  contactCount: (json['contactCount'] as num?)?.toInt(),
  activeLinkCount: (json['activeLinkCount'] as num?)?.toInt(),
  archivedAt: _$JsonConverterFromJson<String, DateTime>(
    json['archivedAt'],
    const UtcDateTimeConverter().fromJson,
  ),
);

Map<String, dynamic> _$AccountViewToJson(_AccountView instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$AccountTypeEnumMap[instance.type]!,
      'registrationNumber': instance.registrationNumber,
      'phone': instance.phone,
      'email': instance.email,
      'city': instance.city,
      'addressLine': instance.addressLine,
      'notes': instance.notes,
      'isVerified': instance.isVerified,
      'verifiedAt': _$JsonConverterToJson<String, DateTime>(
        instance.verifiedAt,
        const UtcDateTimeConverter().toJson,
      ),
      'verifiedBy': instance.verifiedBy,
      'verifiedByUser': instance.verifiedByUser,
      'contactCount': instance.contactCount,
      'activeLinkCount': instance.activeLinkCount,
      'archivedAt': _$JsonConverterToJson<String, DateTime>(
        instance.archivedAt,
        const UtcDateTimeConverter().toJson,
      ),
    };

const _$AccountTypeEnumMap = {
  AccountType.company: 'COMPANY',
  AccountType.individual: 'INDIVIDUAL',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
