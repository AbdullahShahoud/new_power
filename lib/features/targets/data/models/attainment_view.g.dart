// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attainment_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AttainmentView _$AttainmentViewFromJson(Map<String, dynamic> json) =>
    _AttainmentView(
      targetId: json['targetId'] as String,
      metric:
          $enumDecodeNullable(
            _$TargetMetricEnumMap,
            json['metric'],
            unknownValue: TargetMetric.unknown,
          ) ??
          TargetMetric.unknown,
      currency: json['currency'] as String?,
      periodStart: json['periodStart'] as String,
      periodEnd: json['periodEnd'] as String,
      closed: json['closed'] as bool? ?? false,
      target: json['target'] as String? ?? '0',
      attained: json['attained'] as String? ?? '0',
      attainedPct: json['attainedPct'] as num? ?? 0,
      remaining: json['remaining'] as String? ?? '0',
      expectedToDate: json['expectedToDate'] as String?,
      expectedToDatePct: json['expectedToDatePct'] as num?,
      elapsedDays: (json['elapsedDays'] as num?)?.toInt(),
      totalDays: (json['totalDays'] as num?)?.toInt(),
      status:
          $enumDecodeNullable(
            _$AttainmentStatusEnumMap,
            json['status'],
            unknownValue: AttainmentStatus.unknown,
          ) ??
          AttainmentStatus.unknown,
      confirmedOutcomes: (json['confirmedOutcomes'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AttainmentViewToJson(_AttainmentView instance) =>
    <String, dynamic>{
      'targetId': instance.targetId,
      'metric': _$TargetMetricEnumMap[instance.metric],
      'currency': instance.currency,
      'periodStart': instance.periodStart,
      'periodEnd': instance.periodEnd,
      'closed': instance.closed,
      'target': instance.target,
      'attained': instance.attained,
      'attainedPct': instance.attainedPct,
      'remaining': instance.remaining,
      'expectedToDate': instance.expectedToDate,
      'expectedToDatePct': instance.expectedToDatePct,
      'elapsedDays': instance.elapsedDays,
      'totalDays': instance.totalDays,
      'status': _$AttainmentStatusEnumMap[instance.status],
      'confirmedOutcomes': instance.confirmedOutcomes,
    };

const _$TargetMetricEnumMap = {
  TargetMetric.salesValue: 'SALES_VALUE',
  TargetMetric.unitsSupplied: 'UNITS_SUPPLIED',
  TargetMetric.winsCount: 'WINS_COUNT',
  TargetMetric.unknown: null,
};

const _$AttainmentStatusEnumMap = {
  AttainmentStatus.met: 'MET',
  AttainmentStatus.onTrack: 'ON_TRACK',
  AttainmentStatus.atRisk: 'AT_RISK',
  AttainmentStatus.behind: 'BEHIND',
  AttainmentStatus.unknown: null,
};

_MyAttainmentView _$MyAttainmentViewFromJson(Map<String, dynamic> json) =>
    _MyAttainmentView(
      asOf: json['asOf'] as String?,
      targets:
          (json['targets'] as List<dynamic>?)
              ?.map((e) => AttainmentView.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <AttainmentView>[],
    );

Map<String, dynamic> _$MyAttainmentViewToJson(_MyAttainmentView instance) =>
    <String, dynamic>{'asOf': instance.asOf, 'targets': instance.targets};

_MyAttainmentResponse _$MyAttainmentResponseFromJson(
  Map<String, dynamic> json,
) => _MyAttainmentResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: MyAttainmentView.fromJson(json['data'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MyAttainmentResponseToJson(
  _MyAttainmentResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'meta': instance.meta,
};
