import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:new_power/core/localization/app_localizations.dart';
import 'package:new_power/features/catalog/data/models/localized.dart';
import 'package:new_power/features/catalog/data/models/product_view.dart';
import 'package:new_power/features/catalog/ui/widgets/product_card.dart';

/// Guards the one invariant behind the product grid's spec chips:
///
///   the height [productGridDelegate] reserves must cover the height the
///   chips actually render at.
///
/// This has been wrong twice in opposite directions — once clipping rows
/// away inside a `ClipRect`, once summarising them as `+N` — and both times
/// the failure was invisible to the analyzer and to every existing test. The
/// reservation is computed by `HighlightStrip.lineCount` from a `TextPainter`
/// measurement; the render is done by `Wrap`. Nothing but a test keeps those
/// two agreeing.
HighlightView _chip(String text) => HighlightView(
  code: text,
  label: Localized(ar: text, en: text),
  display: Localized(ar: text, en: text),
);

/// Renders [highlights] at [width] and returns the height `Wrap` chose.
Future<double> _renderedHeight(
  WidgetTester tester,
  List<HighlightView> highlights,
  double width,
) async {
  final key = GlobalKey();
  late BuildContext captured;

  await tester.pumpWidget(
    ScreenUtilInit(
      designSize: const Size(390, 844),
      child: MaterialApp(
        locale: const Locale('en', 'US'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: Scaffold(
          body: Builder(
            builder: (context) {
              captured = context;
              return Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: width,
                  child: HighlightStrip(key: key, highlights: highlights),
                ),
              );
            },
          ),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();

  final lines = HighlightStrip.lineCount(captured, highlights, width);
  final reserved =
      lines * chipRowHeight(captured) + (lines - 1) * kChipRunSpacing;
  final actual = tester.getSize(find.byKey(key)).height;

  // Returned as a pair through an expect so a failure names both numbers.
  expect(
    actual,
    lessThanOrEqualTo(reserved + 0.5),
    reason:
        'Chips rendered $actual px tall but only $reserved px was reserved — '
        'the bottom row would be clipped by the grid cell.',
  );
  return actual;
}

void main() {
  group('HighlightStrip', () {
    testWidgets('renders every chip it is given, never a subset', (
      tester,
    ) async {
      final highlights = [
        _chip('4 W'),
        _chip('White'),
        _chip('290*180'),
        _chip('IP65'),
        _chip('50 / 60 Hz'),
      ];

      await _renderedHeight(tester, highlights, 160);

      // The whole point: five specs means five chips on the card.
      expect(find.byType(HighlightChip), findsNWidgets(highlights.length));
    });

    testWidgets('reserved height covers the render when chips wrap', (
      tester,
    ) async {
      // Deliberately narrow, so this cannot fit on one row.
      await _renderedHeight(tester, [
        _chip('40.5*79*340'),
        _chip('2 W'),
        _chip('Warm white'),
        _chip('Recessed ceiling'),
      ], 140);
    });

    testWidgets('reserved height covers a single short chip', (tester) async {
      await _renderedHeight(tester, [_chip('4 W')], 160);
      expect(find.byType(HighlightChip), findsOneWidget);
    });

    testWidgets('a chip wider than the card still renders', (tester) async {
      // A single value longer than the column. It cannot be split, so the
      // row simply overflows its width — but it must still be *drawn*, and
      // the reserved height must still hold it.
      await _renderedHeight(tester, [
        _chip('Extra long specification value that exceeds the column'),
      ], 120);
      expect(find.byType(HighlightChip), findsOneWidget);
    });
  });
}
