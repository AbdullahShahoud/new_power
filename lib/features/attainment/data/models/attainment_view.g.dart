// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attainment_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AttainmentView _$AttainmentViewFromJson(Map<String, dynamic> json) =>
    _AttainmentView(
      targetId: json['targetId'] as String? ?? '',
      metric:
          $enumDecodeNullable(_$AttainmentMetricEnumMap, json['metric']) ??
          AttainmentMetric.salesValue,
      currency: json['currency'] as String?,
      periodStart: json['periodStart'] as String? ?? '',
      periodEnd: json['periodEnd'] as String? ?? '',
      closed: json['closed'] as bool? ?? false,
      target: json['target'] as String? ?? '0.00',
      attained: json['attained'] as String? ?? '0.00',
      attainedPct: json['attainedPct'] as num? ?? 0,
      remaining: json['remaining'] as String? ?? '0.00',
      expectedToDate: json['expectedToDate'] as String?,
      expectedToDatePct: json['expectedToDatePct'] as num?,
      elapsedDays: (json['elapsedDays'] as num?)?.toInt(),
      totalDays: (json['totalDays'] as num?)?.toInt(),
      status:
          $enumDecodeNullable(
            _$AttainmentTargetStatusEnumMap,
            json['status'],
            unknownValue: AttainmentTargetStatus.unknown,
          ) ??
          AttainmentTargetStatus.unknown,
      confirmedOutcomes: (json['confirmedOutcomes'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AttainmentViewToJson(_AttainmentView instance) =>
    <String, dynamic>{
      'targetId': instance.targetId,
      'metric': _$AttainmentMetricEnumMap[instance.metric]!,
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
      'status': _$AttainmentTargetStatusEnumMap[instance.status]!,
      'confirmedOutcomes': instance.confirmedOutcomes,
    };

const _$AttainmentMetricEnumMap = {
  AttainmentMetric.salesValue: 'SALES_VALUE',
  AttainmentMetric.unitsSupplied: 'UNITS_SUPPLIED',
  AttainmentMetric.winsCount: 'WINS_COUNT',
};

const _$AttainmentTargetStatusEnumMap = {
  AttainmentTargetStatus.met: 'MET',
  AttainmentTargetStatus.onTrack: 'ON_TRACK',
  AttainmentTargetStatus.atRisk: 'AT_RISK',
  AttainmentTargetStatus.behind: 'BEHIND',
  AttainmentTargetStatus.unknown: 'unknown',
};

_MyAttainmentView _$MyAttainmentViewFromJson(Map<String, dynamic> json) =>
    _MyAttainmentView(
      asOf: json['asOf'] as String? ?? '',
      managerName: json['managerName'] as String?,
      targets:
          (json['targets'] as List<dynamic>?)
              ?.map((e) => AttainmentView.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <AttainmentView>[],
    );

Map<String, dynamic> _$MyAttainmentViewToJson(_MyAttainmentView instance) =>
    <String, dynamic>{
      'asOf': instance.asOf,
      'managerName': instance.managerName,
      'targets': instance.targets,
    };
