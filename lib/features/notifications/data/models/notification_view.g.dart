// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationView _$NotificationViewFromJson(Map<String, dynamic> json) =>
    _NotificationView(
      id: json['id'] as String,
      type:
          $enumDecodeNullable(
            _$NotificationTypeEnumMap,
            json['type'],
            unknownValue: NotificationType.unknown,
          ) ??
          NotificationType.unknown,
      status:
          $enumDecodeNullable(
            _$NotificationStatusEnumMap,
            json['status'],
            unknownValue: NotificationStatus.unknown,
          ) ??
          NotificationStatus.unknown,
      title: json['title'] as String? ?? '',
      message: json['message'] as String? ?? '',
      metadata: json['metadata'] as Map<String, dynamic>?,
      readAt: _$JsonConverterFromJson<String, DateTime>(
        json['readAt'],
        const UtcDateTimeConverter().fromJson,
      ),
      createdAt: _$JsonConverterFromJson<String, DateTime>(
        json['createdAt'],
        const UtcDateTimeConverter().fromJson,
      ),
      userId: json['userId'] as String?,
      archivedAt: _$JsonConverterFromJson<String, DateTime>(
        json['archivedAt'],
        const UtcDateTimeConverter().fromJson,
      ),
      updatedAt: _$JsonConverterFromJson<String, DateTime>(
        json['updatedAt'],
        const UtcDateTimeConverter().fromJson,
      ),
    );

Map<String, dynamic> _$NotificationViewToJson(_NotificationView instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$NotificationTypeEnumMap[instance.type],
      'status': _$NotificationStatusEnumMap[instance.status],
      'title': instance.title,
      'message': instance.message,
      'metadata': instance.metadata,
      'readAt': _$JsonConverterToJson<String, DateTime>(
        instance.readAt,
        const UtcDateTimeConverter().toJson,
      ),
      'createdAt': _$JsonConverterToJson<String, DateTime>(
        instance.createdAt,
        const UtcDateTimeConverter().toJson,
      ),
      'userId': instance.userId,
      'archivedAt': _$JsonConverterToJson<String, DateTime>(
        instance.archivedAt,
        const UtcDateTimeConverter().toJson,
      ),
      'updatedAt': _$JsonConverterToJson<String, DateTime>(
        instance.updatedAt,
        const UtcDateTimeConverter().toJson,
      ),
    };

const _$NotificationTypeEnumMap = {
  NotificationType.security: 'SECURITY',
  NotificationType.system: 'SYSTEM',
  NotificationType.marketing: 'MARKETING',
  NotificationType.unknown: null,
};

const _$NotificationStatusEnumMap = {
  NotificationStatus.unread: 'UNREAD',
  NotificationStatus.read: 'READ',
  NotificationStatus.archived: 'ARCHIVED',
  NotificationStatus.unknown: null,
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

_NotificationPreferencesView _$NotificationPreferencesViewFromJson(
  Map<String, dynamic> json,
) => _NotificationPreferencesView(
  securityEnabled: json['securityEnabled'] as bool? ?? true,
  systemEnabled: json['systemEnabled'] as bool? ?? true,
  marketingEnabled: json['marketingEnabled'] as bool? ?? false,
  pushEnabled: json['pushEnabled'] as bool? ?? true,
  language:
      $enumDecodeNullable(_$NotificationLanguageEnumMap, json['language']) ??
      NotificationLanguage.en,
);

Map<String, dynamic> _$NotificationPreferencesViewToJson(
  _NotificationPreferencesView instance,
) => <String, dynamic>{
  'securityEnabled': instance.securityEnabled,
  'systemEnabled': instance.systemEnabled,
  'marketingEnabled': instance.marketingEnabled,
  'pushEnabled': instance.pushEnabled,
  'language': _$NotificationLanguageEnumMap[instance.language]!,
};

const _$NotificationLanguageEnumMap = {
  NotificationLanguage.en: 'EN',
  NotificationLanguage.ar: 'AR',
};

_UpdateNotificationPreferencesRequest
_$UpdateNotificationPreferencesRequestFromJson(Map<String, dynamic> json) =>
    _UpdateNotificationPreferencesRequest(
      securityEnabled: json['securityEnabled'] as bool?,
      systemEnabled: json['systemEnabled'] as bool?,
      marketingEnabled: json['marketingEnabled'] as bool?,
      pushEnabled: json['pushEnabled'] as bool?,
      language: $enumDecodeNullable(
        _$NotificationLanguageEnumMap,
        json['language'],
      ),
    );

Map<String, dynamic> _$UpdateNotificationPreferencesRequestToJson(
  _UpdateNotificationPreferencesRequest instance,
) => <String, dynamic>{
  'securityEnabled': ?instance.securityEnabled,
  'systemEnabled': ?instance.systemEnabled,
  'marketingEnabled': ?instance.marketingEnabled,
  'pushEnabled': ?instance.pushEnabled,
  'language': ?_$NotificationLanguageEnumMap[instance.language],
};
