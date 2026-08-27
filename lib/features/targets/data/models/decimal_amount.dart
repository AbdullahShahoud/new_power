/// Arithmetic and formatting for the API's decimal **strings**.
///
/// §1.6 is blunt about this: every amount is `Decimal(14,2)` and always
/// travels as a string — *"Do not parse into a float and re-render; a JSON
/// number has already lost precision."*
///
/// To be accurate about why: a `Decimal(14,2)` at the server's ceiling is
/// ~1e14 in minor units, which is under 2^53, so a `double` would in fact
/// round-trip today's values exactly. The reason to avoid it is that this
/// holds only *because* every value happens to fall under that bound — a
/// property to re-check on every change of scale, not a guarantee.
///
/// So everything here works on **integer minor units** (cents) held in an
/// `int`, 64-bit in Dart — exact by construction, good to ~9.2×10^18, with
/// unambiguous equality and formatting.
class DecimalAmount {
  /// The value in minor units: `"26000000.00"` → `2600000000`.
  final int minorUnits;

  const DecimalAmount(this.minorUnits);

  static const zero = DecimalAmount(0);

  /// Parses a server decimal string. Returns [zero] for anything malformed
  /// rather than throwing — a broken figure must not take down the whole
  /// home screen.
  factory DecimalAmount.parse(String? raw) {
    final value = raw?.trim() ?? '';
    if (value.isEmpty) return zero;

    final negative = value.startsWith('-');
    final unsigned = negative ? value.substring(1) : value;
    final parts = unsigned.split('.');
    if (parts.length > 2) return zero;

    final whole = int.tryParse(parts[0].isEmpty ? '0' : parts[0]);
    if (whole == null) return zero;

    var fraction = 0;
    if (parts.length == 2) {
      // Pad or truncate to exactly two places, so "5.4" and "5.40" agree and
      // an unexpected third digit cannot inflate the value by 10×.
      final digits = parts[1].padRight(2, '0').substring(0, 2);
      final parsed = int.tryParse(digits);
      if (parsed == null) return zero;
      fraction = parsed;
    }
    final total = whole * 100 + fraction;
    return DecimalAmount(negative ? -total : total);
  }

  DecimalAmount operator +(DecimalAmount other) =>
      DecimalAmount(minorUnits + other.minorUnits);

  bool get isZero => minorUnits == 0;

  /// Grouped for display, e.g. `26,000,000`.
  ///
  /// The fraction is dropped when it is `.00`, which it is for every figure
  /// this screen shows: a count metric uses a zero fraction by contract
  /// (`"120.00"` means 120 units), and money targets are whole pounds in
  /// practice. A trailing `.00` on an eight-digit number is noise.
  String format({bool forceFraction = false}) {
    final negative = minorUnits < 0;
    final abs = minorUnits.abs();
    final whole = abs ~/ 100;
    final fraction = abs % 100;

    final digits = whole.toString();
    final grouped = StringBuffer();
    for (var i = 0; i < digits.length; i++) {
      if (i > 0 && (digits.length - i) % 3 == 0) grouped.write(',');
      grouped.write(digits[i]);
    }

    final buffer = StringBuffer();
    if (negative) buffer.write('-');
    buffer.write(grouped);
    if (fraction != 0 || forceFraction) {
      buffer.write('.');
      buffer.write(fraction.toString().padLeft(2, '0'));
    }
    return buffer.toString();
  }

  /// Percentage of [total], to one decimal place.
  ///
  /// Only used for a **client-side sum** of two transfer halves — every
  /// single-row percentage comes from the server, which rounds half-up so a
  /// screen and a manager's calculator agree. Recomputing one the server
  /// already sent would risk disagreeing with it in the last digit.
  double percentOf(DecimalAmount total) {
    if (total.minorUnits == 0) return 0;
    return (minorUnits * 1000 / total.minorUnits).round() / 10;
  }
}
