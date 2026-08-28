import 'package:freezed_annotation/freezed_annotation.dart';

/// The three things a target can be written against
/// (attainment-me.md §1, `metric`).
///
/// ⚠️ **Case-sensitive on the wire.** The server takes `SALES_VALUE`, not
/// `sales_value` — anything else is a `400 VALIDATION_ERROR`, so the wire
/// token is produced from [AttainmentMetricX.wireValue] and never from
/// `name.toUpperCase()`.
enum AttainmentMetric {
  @JsonValue('SALES_VALUE')
  salesValue,
  @JsonValue('UNITS_SUPPLIED')
  unitsSupplied,
  @JsonValue('WINS_COUNT')
  winsCount,
}

extension AttainmentMetricX on AttainmentMetric {
  String get wireValue => switch (this) {
    AttainmentMetric.salesValue => 'SALES_VALUE',
    AttainmentMetric.unitsSupplied => 'UNITS_SUPPLIED',
    AttainmentMetric.winsCount => 'WINS_COUNT',
  };

  /// What the rep reads — "Wins count", not `WINS_COUNT`.
  ///
  /// The screaming-snake token is the *wire* spelling and stays on
  /// [wireValue], where the query string needs it. It is never shown:
  /// underscores and caps are a serialisation detail, and in Arabic the
  /// token is not even readable.
  String get nameKey => switch (this) {
    AttainmentMetric.salesValue => 'attainment_metric_sales_value',
    AttainmentMetric.unitsSupplied => 'attainment_metric_units_supplied',
    AttainmentMetric.winsCount => 'attainment_metric_wins_count',
  };

  /// A one-line description of what the metric actually counts — the
  /// subtitle under [nameKey] in the picker.
  String get descriptionKey => switch (this) {
    AttainmentMetric.salesValue => 'attainment_metric_sales_value_desc',
    AttainmentMetric.unitsSupplied => 'attainment_metric_units_supplied_desc',
    AttainmentMetric.winsCount => 'attainment_metric_wins_count_desc',
  };

  /// Only `SALES_VALUE` carries a currency; the two count metrics always
  /// come back with `currency: null` (§3.1). Drives whether a row renders
  /// `"12.00"` as money or as **12 wins**.
  bool get isMoney => this == AttainmentMetric.salesValue;
}

/// The four labels the calculator can emit (§4).
///
/// ⚠️ A **closed** period only ever reads `MET` or `BEHIND` — there is no
/// pace left to miss, so `ON_TRACK`/`AT_RISK` are unreachable once
/// `closed` is true. The UI must not imply otherwise.
enum AttainmentTargetStatus {
  @JsonValue('MET')
  met,
  @JsonValue('ON_TRACK')
  onTrack,
  @JsonValue('AT_RISK')
  atRisk,
  @JsonValue('BEHIND')
  behind,

  /// Not a server value. Guards against a label added server-side later —
  /// a strict parse would throw and blank the whole screen over a badge.
  unknown,
}

extension AttainmentTargetStatusX on AttainmentTargetStatus {
  String get labelKey => switch (this) {
    AttainmentTargetStatus.met => 'attainment_status_met',
    AttainmentTargetStatus.onTrack => 'attainment_status_on_track',
    AttainmentTargetStatus.atRisk => 'attainment_status_at_risk',
    AttainmentTargetStatus.behind => 'attainment_status_behind',
    AttainmentTargetStatus.unknown => 'attainment_status_unknown',
  };
}

/// How the rep orders the target rows. Applied **client-side** — the route
/// has no sort parameter and any unknown query key is a `400` (§1).
///
/// `periodAsc` is the server's own order and therefore the default: two
/// halves of a transfer-split quarter read left-to-right in time.
enum AttainmentSort { periodAsc, periodDesc, attainmentDesc, remainingDesc }

extension AttainmentSortX on AttainmentSort {
  String get labelKey => switch (this) {
    AttainmentSort.periodAsc => 'attainment_sort_period_asc',
    AttainmentSort.periodDesc => 'attainment_sort_period_desc',
    AttainmentSort.attainmentDesc => 'attainment_sort_attainment_desc',
    AttainmentSort.remainingDesc => 'attainment_sort_remaining_desc',
  };
}
