import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:new_power/core/di/dependency_injection.dart';
import 'package:new_power/core/helpers/cache_helper.dart';
import 'package:new_power/core/localization/currency_manager.dart';
import 'package:new_power/core/localization/language_manager.dart';
import 'package:new_power/core/theming/theme_notifier.dart';
import 'package:new_power/features/projects/data/repo/projects_repository.dart';

/// Pins finding S3.
///
/// `MyApp.build` wraps the widget tree in two `ValueListenableBuilder`s that
/// capture `getIt<ThemeNotifier>()` and `getIt<LanguageManager>()` once, at
/// first build. `MyApp` is a `StatelessWidget` that nothing ever rebuilds, so
/// those references are held for the process lifetime.
///
/// When logout replaced the notifiers, the widgets kept listening to the
/// orphans: every `toggleTheme()` mutated an object nobody was watching, and
/// theme and language switching silently stopped working until the app was
/// killed. **Identity** is therefore the thing that has to hold — not merely
/// that a lookup still resolves.
void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await CacheHelper.init();
    await setupCoreSingletons();
    await setupGetIt();
  });

  tearDown(() async {
    await getIt.reset();
  });

  test('resetGetIt keeps the very same notifier instances', () async {
    final theme = getIt<ThemeNotifier>();
    final language = getIt<LanguageManager>();
    final currency = getIt<CurrencyManager>();

    await resetGetIt();

    expect(identical(getIt<ThemeNotifier>(), theme), isTrue,
        reason: 'ThemeNotifier was replaced — MyApp is still listening to the '
            'old instance, so theme switching is now dead.');
    expect(identical(getIt<LanguageManager>(), language), isTrue,
        reason: 'LanguageManager was replaced — language switching is dead.');
    expect(identical(getIt<CurrencyManager>(), currency), isTrue);
  });

  test('resetGetIt does replace session-scoped objects', () async {
    final repo = getIt<ProjectsRepository>();

    await resetGetIt();

    expect(identical(getIt<ProjectsRepository>(), repo), isFalse,
        reason: 'A session-scoped repository survived logout, so the next '
            'user would inherit the previous one\'s cached state.');
  });

  test('a preference set before logout is still observable after it', () async {
    final theme = getIt<ThemeNotifier>();
    await theme.setDarkMode();

    await resetGetIt();

    // Same object, same value — this is what the UI depends on.
    expect(getIt<ThemeNotifier>().value, theme.value);
  });

  test('resetGetIt is safe to call twice in a row', () async {
    await resetGetIt();
    await resetGetIt();
    expect(getIt.isRegistered<ProjectsRepository>(), isTrue);
    expect(getIt.isRegistered<ThemeNotifier>(), isTrue);
  });
}
