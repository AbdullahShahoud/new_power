import 'package:flutter/foundation.dart';

/// Which of the three shapes `?period=` was written in (§1).
enum AttainmentPeriodKind { quarter, month, year }

/// The `period` query parameter — `YYYY-Qn`, `YYYY-MM` or `YYYY`.
///
/// ⚠️ Deliberately **not** a free date range. attainment-me.md §1: a rollup
/// over "1 Jul to 20 Aug" is a number with no meaning, because the targets
/// it would sum were written for whole periods. So this is a closed set of
/// three shapes, and the picker offers nothing else.
///
/// It selects a **window**, not a target: the server returns every live
/// target whose own period *overlaps* it, which is why one quarter can come
/// back as two rows.
@immutable
class AttainmentPeriod {
  final AttainmentPeriodKind kind;
  final int year;

  /// Quarter 1–4, or month 1–12. Null for [AttainmentPeriodKind.year].
  final int? part;

  const AttainmentPeriod._(this.kind, this.year, this.part);

  const AttainmentPeriod.quarter(int year, int quarter)
    : this._(AttainmentPeriodKind.quarter, year, quarter);

  const AttainmentPeriod.month(int year, int month)
    : this._(AttainmentPeriodKind.month, year, month);

  const AttainmentPeriod.year(int year)
    : this._(AttainmentPeriodKind.year, year, null);

  /// The default when no `period` is sent: the quarter containing today,
  /// **UTC** — the server's own default, so the client's idea of "this
  /// quarter" cannot disagree with it on the last night of a quarter.
  factory AttainmentPeriod.currentQuarter([DateTime? now]) {
    final today = (now ?? DateTime.now()).toUtc();
    return AttainmentPeriod.quarter(today.year, ((today.month - 1) ~/ 3) + 1);
  }

  static AttainmentPeriod? tryParse(String? raw) {
    final text = raw?.trim();
    if (text == null || text.isEmpty) return null;

    // Case-insensitive on the `Q`, matching the server (§1).
    final quarter = RegExp(r'^(\d{4})-[Qq]([1-4])$').firstMatch(text);
    if (quarter != null) {
      return AttainmentPeriod.quarter(
        int.parse(quarter.group(1)!),
        int.parse(quarter.group(2)!),
      );
    }
    final month = RegExp(r'^(\d{4})-(0[1-9]|1[0-2])$').firstMatch(text);
    if (month != null) {
      return AttainmentPeriod.month(
        int.parse(month.group(1)!),
        int.parse(month.group(2)!),
      );
    }
    final year = RegExp(r'^(\d{4})$').firstMatch(text);
    if (year != null) return AttainmentPeriod.year(int.parse(year.group(1)!));

    return null;
  }

  /// What travels on the query string — and what the selector displays.
  /// `2026-Q3` is the vocabulary the rep sees everywhere else this number
  /// appears, so it is not translated into prose.
  String get wireValue => switch (kind) {
    AttainmentPeriodKind.quarter => '$year-Q$part',
    AttainmentPeriodKind.month =>
      '$year-${part.toString().padLeft(2, '0')}',
    AttainmentPeriodKind.year => '$year',
  };

  /// The picker's contents: the current quarter and the seven before it,
  /// the last six months, and three years. Everything is derived from the
  /// **UTC** day, for the same reason [currentQuarter] is.
  static List<AttainmentPeriod> options([DateTime? now]) {
    final today = (now ?? DateTime.now()).toUtc();
    final currentQuarter = ((today.month - 1) ~/ 3) + 1;

    final quarters = <AttainmentPeriod>[];
    var qYear = today.year;
    var q = currentQuarter;
    for (var i = 0; i < 8; i++) {
      quarters.add(AttainmentPeriod.quarter(qYear, q));
      q -= 1;
      if (q == 0) {
        q = 4;
        qYear -= 1;
      }
    }

    final months = <AttainmentPeriod>[];
    var mYear = today.year;
    var m = today.month;
    for (var i = 0; i < 6; i++) {
      months.add(AttainmentPeriod.month(mYear, m));
      m -= 1;
      if (m == 0) {
        m = 12;
        mYear -= 1;
      }
    }

    final years = [
      for (var i = 0; i < 3; i++) AttainmentPeriod.year(today.year - i),
    ];

    return [...quarters, ...months, ...years];
  }

  @override
  bool operator ==(Object other) =>
      other is AttainmentPeriod && other.wireValue == wireValue;

  @override
  int get hashCode => wireValue.hashCode;

  @override
  String toString() => wireValue;
}
