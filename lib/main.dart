import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/dependency_injection.dart';
import 'core/helpers/cache_helper.dart';
import 'core/localization/app_localizations.dart';
import 'core/localization/language_manager.dart';
import 'core/routing/app_router.dart';
import 'core/routing/app_startup_router.dart';
import 'core/routing/navigation_key.dart';
import 'core/theming/app_themes.dart';
import 'core/theming/theme_notifier.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await setupGetIt();
  final initialRoute = await AppStartupRouter.resolve();
  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: getIt<ThemeNotifier>(),
        builder: (context, themeMode, _) {
          return ValueListenableBuilder<Locale>(
            valueListenable: getIt<LanguageManager>(),
            builder: (context, locale, _) {
              return MaterialApp(
                navigatorKey: navigatorKey,
                debugShowCheckedModeBanner: false,
                title: 'NewPower',
                onGenerateRoute: AppRouter.generateRoute,
                initialRoute: initialRoute,
                theme: AppThemes.lightTheme,
                darkTheme: AppThemes.darkTheme,
                themeMode: themeMode,
                locale: locale,
                supportedLocales: AppLocalizations.supportedLocales,
                localizationsDelegates: const [
                  AppLocalizationsDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                localeResolutionCallback:
                    AppLocalizations.localeResolutionCallback,
              );
            },
          );
        },
      ),
    );
  }
}
