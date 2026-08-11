// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outcomes_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OutcomesListResponse _$OutcomesListResponseFromJson(
  Map<String, dynamic> json,
) => _OutcomesListResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => OutcomeView.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <OutcomeView>[],
  pagination: PaginationMeta.fromJson(
    json['pagination'] as Map<String, dynamic>,
  ),
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OutcomesListResponseToJson(
  _OutcomesListResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'pagination': instance.pagination,
  'meta': instance.meta,
};
