import 'package:flutter/material.dart';

import '../../../core/localization/app_localizations.dart';
import '../../../core/theming/app_colors.dart';
import '../data/models/attainment_enums.dart';
import '../data/models/decimal2.dart';

/// Presentation helpers shared by the attainment screen, its cards and the
/// Home summary. Kept out of the widgets so the two never format the same
/// number two different ways.

/// Renders `"2026-08-28"` as `28 Aug 2026`.
///
/// ⚠️ **Never** `DateTime.parse` these. attainment-me.md §3.1: they are
/// calendar days at midnight UTC, and a device in a negative-offset zone
/// renders `2026-07-01` as 30 June. The string is split instead, so no
/// timezone is ever involved.
String formatIsoDay(BuildContext context, String? isoDay) {
  final parts = isoDay?.split('-');
  if (parts == null || parts.length != 3) return isoDay ?? '—';
  final month = int.tryParse(parts[1]);
  final day = int.tryParse(parts[2]);
  if (month == null || day == null || month < 1 || month > 12) {
    return isoDay ?? '—';
  }
  return '$day ${context.tr('attainment_month_$month')} ${parts[0]}';
}

/// `1 Jul 2026 – 30 Sep 2026`. **`periodEnd` is inclusive** — 30 Sep is a
/// day inside the period, not the boundary after it.
String formatIsoDayRange(BuildContext context, String start, String end) =>
    '${formatIsoDay(context, start)} – ${formatIsoDay(context, end)}';

/// The inclusive day count `"2026-07-01" … "2026-09-30"` describes: 92, not
/// 91. Only used where the server did not send `totalDays` (a closed row);
/// where it did, its own number wins.
int? inclusiveDayCount(String start, String end) {
  final from = _utcDay(start);
  final to = _utcDay(end);
  if (from == null || to == null) return null;
  return to.difference(from).inDays + 1;
}

/// Builds a UTC `DateTime` from the *parts* of a `YYYY-MM-DD` string —
/// never by parsing the string, which would attach the device's offset.
DateTime? _utcDay(String isoDay) {
  final parts = isoDay.split('-');
  if (parts.length != 3) return null;
  final year = int.tryParse(parts[0]);
  final month = int.tryParse(parts[1]);
  final day = int.tryParse(parts[2]);
  if (year == null || month == null || day == null) return null;
  return DateTime.utc(year, month, day);
}

/// The full figure, as a rep would read it on a statement:
/// `45,000,000.00` for money, `12` for a count.
///
/// The `.00` is stripped for the two count metrics — it is noise on a
/// number of wins, and §3.1 asks for exactly that.
String formatAmount(Decimal2 amount, AttainmentMetric metric) =>
    metric.isMoney ? amount.toFixedString() : amount.toCountString();

/// The tile form: `18.40M` for money at scale, `5` for a count.
///
/// Counts are never abbreviated — "5 wins" does not benefit from an `M`
/// suffix it will never reach.
String formatAmountCompact(Decimal2 amount, AttainmentMetric metric) =>
    metric.isMoney ? amount.toCompactString() : amount.toCountString();

/// `40.9%`, `100%` — the percentage sign attached to the API's own
/// serialisation, which drops the decimal point on a whole number.
String formatPercentLabel(num? value) =>
    value == null ? '—' : '${formatPercent(value)}%';

/// Maps the four status labels onto the validated, CVD-safe project-status
/// palette (DESIGN_GUIDELINES.md §2) rather than inventing four new hues:
/// MET → won (green), ON_TRACK → new (blue), AT_RISK → follow-up (amber),
/// BEHIND → lost (rose).
///
/// ⚠️ Brand red is never used here — the doc reserves it away from status,
/// and a red badge that means "the brand" next to one that means "behind"
/// is unreadable.
StatusColor statusPalette(BuildContext context, AttainmentTargetStatus status) {
  final colors = context.colors;
  return switch (status) {
    AttainmentTargetStatus.met => colors.statusWon,
    AttainmentTargetStatus.onTrack => colors.statusNew,
    AttainmentTargetStatus.atRisk => colors.statusFollowUp,
    AttainmentTargetStatus.behind => colors.statusLost,
    AttainmentTargetStatus.unknown => colors.statusClosed,
  };
}
