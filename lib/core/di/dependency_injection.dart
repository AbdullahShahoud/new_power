import 'package:get_it/get_it.dart';

import '../../features/auth/data/repo/auth_repository.dart';
import '../../features/auth/logic/email_verification_cubit/email_verification_cubit.dart';
import '../../features/auth/logic/forgot_password_cubit/forgot_password_cubit.dart';
import '../../features/auth/logic/login_cubit/login_cubit.dart';
import '../../features/auth/logic/register_cubit/register_cubit.dart';
import '../localization/currency_manager.dart';
import '../localization/language_manager.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';
import '../services/auth_service.dart';
import '../theming/theme_notifier.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
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

  // Theme Notifier (singleton for global theme state)
  getIt.registerLazySingleton<ThemeNotifier>(() => ThemeNotifier());

  // Language Manager (singleton for global language state)
  getIt.registerLazySingleton<LanguageManager>(() => LanguageManager());

  // Preferred display currency (singleton for the wallet card ordering)
  getIt.registerLazySingleton<CurrencyManager>(() => CurrencyManager());

  // ========================== Auth ==========================

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(getIt<ApiService>(instanceName: 'authApiService')),
  );
  getIt.registerLazySingleton<AuthService>(
    () => AuthService(getIt<ApiService>(instanceName: 'authApiService')),
  );

  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(getIt<AuthRepository>()),
  );
  getIt.registerFactory<RegisterCubit>(
    () => RegisterCubit(getIt<AuthRepository>()),
  );
  getIt.registerFactory<ForgotPasswordCubit>(
    () => ForgotPasswordCubit(getIt<AuthRepository>()),
  );
  getIt.registerFactory<EmailVerificationCubit>(
    () => EmailVerificationCubit(getIt<AuthRepository>()),
  );
}

Future<void> resetGetIt() async {
  await getIt.reset(dispose: true);
  setupGetIt();
}
