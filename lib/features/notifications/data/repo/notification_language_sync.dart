import 'package:flutter/foundation.dart';

import '../../../../core/localization/language_manager.dart';
import '../../../../core/networking/api_result.dart';
import '../models/notification_view.dart';
import 'notifications_repository.dart';

/// Keeps the server's notification language in step with the app's.
///
/// Notification text is **not** translated on the device and cannot be: a row
/// stores a template key plus its parameters, and the server renders it —
/// for the inbox on the way out, and for a push at delivery time — against
/// whatever `language` the reader's preference holds at that moment. So an
/// app running in Arabic with a server preference of `EN` produces Arabic
/// screens containing English notifications, which is what a rep sees today.
///
/// A background push is the case that makes this load-bearing rather than
/// cosmetic. Its tray text is rendered by the OS straight from the payload;
/// nothing in this app runs, so there is no point at which a client-side
/// translation could happen even in principle. The only lever is telling the
/// server which language to render in, before the push is sent.
///
/// Two triggers, both needed:
///
///  * **On every language change**, so switching in Settings takes effect
///    immediately rather than at next login.
///  * **Once per app start** (from `PushService.initialise`), which repairs
///    the drift this class was added to fix — every existing install has an
///    app language that was never reported, and a rep who never touches the
///    language switch would otherwise stay mismatched forever.
class NotificationLanguageSync {
  final NotificationsRepository _repository;
  final LanguageManager _languageManager;

  NotificationLanguageSync(this._repository, this._languageManager);

  /// Last value we successfully sent, so a rebuild or a redundant listener
  /// call does not spend a request re-stating it.
  NotificationLanguage? _lastSynced;

  bool _listening = false;

  /// Starts mirroring language changes. Safe to call more than once.
  ///
  /// Called after authentication — the endpoint is authenticated, and firing
  /// it from `main()` would 401 on every cold start before login.
  void start() {
    if (_listening) return;
    _listening = true;
    _languageManager.addListener(_onLanguageChanged);
  }

  void stop() {
    if (!_listening) return;
    _listening = false;
    _languageManager.removeListener(_onLanguageChanged);
    // Cleared so the next signed-in user re-reports their own language
    // rather than inheriting the previous session's "already synced".
    _lastSynced = null;
  }

  void _onLanguageChanged() => sync();

  /// Reports the app's current language, unless it is already known to match.
  ///
  /// Failure is swallowed. This is a background reconciliation: a rep who is
  /// offline, or whose token has just expired, must not be shown an error
  /// about a preference they did not knowingly change. The next language
  /// change or app start retries it.
  Future<void> sync() async {
    final language = _languageOf(_languageManager.value.languageCode);
    if (language == _lastSynced) return;

    final result = await _repository.updatePreferences(
      UpdateNotificationPreferencesRequest(language: language),
    );
    if (result is Success) {
      _lastSynced = language;
      debugPrint(
        '[notifications] language preference set to ${language.wireValue}',
      );
      return;
    }
    debugPrint('[notifications] language sync failed, will retry');
  }

  /// The app's two locales map one-to-one onto the API's `EN` / `AR`.
  /// Anything else is a locale this app cannot render either, so English is
  /// the honest fallback rather than an error.
  static NotificationLanguage _languageOf(String languageCode) =>
      languageCode.toLowerCase() == 'ar'
      ? NotificationLanguage.ar
      : NotificationLanguage.en;
}
