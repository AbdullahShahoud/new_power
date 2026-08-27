import 'package:flutter_test/flutter_test.dart';
import 'package:new_power/features/targets/data/models/decimal_amount.dart';

/// §1.6 forbids round-tripping the API's decimal strings through a float.
/// These assertions pin the exact-by-construction integer path: parsing,
/// the padding/truncation rules, grouping, and the one percentage the
/// client is allowed to compute for itself.
void main() {
  group('DecimalAmount.parse', () {
    test('holds the server ceiling figure exactly', () {
      final amount = DecimalAmount.parse('999999999999.99');
      expect(amount.minorUnits, 99999999999999);
      expect(amount.format(forceFraction: true), '999,999,999,999.99');
    });

    test('one and two fraction digits agree', () {
      expect(DecimalAmount.parse('5.4').minorUnits, 540);
      expect(DecimalAmount.parse('5.40').minorUnits, 540);
    });

    test('an unexpected third digit cannot inflate the value tenfold', () {
      expect(DecimalAmount.parse('5.409').minorUnits, 540);
    });

    test('a bare integer string is whole units, not minor units', () {
      expect(DecimalAmount.parse('120').minorUnits, 12000);
    });

    test('negatives survive the sign split', () {
      expect(DecimalAmount.parse('-1250.50').minorUnits, -125050);
      expect(DecimalAmount.parse('-1250.50').format(), '-1,250.50');
    });

    test('malformed input degrades to zero instead of throwing', () {
      for (final raw in ['', '   ', 'abc', '1.2.3', '1.2x', null]) {
        expect(DecimalAmount.parse(raw).isZero, isTrue, reason: 'raw=$raw');
      }
    });
  });

  group('format', () {
    test('groups in threes and drops a .00 fraction', () {
      expect(DecimalAmount.parse('26000000.00').format(), '26,000,000');
      expect(DecimalAmount.parse('999.00').format(), '999');
      expect(DecimalAmount.parse('1000.00').format(), '1,000');
      expect(DecimalAmount.parse('0.00').format(), '0');
    });

    test('keeps a non-zero fraction without being asked', () {
      expect(DecimalAmount.parse('1234.05').format(), '1,234.05');
    });
  });

  group('sum and percentage', () {
    test('two transfer halves add exactly', () {
      final a = DecimalAmount.parse('12500000.75');
      final b = DecimalAmount.parse('13499999.25');
      expect((a + b).format(), '26,000,000');
    });

    test('percentOf rounds to one place', () {
      final attained = DecimalAmount.parse('6500000.00');
      final goal = DecimalAmount.parse('26000000.00');
      expect(attained.percentOf(goal), 25.0);

      expect(
        DecimalAmount.parse('1.00').percentOf(DecimalAmount.parse('3.00')),
        33.3,
      );
    });

    // A target of zero is not a division bug to crash on — it is a manager
    // publishing an empty goal, and the screen must still render.
    test('a zero goal yields zero, not NaN or infinity', () {
      expect(DecimalAmount.parse('500.00').percentOf(DecimalAmount.zero), 0);
    });
  });
}
