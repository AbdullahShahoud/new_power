// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decision_maker_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DecisionMakerResponse _$DecisionMakerResponseFromJson(
  Map<String, dynamic> json,
) => _DecisionMakerResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : DecisionMakerView.fromJson(json['data'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DecisionMakerResponseToJson(
  _DecisionMakerResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'meta': instance.meta,
};

_DecisionMakerHistoryResponse _$DecisionMakerHistoryResponseFromJson(
  Map<String, dynamic> json,
) => _DecisionMakerHistoryResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map(
            (e) =>
                DecisionMakerHistoryEntry.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <DecisionMakerHistoryEntry>[],
  pagination: PaginationMeta.fromJson(
    json['pagination'] as Map<String, dynamic>,
  ),
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DecisionMakerHistoryResponseToJson(
  _DecisionMakerHistoryResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'pagination': instance.pagination,
  'meta': instance.meta,
};
