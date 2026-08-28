// attainment-me.md §3.1 is unusually specific about money: every
// money-shaped value arrives as a **decimal string** built server-side from
// `bigint` minor units, because `45000000.10` does not round-trip through
// IEEE-754. The whole point of `Decimal2` is that nothing in this feature
// ever calls `double.parse` on one.
//
// These tests lock in the two things a refactor could quietly break:
//
//  1. the parse/format round-trip and the compact `18.40M` form, and
//  2. the roll-up across a **transfer-split quarter** — where §3.3 forbids
//     averaging the two percentages and requires summing the strings and
//     recomputing, because a small half would otherwise drag the number
//     around as hard as a large one.
//
// The fixtures are the worked payloads from attainment-me-examples.md,
// which are computed with the real server arithmetic.

import 'package:flutter_test/flutter_test.dart';
import 'package:new_power/features/attainment/data/models/attainment_enums.dart';
import 'package:new_power/features/attainment/data/models/attainment_period.dart';
import 'package:new_power/features/attainment/data/models/attainment_view.dart';
import 'package:new_power/features/attainment/data/models/decimal2.dart';

void main() {
  group('Decimal2', () {
    test('parses and re-emits a money string without going via double', () {
      // The value the doc names as the one a double cannot hold.
      expect(Decimal2.parse('45000000.10').toFixedString(grouped: false),
          '45000000.10');
      expect(Decimal2.parse('45000000.00').toFixedString(), '45,000,000.00');
      expect(Decimal2.parse('28858695.65').toFixedString(), '28,858,695.65');
    });

    test('truncates rather than rounds a third decimal', () {
      // The server truncates its pro-rata to 2 dp; rounding here would
      // disagree with the figure it sent.
      expect(Decimal2.parse('6358695.659').toFixedString(grouped: false),
          '6358695.65');
    });

    test('tolerates the shapes a malformed row could take', () {
      expect(Decimal2.tryParse(null), isNull);
      expect(Decimal2.tryParse(''), isNull);
      expect(Decimal2.tryParse('not-a-number'), isNull);
      expect(Decimal2.parse('7').toFixedString(grouped: false), '7.00');
      expect(Decimal2.parse('-3.5').toFixedString(grouped: false), '-3.50');
    });

    test('compact form keeps two decimals, as the summary tiles show', () {
      expect(Decimal2.parse('18400000.00').toCompactString(), '18.40M');
      expect(Decimal2.parse('28858695.65').toCompactString(), '28.86M');
      expect(Decimal2.parse('26600000.00').toCompactString(), '26.60M');
      expect(Decimal2.parse('45000000.00').toCompactString(), '45.00M');
      // Below the smallest step it stays exact rather than abbreviating.
      expect(Decimal2.parse('750.00').toCompactString(), '750.00');
    });

    test('count metrics drop the .00', () {
      expect(Decimal2.parse('12.00').toCountString(), '12');
      expect(Decimal2.parse('7.00').toCountString(), '7');
      // A non-zero fraction is kept, so a surprise still reads true.
      expect(Decimal2.parse('7.69').toCountString(), '7.69');
    });

    test('percentages serialise the way the API does', () {
      // §3.1 — a whole percentage loses the decimal point.
      expect(formatPercent(100), '100');
      expect(formatPercent(40.9), '40.9');
      expect(formatPercent(103.1), '103.1');
      // §4 — half-up to one decimal, not truncated. 54.9M of 95.5M is
      // 57.4869 %, which the API reports as 57.5.
      expect(roundPercent(57.4869), 57.5);
    });
  });

  group('AttainmentPeriod', () {
    test('round-trips the three documented shapes', () {
      expect(AttainmentPeriod.tryParse('2026-Q3')?.wireValue, '2026-Q3');
      expect(AttainmentPeriod.tryParse('2026-08')?.wireValue, '2026-08');
      expect(AttainmentPeriod.tryParse('2026')?.wireValue, '2026');
      // Case-insensitive on the Q, matching the server.
      expect(AttainmentPeriod.tryParse('2026-q3')?.wireValue, '2026-Q3');
    });

    test('rejects anything the server would 400', () {
      expect(AttainmentPeriod.tryParse('2026-Q5'), isNull);
      expect(AttainmentPeriod.tryParse('2026-13'), isNull);
      expect(AttainmentPeriod.tryParse('2026-07-01'), isNull);
    });

    test('the default quarter is derived from the UTC day', () {
      // 1 Jan 2027 at 00:30 UTC is 2027-Q1, even for a device whose local
      // clock still reads 31 December.
      final period = AttainmentPeriod.currentQuarter(
        DateTime.utc(2027, 1, 1, 0, 30),
      );
      expect(period.wireValue, '2027-Q1');
    });
  });

  group('roll-up', () {
    test('a single row reports the server figures verbatim', () {
      // Example 1: one open quarter.
      final view = MyAttainmentView(
        asOf: '2026-08-28',
        managerName: 'Layla Mansour',
        targets: const [
          AttainmentView(
            targetId: '3f2c9a71-5d18-4e0b-9c44-8a1e2b7d6f30',
            currency: 'SYP',
            periodStart: '2026-07-01',
            periodEnd: '2026-09-30',
            target: '45000000.00',
            attained: '18400000.00',
            attainedPct: 40.9,
            remaining: '26600000.00',
            expectedToDate: '28858695.65',
            expectedToDatePct: 64.1,
            elapsedDays: 59,
            totalDays: 92,
            status: AttainmentTargetStatus.behind,
            confirmedOutcomes: 7,
          ),
        ],
      );

      final rollup = view.rollup!;
      expect(rollup.attainedPct, 40.9);
      expect(rollup.expectedPct, 64.1);
      expect(rollup.elapsedDays, 59);
      expect(rollup.totalDays, 92);
      expect(rollup.status, AttainmentTargetStatus.behind);
      expect(rollup.attained.toCompactString(), '18.40M');
    });

    test('a transfer-split quarter adds back to the whole', () {
      // Example 2: the 45,000,000 target split 46/46 days on 2026-08-16.
      // Both halves are PUBLISHED; the first one's window is simply over.
      final view = MyAttainmentView(
        asOf: '2026-08-28',
        managerName: 'Fadi Haddad',
        targets: const [
          AttainmentView(
            targetId: '3f2c9a71-5d18-4e0b-9c44-8a1e2b7d6f30',
            currency: 'SYP',
            periodStart: '2026-07-01',
            periodEnd: '2026-08-15',
            target: '22500000.00',
            attained: '12000000.00',
            attainedPct: 53.3,
            remaining: '10500000.00',
            expectedToDate: '22500000.00',
            expectedToDatePct: 100,
            elapsedDays: 46,
            totalDays: 46,
            status: AttainmentTargetStatus.behind,
            confirmedOutcomes: 5,
          ),
          AttainmentView(
            targetId: 'c81d4e0a-2b33-47f6-b0a9-6d5c3e91f244',
            currency: 'SYP',
            periodStart: '2026-08-16',
            periodEnd: '2026-09-30',
            target: '22500000.00',
            attained: '3000000.00',
            attainedPct: 13.3,
            remaining: '19500000.00',
            expectedToDate: '6358695.65',
            expectedToDatePct: 28.3,
            elapsedDays: 13,
            totalDays: 46,
            status: AttainmentTargetStatus.atRisk,
            confirmedOutcomes: 2,
          ),
        ],
      );

      final rollup = view.rollup!;
      expect(rollup.target.toFixedString(grouped: false), '45000000.00');
      expect(rollup.attained.toFixedString(grouped: false), '15000000.00');
      // 15,000,000 / 45,000,000 = 33.3 %. It happens to equal the average of
      // 53.3 and 13.3 only because the halves are equal — the point is that
      // this is computed from the sums, not the percentages.
      expect(rollup.attainedPct, 33.3);
      // The two halves' days add back to the quarter's own 59 / 92.
      expect(rollup.elapsedDays, 59);
      expect(rollup.totalDays, 92);
      expect(rollup.confirmedOutcomes, 7);
      expect(rollup.currency, 'SYP');
      expect(rollup.status, AttainmentTargetStatus.behind);
    });

    test('a closed period carries no pace and reads MET or BEHIND', () {
      // Example 3: the four pace keys are absent, not null and not zero.
      const closed = AttainmentView(
        targetId: 'a17b3c55-9e21-4c88-8f02-1d7e4a6b0932',
        currency: 'SYP',
        periodStart: '2026-04-01',
        periodEnd: '2026-06-30',
        closed: true,
        target: '40000000.00',
        attained: '41250000.00',
        attainedPct: 103.1,
        remaining: '0.00',
        status: AttainmentTargetStatus.met,
        confirmedOutcomes: 11,
      );

      expect(closed.hasPace, isFalse);
      expect(closed.expectedFraction, isNull);
      // `remaining` is floored at "0.00" even though the rep is over — the
      // overshoot is only expressible as attained − target.
      expect(closed.remainingAmount.isZero, isTrue);
      expect(closed.overshoot.toFixedString(grouped: false), '1250000.00');

      final rollup =
          MyAttainmentView(asOf: '2026-08-28', targets: const [closed])
              .rollup!;
      expect(rollup.hasPace, isFalse);
      expect(rollup.expected, isNull);
      expect(rollup.status, AttainmentTargetStatus.met);
    });

    test('an empty targets list is a valid answer, not a failure', () {
      const view = MyAttainmentView(asOf: '2026-08-28', managerName: null);
      expect(view.rollup, isNull);
      expect(view.hasNoTargets, isTrue);
    });

    test('mixing a closed row into the period drops the combined pace', () {
      // A closed row has no pace, and substituting its target would draw a
      // projection through a window that is already over.
      final view = MyAttainmentView(
        asOf: '2026-08-28',
        targets: const [
          AttainmentView(
            periodStart: '2026-07-01',
            periodEnd: '2026-08-15',
            closed: true,
            target: '20000000.00',
            attained: '20000000.00',
            attainedPct: 100,
            remaining: '0.00',
            status: AttainmentTargetStatus.met,
          ),
          AttainmentView(
            periodStart: '2026-08-16',
            periodEnd: '2026-09-30',
            target: '20000000.00',
            attained: '5000000.00',
            attainedPct: 25,
            remaining: '15000000.00',
            expectedToDate: '5652173.91',
            expectedToDatePct: 28.3,
            elapsedDays: 13,
            totalDays: 46,
            status: AttainmentTargetStatus.onTrack,
          ),
        ],
      );

      final rollup = view.rollup!;
      expect(rollup.hasPace, isFalse);
      expect(rollup.expected, isNull);
      expect(rollup.elapsedDays, isNull);
      // 25,000,000 of 40,000,000 = 62.5 %, short of 100, and with no pace
      // to compare against the only honest label left is BEHIND.
      expect(rollup.attainedPct, 62.5);
      expect(rollup.status, AttainmentTargetStatus.behind);
    });
  });
}
