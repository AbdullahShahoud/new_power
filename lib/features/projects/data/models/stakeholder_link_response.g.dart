// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stakeholder_link_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StakeholderLinkResponse _$StakeholderLinkResponseFromJson(
  Map<String, dynamic> json,
) => _StakeholderLinkResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: StakeholderLinkView.fromJson(json['data'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StakeholderLinkResponseToJson(
  _StakeholderLinkResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'meta': instance.meta,
};

_StakeholderLinksListResponse _$StakeholderLinksListResponseFromJson(
  Map<String, dynamic> json,
) => _StakeholderLinksListResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => StakeholderLinkView.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <StakeholderLinkView>[],
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StakeholderLinksListResponseToJson(
  _StakeholderLinksListResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'meta': instance.meta,
};
