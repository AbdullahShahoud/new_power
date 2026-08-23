// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationsListResponse _$NotificationsListResponseFromJson(
  Map<String, dynamic> json,
) => _NotificationsListResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => NotificationView.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <NotificationView>[],
  pagination: json['pagination'] == null
      ? null
      : PaginationMeta.fromJson(json['pagination'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$NotificationsListResponseToJson(
  _NotificationsListResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'pagination': instance.pagination,
  'meta': instance.meta,
};

_NotificationCountData _$NotificationCountDataFromJson(
  Map<String, dynamic> json,
) => _NotificationCountData(count: (json['count'] as num?)?.toInt() ?? 0);

Map<String, dynamic> _$NotificationCountDataToJson(
  _NotificationCountData instance,
) => <String, dynamic>{'count': instance.count};

_NotificationCountResponse _$NotificationCountResponseFromJson(
  Map<String, dynamic> json,
) => _NotificationCountResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: NotificationCountData.fromJson(json['data'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$NotificationCountResponseToJson(
  _NotificationCountResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'meta': instance.meta,
};

_NotificationDetailResponse _$NotificationDetailResponseFromJson(
  Map<String, dynamic> json,
) => _NotificationDetailResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : NotificationView.fromJson(json['data'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$NotificationDetailResponseToJson(
  _NotificationDetailResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'meta': instance.meta,
};

_NotificationActionResponse _$NotificationActionResponseFromJson(
  Map<String, dynamic> json,
) => _NotificationActionResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$NotificationActionResponseToJson(
  _NotificationActionResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'meta': instance.meta,
};

_FcmTokenResponse _$FcmTokenResponseFromJson(Map<String, dynamic> json) =>
    _FcmTokenResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      meta: json['meta'] == null
          ? null
          : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FcmTokenResponseToJson(_FcmTokenResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'meta': instance.meta,
    };

_RegisterFcmTokenRequest _$RegisterFcmTokenRequestFromJson(
  Map<String, dynamic> json,
) => _RegisterFcmTokenRequest(fcmToken: json['fcmToken'] as String);

Map<String, dynamic> _$RegisterFcmTokenRequestToJson(
  _RegisterFcmTokenRequest instance,
) => <String, dynamic>{'fcmToken': instance.fcmToken};

_NotificationPreferencesResponse _$NotificationPreferencesResponseFromJson(
  Map<String, dynamic> json,
) => _NotificationPreferencesResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: NotificationPreferencesView.fromJson(
    json['data'] as Map<String, dynamic>,
  ),
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$NotificationPreferencesResponseToJson(
  _NotificationPreferencesResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'meta': instance.meta,
};
