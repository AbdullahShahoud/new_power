// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountsListResponse _$AccountsListResponseFromJson(
  Map<String, dynamic> json,
) => _AccountsListResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => AccountView.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <AccountView>[],
  pagination: PaginationMeta.fromJson(
    json['pagination'] as Map<String, dynamic>,
  ),
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AccountsListResponseToJson(
  _AccountsListResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'pagination': instance.pagination,
  'meta': instance.meta,
};
