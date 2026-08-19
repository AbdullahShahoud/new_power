// Regression test for a *high severity* RTL bug in the product filter sheet.
//
// `RangeSlider` mirrors itself under RTL — min anchors right, max anchors
// left. The label row beneath it used to carry its own
// `Directionality(ltr)`, so in Arabic the track ran one way and the numbers
// under it ran the other. The same pixels then meant opposite things in the
// two locales, and a rep could apply the inverse of the filter they picked.
//
// The invariant this locks in: the slider and its axis labels resolve to the
// **same** text direction, and that direction is LTR (a numeric measurement
// scale reads low-to-high left-to-right in both locales).

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:new_power/core/localization/app_localizations.dart';
import 'package:new_power/features/catalog/data/models/catalog_enums.dart';
import 'package:new_power/features/catalog/data/models/filter_view.dart';
import 'package:new_power/features/catalog/data/models/localized.dart';
import 'package:new_power/features/catalog/data/models/product_query.dart';
import 'package:new_power/features/catalog/ui/widgets/filters_sheet.dart';

final _luminousFlux = FilterView(
  code: 'LUMINOUS_FLUX',
  label: const Localized(en: 'Luminous flux', ar: 'شدة الإضاءة'),
  type: AttributeType.number,
  strategy: FilterStrategy.range,
  unit: 'lm',
  range: const FilterRange(min: 500, max: 3600),
  count: 12,
);

Future<void> _openSheet(WidgetTester tester, Locale locale) async {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  await tester.pumpWidget(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        locale: locale,
        localizationsDelegates: const [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (context) => Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: () => showFiltersSheet(
                  context: context,
                  filters: [_luminousFlux],
                  query: const ProductQuery(),
                  resultCount: 12,
                ),
                child: const Text('open'),
              ),
            ),
          ),
        ),
      ),
    ),
  );

  // ScreenUtilInit initialises asynchronously, so the subtree is not in the
  // tree on the first frame.
  await tester.pumpAndSettle();
  await tester.tap(find.text('open'));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('slider and its axis labels share one direction in Arabic', (
    tester,
  ) async {
    await _openSheet(tester, const Locale('ar', 'SY'));

    final slider = find.byType(RangeSlider);
    expect(slider, findsOneWidget, reason: 'RANGE strategy must render a slider');

    // The bounds label — the one that used to disagree with the track.
    final minLabel = find.text('500');
    expect(minLabel, findsOneWidget);

    final sliderDirection = Directionality.of(tester.element(slider));
    final labelDirection = Directionality.of(tester.element(minLabel));

    expect(
      sliderDirection,
      labelDirection,
      reason: 'track and labels must not point in opposite directions',
    );
    expect(
      sliderDirection,
      TextDirection.ltr,
      reason: 'a numeric measurement scale stays low-to-high left-to-right',
    );
  });

  testWidgets('the section heading still reads RTL in Arabic', (tester) async {
    await _openSheet(tester, const Locale('ar', 'SY'));

    // The heading is deliberately *outside* the LTR scope, so the sheet
    // still reads right-to-left everywhere except the measurement axis.
    final heading = find.text('شدة الإضاءة');
    expect(heading, findsOneWidget);
    expect(Directionality.of(tester.element(heading)), TextDirection.rtl);
  });

  testWidgets('English renders the same axis, so both locales agree', (
    tester,
  ) async {
    await _openSheet(tester, const Locale('en', 'US'));

    final slider = find.byType(RangeSlider);
    final minLabel = find.text('500');
    expect(
      Directionality.of(tester.element(slider)),
      Directionality.of(tester.element(minLabel)),
    );
    expect(Directionality.of(tester.element(slider)), TextDirection.ltr);
  });
}
