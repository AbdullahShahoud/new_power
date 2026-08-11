// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counterparty_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CounterpartyView _$CounterpartyViewFromJson(Map<String, dynamic> json) =>
    _CounterpartyView(
      accountId: json['accountId'] as String,
      name: json['name'] as String,
      city: json['city'] as String?,
      isAuthorized: json['isAuthorized'] as bool,
    );

Map<String, dynamic> _$CounterpartyViewToJson(_CounterpartyView instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'name': instance.name,
      'city': instance.city,
      'isAuthorized': instance.isAuthorized,
    };
