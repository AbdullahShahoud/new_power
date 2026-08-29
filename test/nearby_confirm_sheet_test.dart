import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:new_power/core/helpers/bottom_sheet_helper.dart';
import 'package:new_power/core/localization/app_localizations.dart';
import 'package:new_power/core/theming/app_themes.dart';
import 'package:new_power/core/theming/brand.dart';
import 'package:new_power/features/projects/data/models/enums.dart';
import 'package:new_power/features/projects/data/models/nearby_project_card_view.dart';

/// The pre-registration duplicate sheet has now broken twice in the same
/// place, both times only on a **long** list:
///
///   1. A nested `ListView` inside the helper's scroll wrapper swallowed
///      every drag, so the buttons below could not be scrolled to.
///   2. The helper handed its non-flex child the sheet's full height, so
///      the content plus the grabber and trailing spacer overflowed the
///      Column — "A RenderFlex overflowed by 213 pixels on the bottom".
///
/// Both failures share a shape: fine with two candidates, broken with ten.
/// So the test drives ten, and asserts the two things a rep actually needs —
/// no overflow, and both buttons on screen and tappable.
NearbyProjectCardView _candidate(int i) => NearbyProjectCardView(
  name: 'Building number $i on a deliberately long street name',
  buildingType: BuildingType.apartmentBuilding,
  description: 'A neighbouring building used as a layout fixture.',
  latitude: 24.7 + i * 0.0001,
  longitude: 46.7 + i * 0.0001,
  constructionPhase: ConstructionPhase.structure,
  stage: ProjectStage.lead,
  status: ProjectStatus.active,
  owner: const NearbyOwnerRefView(firstName: 'Layla', lastName: 'Haddad'),
  distanceM: 20.0 * i,
  isYours: i.isEven,
);

/// Pumps a host that opens the sheet, mirroring how the register screen
/// calls it — including `useScrollWrapper: false`, which is the setting the
/// layout depends on.
Future<bool?> _openSheet(WidgetTester tester, int count) async {
  bool? result;
  late BuildContext hostContext;

  await tester.pumpWidget(
    ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      child: MaterialApp(
        // Themes are per-brand now; this sheet is brand-agnostic, so any
        // brand renders it identically.
        theme: AppThemes.light(Brand.newPower),
        locale: const Locale('en', 'US'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [AppLocalizationsDelegate()],
        home: Builder(
          builder: (context) {
            hostContext = context;
            return const Scaffold(body: SizedBox.shrink());
          },
        ),
      ),
    ),
  );

  // ScreenUtilInit defers building its child, so the Builder above has not
  // run yet after a single pumpWidget and `hostContext` is still unset.
  await tester.pumpAndSettle();

  // The sheet widget is private to register_project_screen, so this drives
  // the helper with an equivalent body: header, a long scrolling list, and
  // two pinned buttons. What is under test is the helper's layout contract,
  // which is where both bugs actually lived.
  showConfirmSheet(hostContext, count).then((value) => result = value);
  await tester.pumpAndSettle();
  return result;
}

Future<bool?> showConfirmSheet(BuildContext context, int count) {
  return showAnimatedBottomSheet<bool>(
    context: context,
    useScrollWrapper: false,
    initialChildSize: 0.65,
    maxChildSize: 0.9,
    builder: (sheetContext) => Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Is this building already registered?'),
        Flexible(
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: count,
            separatorBuilder: (_, _) => const SizedBox(height: 10),
            itemBuilder: (_, index) => SizedBox(
              height: 76,
              child: Text(_candidate(index).name),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.of(sheetContext).pop(false),
                child: const Text('Go back and check'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => Navigator.of(sheetContext).pop(true),
                child: const Text('This is a different building'),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

void main() {
  testWidgets('a long candidate list does not overflow the sheet', (
    tester,
  ) async {
    await _openSheet(tester, 10);

    // takeException() returns the FlutterError a RenderFlex overflow throws
    // during layout. Null means the frame laid out cleanly.
    expect(
      tester.takeException(),
      isNull,
      reason: 'The sheet overflowed with 10 candidates.',
    );
  });

  testWidgets('both buttons stay on screen with a long list', (tester) async {
    await _openSheet(tester, 10);

    // Not just "in the widget tree" — `findsOneWidget` would pass for a
    // button sitting below the bottom edge. hitTestable() is what proves a
    // rep can actually reach it.
    expect(
      find.text('Go back and check').hitTestable(),
      findsOneWidget,
      reason: 'Cancel was pushed off the bottom of the sheet.',
    );
    expect(
      find.text('This is a different building').hitTestable(),
      findsOneWidget,
      reason: 'Proceed was pushed off the bottom of the sheet.',
    );
  });

  testWidgets('a short list still renders and both buttons work', (
    tester,
  ) async {
    await _openSheet(tester, 2);
    expect(tester.takeException(), isNull);

    await tester.tap(find.text('Go back and check'));
    await tester.pumpAndSettle();

    // Sheet dismissed — the loose Flexible did not break the tap target.
    expect(find.text('Go back and check'), findsNothing);
  });
}
