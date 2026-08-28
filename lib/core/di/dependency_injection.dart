import 'package:get_it/get_it.dart';

import '../../features/auth/data/repo/auth_repository.dart';
import '../../features/catalog/data/repo/catalog_repository.dart';
import '../../features/catalog/logic/categories_bloc/categories_bloc.dart';
import '../../features/catalog/logic/product_detail_bloc/product_detail_bloc.dart';
import '../../features/catalog/logic/products_bloc/products_bloc.dart';
import '../../features/catalog/logic/search_bloc/search_bloc.dart';
import '../../features/notifications/data/repo/notifications_repository.dart';
import '../../features/notifications/data/repo/push_service.dart';
import '../../features/notifications/logic/badge_cubit/unread_badge_cubit.dart';
import '../../features/targets/data/repo/targets_repository.dart';
import '../../features/targets/logic/my_targets_cubit.dart';
import '../../features/targets/logic/year_targets_cubit.dart';
import '../../features/auth/logic/email_verification_cubit/email_verification_cubit.dart';
import '../../features/auth/logic/forgot_password_cubit/forgot_password_cubit.dart';
import '../../features/auth/logic/login_cubit/login_cubit.dart';
import '../../features/auth/logic/register_cubit/register_cubit.dart';
import '../../features/projects/data/local/offline_queue_store.dart';
import '../../features/projects/data/repo/activities_repository.dart';
import '../../features/projects/data/repo/file_repository.dart';
import '../../features/projects/data/repo/projects_repository.dart';
import '../../features/projects/data/repo/outcomes_repository.dart';
import '../../features/projects/data/repo/stakeholders_repository.dart';
import '../../features/projects/logic/accounts_bloc/accounts_bloc.dart';
import '../../features/projects/logic/activities_bloc/activities_bloc.dart';
import '../../features/projects/logic/file_upload_bloc/file_upload_bloc.dart';
import '../../features/projects/logic/offline_sync_bloc/offline_sync_bloc.dart';
import '../../features/projects/logic/outcomes_bloc/outcomes_bloc.dart';
import '../../features/projects/logic/projects_bloc/projects_bloc.dart';
import '../../features/projects/logic/stakeholders_bloc/stakeholders_bloc.dart';
import '../../features/user/data/repo/user_repository.dart';
import '../../features/user/logic/account_settings_cubit/account_settings_cubit.dart';
import '../localization/currency_manager.dart';
import '../localization/language_manager.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';
import '../routing/navigation_key.dart';
import '../services/auth_service.dart';
import '../theming/theme_notifier.dart';

final getIt = GetIt.instance;

/// App-lifetime singletons — registered **once**, from `main()`, and
/// deliberately left alone by [resetGetIt].
///
/// These three back `ValueListenableBuilder`s in `MyApp.build`, which capture
/// the notifier instance at first build and hold it for the life of the
/// widget. `MyApp` is a `StatelessWidget` with no parent that ever rebuilds
/// it, so nothing re-reads `getIt<ThemeNotifier>()` after startup.
///
/// When these lived in [setupGetIt], logging out replaced all three: the
/// widgets kept listening to the orphaned originals while every
/// `toggleTheme()` / `setLanguage()` call mutated the new ones. Theme and
/// language switching silently stopped working after the first logout and
/// only came back on a cold start.
///
/// A session teardown has no business touching display preferences anyway —
/// they are user settings persisted in `CacheHelper`, not session state.
Future<void> setupCoreSingletons() async {
  // Theme Notifier (singleton for global theme state)
  getIt.registerLazySingleton<ThemeNotifier>(() => ThemeNotifier());

  // Language Manager (singleton for global language state)
  getIt.registerLazySingleton<LanguageManager>(() => LanguageManager());

  // Preferred display currency
  getIt.registerLazySingleton<CurrencyManager>(() => CurrencyManager());
}

/// Name of the get_it scope holding everything tied to one signed-in session.
///
/// A scope rather than per-type unregistration: dropping a scope disposes
/// exactly what was registered inside it and leaves the base scope — the
/// [setupCoreSingletons] instances — physically untouched. Re-registering
/// them after a `reset()` would not do: that constructs *new* notifiers, and
/// the widgets are holding the old ones, which is the whole bug.
const String _sessionScope = 'session';

/// Session-scoped graph: repositories, services and Blocs. Torn down and
/// rebuilt by [resetGetIt] on logout so no previous user's state survives.
Future<void> setupGetIt() async {
  getIt.pushNewScope(scopeName: _sessionScope);

  // ========================== Core ==========================

  // Auth Dio: register, login, verify-otp, refresh, logout, me,
  // forgot/reset-password (see DioFactory).
  final authDio = DioFactory.getAuthDio();
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(authDio),
    instanceName: 'authApiService',
  );

  // App Dio: everything future (KYC, wallet, territories, ...). Not consumed
  // yet, but ready for the next feature module.
  final appDio = DioFactory.getAppDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(appDio));

  // ThemeNotifier, LanguageManager and CurrencyManager are **not** registered
  // here — see setupCoreSingletons() above for why moving them out was
  // necessary.

  // ========================== Auth ==========================

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(getIt<ApiService>(instanceName: 'authApiService')),
  );
  getIt.registerLazySingleton<AuthService>(
    () => AuthService(getIt<ApiService>(instanceName: 'authApiService')),
  );

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<AuthRepository>()));
  getIt.registerFactory<RegisterCubit>(
    () => RegisterCubit(getIt<AuthRepository>()),
  );
  getIt.registerFactory<ForgotPasswordCubit>(
    () => ForgotPasswordCubit(getIt<AuthRepository>()),
  );
  getIt.registerFactory<EmailVerificationCubit>(
    () => EmailVerificationCubit(getIt<AuthRepository>()),
  );

  // ========================== Projects (Phase 1) ==========================
  // Both repositories sit on the same appDio-backed ApiService singleton
  // registered above — DioFactory.getAppDio() was built for exactly this
  // ("everything future"). FileRepository additionally takes the raw Dio
  // instance directly for the one call that needs upload progress (see the
  // note in api_service.dart).
  getIt.registerLazySingleton<FileRepository>(
    () => FileRepository(appDio, getIt<ApiService>()),
  );
  getIt.registerLazySingleton<ProjectsRepository>(
    () => ProjectsRepository(getIt<ApiService>()),
  );

  getIt.registerFactory<FileUploadBloc>(
    () => FileUploadBloc(getIt<FileRepository>()),
  );
  getIt.registerFactory<ProjectsBloc>(
    () => ProjectsBloc(getIt<ProjectsRepository>()),
  );

  // ========================== Projects (Phase 2) ==========================
  getIt.registerLazySingleton<ActivitiesRepository>(
    () => ActivitiesRepository(getIt<ApiService>()),
  );
  getIt.registerFactory<ActivitiesBloc>(
    () => ActivitiesBloc(getIt<ActivitiesRepository>()),
  );

  // ========================== Projects (Phase 3) ==========================
  getIt.registerLazySingleton<OutcomesRepository>(
    () => OutcomesRepository(getIt<ApiService>()),
  );
  getIt.registerFactory<OutcomesBloc>(
    () => OutcomesBloc(getIt<OutcomesRepository>()),
  );

  // ========================== Projects (Phase 4) ==========================
  // OfflineSyncBloc is a lazy singleton, not a per-screen factory — the
  // queue has to exist and be syncable app-wide (main.dart's connectivity
  // listener, the log-activity screen's enqueue, the queue viewer screen)
  // regardless of which screen is currently open.
  getIt.registerLazySingleton<OfflineQueueStore>(() => OfflineQueueStore());
  getIt.registerLazySingleton<OfflineSyncBloc>(
    () => OfflineSyncBloc(
      getIt<OfflineQueueStore>(),
      getIt<ActivitiesRepository>(),
    ),
  );

  // ========================== Projects (Phase 6) ==========================
  // stakeholders.md. One repository, two Blocs split by UI usage:
  // AccountsBloc backs the account/contact pickers, StakeholdersBloc backs
  // a project's stakeholder-link/decision-maker sections.
  getIt.registerLazySingleton<StakeholdersRepository>(
    () => StakeholdersRepository(getIt<ApiService>()),
  );
  getIt.registerFactory<AccountsBloc>(
    () => AccountsBloc(getIt<StakeholdersRepository>()),
  );
  getIt.registerFactory<StakeholdersBloc>(
    () => StakeholdersBloc(getIt<StakeholdersRepository>()),
  );

  // ============================ Catalogue ================================
  // catalog-mobile-integration.md. Read-only and shared master data — no
  // per-user scoping, so a single repository over the default appDio
  // instance is all the surface needs.
  //
  // Every Bloc is a factory, as elsewhere in the app. The session cache
  // §19.4 asks for lives in the repository singleton instead — a Bloc handed
  // to `BlocProvider(create:)` is closed when its screen pops, so a
  // long-lived one would be unusable after the first category screen.
  getIt.registerLazySingleton<CatalogRepository>(
    () => CatalogRepository(getIt<ApiService>()),
  );
  getIt.registerFactory<CategoriesBloc>(
    () => CategoriesBloc(getIt<CatalogRepository>()),
  );
  getIt.registerFactory<ProductsBloc>(
    () => ProductsBloc(getIt<CatalogRepository>()),
  );
  getIt.registerFactory<ProductDetailBloc>(
    () => ProductDetailBloc(getIt<CatalogRepository>()),
  );
  getIt.registerFactory<SearchBloc>(
    () => SearchBloc(getIt<CatalogRepository>()),
  );

  // ========================== Notifications ==============================
  // notifications-mobile-integration.md. `UnreadBadgeCubit` is a **lazy
  // singleton** on purpose: the badge appears in more than one place and
  // both must read one state object, or the bell and the inbox drift apart
  // and each spends a request answering the same question.
  //
  // `InboxBloc` stays per-screen (constructed at the BlocProvider) so its
  // pending-archive timers die with the screen.
  getIt.registerLazySingleton<NotificationsRepository>(
    () => NotificationsRepository(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<UnreadBadgeCubit>(
    () => UnreadBadgeCubit(getIt<NotificationsRepository>()),
  );
  // Holds the FCM token lifecycle and the tap routing. A singleton because
  // it owns stream subscriptions that must outlive any one screen, and
  // because `dispose()` on logout has to reach the same instance that
  // registered the token.
  getIt.registerLazySingleton<PushService>(
    () => PushService(
      getIt<NotificationsRepository>(),
      getIt<UnreadBadgeCubit>(),
      navigatorKey,
    ),
  );

  // ========================== User self-service ==========================
  // users.md `/users/me/*`. Sits on the authApiService instance: these are
  // identity routes, same as `/auth/me`, not feature data.
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepository(getIt<ApiService>(instanceName: 'authApiService')),
  );
  getIt.registerFactory<AccountSettingsCubit>(
    () => AccountSettingsCubit(getIt<UserRepository>()),
  );
}

/// Drops the session scope and builds a fresh one, leaving the app-lifetime
/// singletons from [setupCoreSingletons] in place.
///
/// ⚠️ `await`ed throughout, and its caller awaits it too. It used to call
/// `setupGetIt()` without `await` from inside an `async` function, so
/// `AuthService.logout()` could return — and the login screen could start
/// resolving dependencies — while re-registration was still in flight.
Future<void> resetGetIt() async {
  if (getIt.hasScope(_sessionScope)) {
    await getIt.dropScope(_sessionScope);
  }
  await setupGetIt();
}
