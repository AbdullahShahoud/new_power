// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContactView _$ContactViewFromJson(Map<String, dynamic> json) => _ContactView(
  id: json['id'] as String,
  accountId: json['accountId'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  position: json['position'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  isPrimary: json['isPrimary'] as bool? ?? false,
  archivedAt: _$JsonConverterFromJson<String, DateTime>(
    json['archivedAt'],
    const UtcDateTimeConverter().fromJson,
  ),
);

Map<String, dynamic> _$ContactViewToJson(_ContactView instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountId': instance.accountId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'position': instance.position,
      'phone': instance.phone,
      'email': instance.email,
      'isPrimary': instance.isPrimary,
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
