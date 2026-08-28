// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import 'attainment_enums.dart';
import 'decimal2.dart';

part 'attainment_view.freezed.dart';
part 'attainment_view.g.dart';

/// One target row (attainment-me.md §3).
///
/// ⚠️ Every money-shaped value is a **String**, never a number — the server
/// builds them from `bigint` minor units and a JSON number has already lost
/// precision by the time this client parses it. They stay strings here and
/// are read through the `…Amount` getters below, which go via [Decimal2].
///
/// ⚠️ `expectedToDate`, `expectedToDatePct`, `elapsedDays` and `totalDays`
/// are **omitted keys** — not null, not 0 — whenever `closed` is true. They
/// are nullable here for exactly that reason; branch on [AttainmentViewX.hasPace]
/// (which reads `closed`), never on whether one of them happens to be
/// non-null.
@freezed
abstract class AttainmentView with _$AttainmentView {
  const factory AttainmentView({
    @Default('') String targetId,
    @Default(AttainmentMetric.salesValue) AttainmentMetric metric,

    /// ISO-4217, e.g. `"SYP"`. **Null for both count metrics** and always
    /// present for `SALES_VALUE`. Read per row — never off `targets[0]`.
    String? currency,

    /// `"YYYY-MM-DD"`, inclusive at both ends. Kept as the raw string: a
    /// `DateTime.parse` + local-time render turns 1 July into 30 June for
    /// any negative-offset reader.
    @Default('') String periodStart,
    @Default('') String periodEnd,

    /// `true` ⟺ the target's *lifecycle status* is CLOSED — **not** the
    /// calendar. A period whose end has passed but which a manager has not
    /// closed is still `false` and still carries pace.
    @Default(false) bool closed,

    @Default('0.00') String target,
    @Default('0.00') String attained,

    /// A JSON number, display-only, ≤ 1 decimal. `num` because a whole
    /// percentage serialises as `100`, not `100.0`.
    @Default(0) num attainedPct,

    /// **Floored at `"0.00"`** — never negative. For the overshoot on an
    /// overachieved target, use [AttainmentViewX.overshoot].
    @Default('0.00') String remaining,

    // ── the four pace fields: present together, absent together ──────
    String? expectedToDate,
    num? expectedToDatePct,
    int? elapsedDays,
    int? totalDays,

    @JsonKey(unknownEnumValue: AttainmentTargetStatus.unknown)
    @Default(AttainmentTargetStatus.unknown)
    AttainmentTargetStatus status,

    /// How many confirmed, won outcomes were counted into `attained`.
    /// ⚠️ Outcomes in a *different* currency to the target are dropped from
    /// both this count and `attained`, and this route does not say how many.
    int? confirmedOutcomes,
  }) = _AttainmentView;

  factory AttainmentView.fromJson(Map<String, dynamic> json) =>
      _$AttainmentViewFromJson(json);
}

extension AttainmentViewX on AttainmentView {
  Decimal2 get targetAmount => Decimal2.parse(target);
  Decimal2 get attainedAmount => Decimal2.parse(attained);
  Decimal2 get remainingAmount => Decimal2.parse(remaining);
  Decimal2? get expectedAmount => Decimal2.tryParse(expectedToDate);

  /// §3.4 — **branch on `closed`**, never on `"expectedToDate" in row`.
  /// They always agree, but one is a documented field and the other is an
  /// absence.
  bool get hasPace => !closed;

  /// How much the rep is *over* target. `remaining` is floored at zero, so
  /// this is the only way to surface an overshoot. Zero when short.
  Decimal2 get overshoot {
    final diff = attainedAmount - targetAmount;
    return diff.isNegative ? Decimal2.zero : diff;
  }

  /// Progress-bar fraction, clamped — an overachieved target fills the bar
  /// rather than overflowing it.
  double get attainedFraction => (attainedPct / 100).clamp(0.0, 1.0);

  /// Where the pace marker sits on the bar, or null on a closed period —
  /// a finished quarter has no pace to draw.
  double? get expectedFraction {
    if (!hasPace) return null;
    final pct = expectedToDatePct;
    if (pct == null) return null;
    return (pct / 100).clamp(0.0, 1.0);
  }
}

/// The `data` payload (§3).
@freezed
abstract class MyAttainmentView with _$MyAttainmentView {
  const factory MyAttainmentView({
    /// `"YYYY-MM-DD"`, the **server's** calendar day, not the device's.
    @Default('') String asOf,

    /// The rep's **current** sales manager — never a target's snapshot
    /// manager. It sits here, once, rather than on each row: after a
    /// mid-period transfer the two rows belong to two different managers,
    /// and labelling both with the current one would state the opposite of
    /// what the split means.
    ///
    /// ⚠️ `null` is a real, expected value (a stranded team, an account
    /// approved without a manager, a dangling reporting line) — render the
    /// absence, do not treat it as an error.
    String? managerName,

    @Default(<AttainmentView>[]) List<AttainmentView> targets,
  }) = _MyAttainmentView;

  factory MyAttainmentView.fromJson(Map<String, dynamic> json) =>
      _$MyAttainmentViewFromJson(json);
}

/// The one combined figure across every row in the response.
///
/// §3.3: two halves of a transfer-split quarter are **one period made of two
/// windows**. The combined number is computed by summing `target` and
/// `attained` with decimal arithmetic and recomputing the percentage from
/// the sums — never by averaging the two percentages, which a small half
/// would drag around as hard as a large one.
class AttainmentRollup {
  final Decimal2 target;
  final Decimal2 attained;
  final Decimal2 remaining;

  /// Null when the combined pace is meaningless — see [hasPace].
  final Decimal2? expected;

  final double attainedPct;
  final double? expectedPct;

  /// Summed across rows. For a split quarter these add back to the whole:
  /// 46 + 13 elapsed of 46 + 46 total is the quarter's own 59 / 92.
  final int? elapsedDays;
  final int? totalDays;

  final AttainmentTargetStatus status;
  final bool closed;
  final String? currency;
  final AttainmentMetric metric;
  final int confirmedOutcomes;
  final int rowCount;

  const AttainmentRollup({
    required this.target,
    required this.attained,
    required this.remaining,
    required this.expected,
    required this.attainedPct,
    required this.expectedPct,
    required this.elapsedDays,
    required this.totalDays,
    required this.status,
    required this.closed,
    required this.currency,
    required this.metric,
    required this.confirmedOutcomes,
    required this.rowCount,
  });

  bool get hasPace => expectedPct != null;

  double get attainedFraction => (attainedPct / 100).clamp(0.0, 1.0);

  double? get expectedFraction {
    final pct = expectedPct;
    return pct == null ? null : (pct / 100).clamp(0.0, 1.0);
  }
}

extension MyAttainmentViewX on MyAttainmentView {
  bool get hasNoTargets => targets.isEmpty;

  /// §3.3 — the halves always add back to the whole, so the summary card is
  /// computed rather than picked from one row.
  ///
  /// Returns null for an empty `targets`, which is a **normal answer**, not
  /// a failure: nothing has been published for that period yet.
  AttainmentRollup? get rollup {
    if (targets.isEmpty) return null;

    // A single row is reported with the server's own figures rather than
    // recomputed ones — nothing to combine, and this way the screen can
    // never disagree with the payload by a rounding step.
    if (targets.length == 1) {
      final row = targets.first;
      return AttainmentRollup(
        target: row.targetAmount,
        attained: row.attainedAmount,
        remaining: row.remainingAmount,
        expected: row.expectedAmount,
        attainedPct: row.attainedPct.toDouble(),
        expectedPct: row.hasPace ? row.expectedToDatePct?.toDouble() : null,
        elapsedDays: row.hasPace ? row.elapsedDays : null,
        totalDays: row.hasPace ? row.totalDays : null,
        status: row.status,
        closed: row.closed,
        currency: row.currency,
        metric: row.metric,
        confirmedOutcomes: row.confirmedOutcomes ?? 0,
        rowCount: 1,
      );
    }

    // Read per row, not off targets[0] — one response is one metric and in
    // practice one currency, but a disagreement means the combined figure
    // must not be labelled with either.
    final currencies = targets
        .map((row) => row.currency)
        .whereType<String>()
        .toSet();

    var target = Decimal2.zero;
    var attained = Decimal2.zero;
    var remaining = Decimal2.zero;
    var expected = Decimal2.zero;
    var elapsedDays = 0;
    var totalDays = 0;
    var confirmed = 0;
    // The combined pace only means something if *every* row still has one.
    // A closed row has no pace, and substituting `target` for it would draw
    // a projection line through a quarter that is already over.
    var everyRowHasPace = true;
    var everyRowClosed = true;

    for (final row in targets) {
      target += row.targetAmount;
      attained += row.attainedAmount;
      remaining += row.remainingAmount;
      confirmed += row.confirmedOutcomes ?? 0;
      everyRowClosed = everyRowClosed && row.closed;

      final rowExpected = row.expectedAmount;
      final rowTotal = row.totalDays;
      if (!row.hasPace || rowExpected == null || rowTotal == null) {
        everyRowHasPace = false;
        continue;
      }
      expected += rowExpected;
      elapsedDays += row.elapsedDays ?? 0;
      totalDays += rowTotal;
    }

    // `attainedPct` is 0 when the target is 0 — §4: a rep with no number is
    // at 0 %, not at an error.
    final attainedPct = target.isZero
        ? 0.0
        : roundPercent(attained.toDouble() / target.toDouble() * 100);
    final expectedPct = (!everyRowHasPace || target.isZero)
        ? null
        : roundPercent(expected.toDouble() / target.toDouble() * 100);

    return AttainmentRollup(
      target: target,
      attained: attained,
      remaining: remaining,
      expected: everyRowHasPace ? expected : null,
      attainedPct: attainedPct,
      expectedPct: expectedPct,
      elapsedDays: everyRowHasPace ? elapsedDays : null,
      totalDays: everyRowHasPace ? totalDays : null,
      status: _combinedStatus(attainedPct, expectedPct, everyRowClosed),
      closed: everyRowClosed,
      currency: currencies.length == 1 ? currencies.first : null,
      metric: targets.first.metric,
      confirmedOutcomes: confirmed,
      rowCount: targets.length,
    );
  }
}

/// §4, applied to the combined figures so the summary badge agrees with the
/// combined bar instead of echoing whichever row happened to be first.
///
/// A closed period reaches only two of the four labels: there is no pace
/// left to miss, so 94.7 % reads BEHIND, not AT_RISK.
AttainmentTargetStatus _combinedStatus(
  double attainedPct,
  double? expectedPct,
  bool closed,
) {
  if (attainedPct >= 100) return AttainmentTargetStatus.met;
  if (closed || expectedPct == null) return AttainmentTargetStatus.behind;
  final gap = expectedPct - attainedPct;
  if (gap <= 5) return AttainmentTargetStatus.onTrack;
  if (gap <= 15) return AttainmentTargetStatus.atRisk;
  return AttainmentTargetStatus.behind;
}
