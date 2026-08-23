import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/config/feature_flags.dart';
import 'core/di/dependency_injection.dart';
import 'core/helpers/cache_helper.dart';
import 'core/localization/app_localizations.dart';
import 'core/localization/language_manager.dart';
import 'core/routing/app_router.dart';
import 'core/routing/app_startup_router.dart';
import 'core/routing/navigation_key.dart';
import 'core/theming/app_themes.dart';
import 'core/theming/theme_notifier.dart';
import 'firebase_options.dart';
import 'features/notifications/data/repo/push_service.dart';
import 'features/projects/logic/offline_sync_bloc/offline_sync_bloc.dart';
import 'features/projects/logic/offline_sync_bloc/offline_sync_event.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Hive.initFlutter();
  await _initialiseFirebase();
  await setupGetIt();
  // Suspended — see `FeatureFlags.offlineSyncEnabled`. Left wired so the
  // feature comes back by flipping that one flag.
  if (FeatureFlags.offlineSyncEnabled) _wireOfflineSync();
  final initialRoute = await AppStartupRouter.resolve();
  runApp(MyApp(initialRoute: initialRoute));
}

/// Brings up Firebase and registers the background message handler.
///
/// Wrapped in a try/catch because **push is optional to the app running at
/// all**. A device without Play Services, a desktop target, or a config
/// mismatch must degrade to "no push" — the in-app inbox is the source of
/// truth and works regardless. A throw here would instead take down the
/// whole app before the first frame.
///
/// The background handler has to be registered in `main`, before
/// `runApp` — Android looks it up by entry point when it wakes the app for
/// a message, and a handler registered later simply never fires.
Future<void> _initialiseFirebase() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseMessaging.onBackgroundMessage(firebaseBackgroundHandler);
  } catch (error) {
    debugPrint('[push] Firebase unavailable, continuing without push: $error');
  }
}

/// Phase 4 (§10 Workflow 5) — drains the offline activity queue as soon as
/// the device is back online, in addition to the manual "Sync now" on
/// `offline_queue_screen.dart`. `OfflineSyncBloc` is a singleton (see its
/// doc comment) precisely so this app-level listener and every screen share
/// one queue. `syncRequested` is a safe no-op when the queue is already
/// empty or a sync is already running (`OfflineSyncBloc._onSyncRequested`).
void _wireOfflineSync() {
  final offlineSyncBloc = getIt<OfflineSyncBloc>();

  void trySync(List<ConnectivityResult> results) {
    if (results.any((r) => r != ConnectivityResult.none)) {
      offlineSyncBloc.add(const OfflineSyncEvent.syncRequested());
    }
  }

  Connectivity().checkConnectivity().then(trySync);
  Connectivity().onConnectivityChanged.listen(trySync);
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
