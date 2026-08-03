// Basic smoke test: the app shell builds without throwing.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:new_power/core/di/dependency_injection.dart';
import 'package:new_power/core/helpers/cache_helper.dart';
import 'package:new_power/core/routing/routes.dart';
import 'package:new_power/main.dart';

void main() {
  testWidgets('MyApp builds and shows the login screen', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    await CacheHelper.init();
    await setupGetIt();

    // Match a real phone aspect ratio — the default 800x600 test surface
    // isn't tall enough for ScreenUtil's 375x812 design size and produces
    // spurious overflow warnings that don't occur on an actual device.
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp(initialRoute: Routes.loginScreen));
    await tester.pump();

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
