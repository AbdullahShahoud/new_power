import 'package:json_annotation/json_annotation.dart';

/// salesforce-client-reference.md §3 — what a target measures.
enum TargetMetric {
  @JsonValue('SALES_VALUE')
  salesValue,
  @JsonValue('UNITS_SUPPLIED')
  unitsSupplied,
  @JsonValue('WINS_COUNT')
  winsCount,
  @JsonValue(null)
  unknown,
}

extension TargetMetricX on TargetMetric {
  String get wireValue => switch (this) {
    TargetMetric.salesValue => 'SALES_VALUE',
    TargetMetric.unitsSupplied => 'UNITS_SUPPLIED',
    TargetMetric.winsCount => 'WINS_COUNT',
    TargetMetric.unknown => 'SALES_VALUE',
  };

  String get labelKey => switch (this) {
    TargetMetric.salesValue => 'target_metric_sales_value',
    TargetMetric.unitsSupplied => 'target_metric_units',
    TargetMetric.winsCount => 'target_metric_wins',
    TargetMetric.unknown => 'target_metric_sales_value',
  };

  /// Only `SALES_VALUE` carries a currency — the server *refuses* one on a
  /// count metric rather than dropping it, so the two must never be
  /// rendered the same way.
  bool get isMoney => this == TargetMetric.salesValue;
}

/// §3 `AttainmentStatus` — computed server-side, never stored, because a
/// stored status would be stale the moment an outcome is confirmed.
///
/// ⚠️ The same value means different things either side of `closed`. On an
/// open period `BEHIND` is a live warning; on a finished one it is simply a
/// fact — a quarter that ended at 94.7% is not "at risk" of anything any
/// more. The UI styles the two differently for exactly that reason.
enum AttainmentStatus {
  @JsonValue('MET')
  met,
  @JsonValue('ON_TRACK')
  onTrack,
  @JsonValue('AT_RISK')
  atRisk,
  @JsonValue('BEHIND')
  behind,
  @JsonValue(null)
  unknown,
}

extension AttainmentStatusX on AttainmentStatus {
  String get labelKey => switch (this) {
    AttainmentStatus.met => 'attainment_status_met',
    AttainmentStatus.onTrack => 'attainment_status_on_track',
    AttainmentStatus.atRisk => 'attainment_status_at_risk',
    AttainmentStatus.behind => 'attainment_status_behind',
    AttainmentStatus.unknown => 'attainment_status_unknown',
  };
}
