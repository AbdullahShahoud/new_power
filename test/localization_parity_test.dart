import 'package:flutter_test/flutter_test.dart';
import 'package:new_power/core/localization/languages/ar_sy.dart';
import 'package:new_power/core/localization/languages/en_us.dart';

/// Guards the invariant that made five auth screens render raw keys in
/// English: `translate()` looks a key up in one map, and a key that exists in
/// only one language is invisible until a user in the other language reaches
/// that exact screen state.
///
/// The English fallback in `AppLocalizations.translate` softens the failure;
/// this test is what stops it happening in the first place.
void main() {
  group('localization key parity', () {
    test('every Arabic key has an English counterpart', () {
      final missing = arSY.keys.where((k) => !enUS.containsKey(k)).toList()
        ..sort();
      expect(
        missing,
        isEmpty,
        reason:
            'Keys defined in ar_sy.dart but missing from en_us.dart. An '
            'English user reaching these renders the raw key on screen:\n'
            '${missing.join('\n')}',
      );
    });

    test('every English key has an Arabic counterpart', () {
      final missing = enUS.keys.where((k) => !arSY.containsKey(k)).toList()
        ..sort();
      expect(
        missing,
        isEmpty,
        reason:
            'Keys defined in en_us.dart but missing from ar_sy.dart. Arabic '
            'is this app\'s default locale (LanguageManager starts at ar_SY), '
            'so these silently fall back to English text:\n'
            '${missing.join('\n')}',
      );
    });

    test('no key maps to an empty or whitespace-only string', () {
      for (final map in {'ar_sy': arSY, 'en_us': enUS}.entries) {
        final blank = map.value.entries
            .where((e) => e.value.trim().isEmpty)
            .map((e) => e.key)
            .toList();
        expect(blank, isEmpty, reason: 'Blank values in ${map.key}.dart');
      }
    });

    test('Arabic never interpolates a token English does not supply', () {
      // Asymmetric on purpose. The caller substitutes the same values into
      // whichever string comes back, so:
      //
      //   - A token in Arabic that English lacks is a real bug: the English
      //     string silently drops the value, or the Arabic one renders a
      //     literal "{n}" if the caller only fills English's tokens.
      //   - A token in English that Arabic lacks is often *correct*. Arabic
      //     has a dual, so `time_minute_two` is "منذ دقيقتين" — the number is
      //     carried by the word form itself and there is nothing to
      //     interpolate. English has no dual and must fall back to
      //     "{count} minutes ago".
      final placeholder = RegExp(r'\{(\w+)\}');
      Set<String> tokens(String s) =>
          placeholder.allMatches(s).map((m) => m.group(1)!).toSet();

      final mismatched = <String>[];
      for (final key in arSY.keys) {
        final en = enUS[key];
        if (en == null) continue;
        final extra = tokens(arSY[key]!).difference(tokens(en));
        if (extra.isNotEmpty) mismatched.add('$key: Arabic-only ${extra.join(", ")}');
      }
      expect(mismatched, isEmpty, reason: mismatched.join('\n'));
    });
  });
}
