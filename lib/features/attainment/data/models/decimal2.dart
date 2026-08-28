import 'package:flutter/foundation.dart';

/// A fixed-point decimal held as `BigInt` **minor units** (hundredths).
///
/// attainment-me.md §3.1 is explicit: `target`, `attained`, `remaining` and
/// `expectedToDate` arrive as decimal strings with exactly two decimal
/// places, produced server-side from `bigint` minor units — and
/// `45000000.10` does not round-trip through IEEE-754. So nothing in this
/// feature ever calls `double.parse` on a money string; the strings are
/// parsed straight into `BigInt` here and only ever leave as text.
///
/// [toDouble] exists for **display ratios only** (a progress-bar fraction),
/// never for a figure the rep reads.
@immutable
class Decimal2 implements Comparable<Decimal2> {
  /// The value × 100.
  final BigInt minor;

  const Decimal2(this.minor);

  static final Decimal2 zero = Decimal2(BigInt.zero);

  /// Parses `"45000000.00"`, `"12.00"`, `"7"`, `"-3.5"`.
  ///
  /// Returns null rather than throwing on anything unexpected — a single
  /// malformed row must not take the screen down. More than two decimals
  /// are truncated, matching the server's own truncating pro-rata.
  static Decimal2? tryParse(String? raw) {
    if (raw == null) return null;
    final text = raw.trim();
    if (text.isEmpty) return null;

    final negative = text.startsWith('-');
    final unsigned = negative ? text.substring(1) : text;
    final dot = unsigned.indexOf('.');
    final whole = dot == -1 ? unsigned : unsigned.substring(0, dot);
    final rawFraction = dot == -1 ? '' : unsigned.substring(dot + 1);
    // Pad "5" → "50", truncate "652…" → "65". Never round: the server
    // truncates too, so rounding here would disagree with its own figure.
    final fraction = rawFraction.padRight(2, '0').substring(0, 2);

    if (whole.isEmpty && fraction.isEmpty) return null;
    if (!_digits.hasMatch(whole.isEmpty ? '0' : whole)) return null;
    if (!_digits.hasMatch(fraction)) return null;

    final units = BigInt.parse('${whole.isEmpty ? '0' : whole}$fraction');
    return Decimal2(negative ? -units : units);
  }

  /// [tryParse], falling back to zero. Used where the field has a documented
  /// `"0.00"` default and an absent value means "no number", not an error.
  static Decimal2 parse(String? raw) => tryParse(raw) ?? zero;

  static final RegExp _digits = RegExp(r'^\d+$');

  Decimal2 operator +(Decimal2 other) => Decimal2(minor + other.minor);
  Decimal2 operator -(Decimal2 other) => Decimal2(minor - other.minor);

  bool get isZero => minor == BigInt.zero;
  bool get isNegative => minor.isNegative;
  Decimal2 get abs => Decimal2(minor.abs());

  @override
  int compareTo(Decimal2 other) => minor.compareTo(other.minor);

  /// **Display only.** Precision is lost past ~2^53 minor units; never feed
  /// the result back into a figure the rep reads.
  double toDouble() => minor.toDouble() / 100;

  /// `"45,000,000.00"` — always two decimals, grouped in threes.
  String toFixedString({bool grouped = true}) {
    final sign = isNegative ? '-' : '';
    final units = minor.abs();
    final whole = (units ~/ BigInt.from(100)).toString();
    final fraction = (units % BigInt.from(100))
        .toString()
        .padLeft(2, '0');
    return '$sign${grouped ? _group(whole) : whole}.$fraction';
  }

  /// `"12"` for a count metric — the `.00` is noise on a number of wins.
  /// A non-zero fraction is kept, so a malformed `"12.50"` still reads true.
  String toCountString() {
    final fixed = toFixedString();
    return fixed.endsWith('.00')
        ? fixed.substring(0, fixed.length - 3)
        : fixed;
  }

  /// `"18.40M"` — the summary-tile form. Two decimals throughout, so
  /// `45,000,000.00` reads `45.00M` rather than a jumpy `45M`.
  ///
  /// Kept exact: the magnitude is divided in **minor units** with `BigInt`,
  /// so nothing overflows and nothing drifts.
  ///
  /// Rounded **half-up**, not truncated — unlike the underlying figures,
  /// which are the server's and are reproduced verbatim. This is a display
  /// abbreviation, so 28,858,695.65 reads `28.86M`, which is what a person
  /// gets on a calculator. The exact string is always one card away.
  String toCompactString() {
    final sign = isNegative ? '-' : '';
    final units = minor.abs();
    for (final step in _compactSteps) {
      if (units >= step.threshold) {
        // ×100 first so two decimals survive the integer division; the
        // half-step added before dividing is what makes it round rather
        // than truncate.
        final scaled =
            ((units * BigInt.from(100)) + (step.threshold ~/ BigInt.two)) ~/
            step.threshold;
        final whole = scaled ~/ BigInt.from(100);
        final fraction = (scaled % BigInt.from(100))
            .toString()
            .padLeft(2, '0');
        return '$sign${_group(whole.toString())}.$fraction${step.suffix}';
      }
    }
    return toFixedString();
  }

  static final List<_CompactStep> _compactSteps = [
    _CompactStep(BigInt.from(100000000000), 'B'), // 1e9 × 100
    _CompactStep(BigInt.from(100000000), 'M'), // 1e6 × 100
    _CompactStep(BigInt.from(100000), 'K'), // 1e3 × 100
  ];

  static String _group(String digits) {
    final buffer = StringBuffer();
    for (var i = 0; i < digits.length; i++) {
      if (i > 0 && (digits.length - i) % 3 == 0) buffer.write(',');
      buffer.write(digits[i]);
    }
    return buffer.toString();
  }

  @override
  bool operator ==(Object other) =>
      other is Decimal2 && other.minor == minor;

  @override
  int get hashCode => minor.hashCode;

  @override
  String toString() => toFixedString(grouped: false);
}

class _CompactStep {
  final BigInt threshold;
  final String suffix;
  const _CompactStep(this.threshold, this.suffix);
}

/// Half-up to one decimal, then formatted the way the API serialises its own
/// percentages: `40.9`, `64.1`, `100` — a whole percentage loses the
/// decimal point (§3.1), so `toStringAsFixed(1)` alone is wrong.
String formatPercent(num? value) {
  if (value == null) return '—';
  final rounded = (value * 10).round() / 10;
  if (rounded == rounded.roundToDouble()) return '${rounded.round()}';
  return rounded.toStringAsFixed(1);
}

/// Half-up to one decimal — the rounding the server documents for
/// `attainedPct` and `expectedToDatePct` (§4), reused wherever this client
/// has to recompute a combined percentage across a split quarter.
double roundPercent(double value) => (value * 10).round() / 10;
