import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../../core/routing/routes.dart';
import '../../logic/badge_cubit/unread_badge_cubit.dart';
import 'notifications_repository.dart';

/// Fired for a data message while the app is terminated or backgrounded.
///
/// Must be a **top-level** function — Android spins up a separate isolate
/// with no access to the running app's state, so anything captured from a
/// closure would not exist there.
///
/// Deliberately does almost nothing: the badge and the inbox are refreshed
/// when the app next resumes, and this isolate has neither a token store nor
/// a Dio instance wired. The tray notification is rendered by the system
/// from the message's own `notification` block, not from here.
@pragma('vm:entry-point')
Future<void> firebaseBackgroundHandler(RemoteMessage message) async {
  // Initialising Firebase is required before touching any plugin API in a
  // background isolate, even when nothing else is done with it.
  await Firebase.initializeApp();
}

/// The FCM lifecycle: token registration, channels, foreground presentation
/// and tap routing.
///
/// ⚠️ Push is an **accelerator, never a source of truth**. Delivery has three
/// independent silent-failure points server-side (Firebase not initialised,
/// no registered tokens, a throw swallowed by the sender), and every one of
/// them returns success to the producer. So nothing here is allowed to be
/// the only path to a piece of state — the inbox and the badge are always
/// refreshed on resume regardless of whether a push arrived.
class PushService {
  final NotificationsRepository _repository;
  final UnreadBadgeCubit _badge;
  final GlobalKey<NavigatorState> _navigatorKey;

  PushService(this._repository, this._badge, this._navigatorKey);

  final _localNotifications = FlutterLocalNotificationsPlugin();

  StreamSubscription<RemoteMessage>? _onMessage;
  StreamSubscription<String>? _onTokenRefresh;
  bool _initialised = false;

  /// Security events get their own high-importance channel so a
  /// "your password was changed" alert is not silently batched with routine
  /// traffic. The server sets no `channel_id`, so this is entirely ours.
  static const _securityChannel = AndroidNotificationChannel(
    'newpower_security',
    'Security alerts',
    description: 'Password changes, sign-ins and account status.',
    importance: Importance.high,
  );

  static const _generalChannel = AndroidNotificationChannel(
    'newpower_general',
    'General',
    description: 'Account updates and announcements.',
    importance: Importance.defaultImportance,
  );

  /// Call once after login, and again on every app start.
  ///
  /// ⚠️ Registration is **not** a first-login-only step: when Firebase
  /// reports a token as unregistered the backend nulls the stored value, so
  /// a reinstalled app silently stops receiving push until it re-registers.
  Future<void> initialise() async {
    if (_initialised) return;

    try {
      // The whole feature is optional. A device without Play Services, a
      // desktop target, or a misconfigured project must degrade to "no
      // push" — never to a crash on a screen the rep was trying to use.
      await _configureChannels();
      await _requestPermission();
      await _registerToken();

      _onMessage = FirebaseMessaging.onMessage.listen(_onForegroundMessage);
      _onTokenRefresh = FirebaseMessaging.instance.onTokenRefresh.listen(
        (token) => _repository.registerFcmToken(token),
      );
      FirebaseMessaging.onMessageOpenedApp.listen(_handleTap);

      // A push that launched the app from cold start is not delivered to
      // `onMessageOpenedApp` — it is waiting here instead.
      final initial = await FirebaseMessaging.instance.getInitialMessage();
      if (initial != null) _handleTap(initial);

      _initialised = true;
    } catch (error, stack) {
      // Swallowed on purpose. See the class doc: push is an accelerator.
      debugPrint('[push] initialisation skipped: $error');
      debugPrintStack(stackTrace: stack);
    }
  }

  /// Called on logout, **before** `POST /auth/logout`.
  ///
  /// ⚠️ The order is load-bearing: clearing the token needs a valid access
  /// token, so doing it after logout fails and the device keeps receiving
  /// pushes for an account that is no longer signed in.
  Future<void> dispose() async {
    await _onMessage?.cancel();
    await _onTokenRefresh?.cancel();
    _onMessage = null;
    _onTokenRefresh = null;
    _initialised = false;
    await _repository.deleteFcmToken();
    try {
      await FirebaseMessaging.instance.deleteToken();
    } catch (_) {
      // Local deletion failing does not matter — the server binding is
      // already gone, which is what stops the pushes.
    }
  }

  Future<void> _configureChannels() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = DarwinInitializationSettings(
      // The foreground presentation is handled in Dart so it can be shown
      // in Arabic; letting iOS present it would show the server's English.
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    await _localNotifications.initialize(
      const InitializationSettings(android: android, iOS: ios),
      onDidReceiveNotificationResponse: (response) {
        final id = response.payload;
        _openInbox(notificationId: id != null && id.isNotEmpty ? id : null);
      },
    );

    final androidPlugin = _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    await androidPlugin?.createNotificationChannel(_securityChannel);
    await androidPlugin?.createNotificationChannel(_generalChannel);
  }

  Future<void> _requestPermission() async {
    await FirebaseMessaging.instance.requestPermission();
    // iOS would otherwise render the OS banner itself, in English, on top of
    // the in-app one. Suppressed so the foreground path has a single owner.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: false,
          badge: true,
          sound: false,
        );
  }

  Future<void> _registerToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    if (token == null || token.isEmpty) return;
    await _repository.registerFcmToken(token);
  }

  /// Foreground: the OS notification is suppressed and an in-app one is
  /// shown instead. This is the **only** place a push can be localised —
  /// a backgrounded push is rendered by the system straight from the
  /// server's English `notification.title`/`body`, which no client work can
  /// change.
  Future<void> _onForegroundMessage(RemoteMessage message) async {
    // A push means the server already invalidated its unread-count cache,
    // so this read is guaranteed fresh rather than racing the write.
    await _badge.refresh();

    final notification = message.notification;
    if (notification == null) return;

    final isSecurity = message.data['type'] == 'SECURITY';
    final channel = isSecurity ? _securityChannel : _generalChannel;

    await _localNotifications.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          importance: channel.importance,
          priority: isSecurity ? Priority.high : Priority.defaultPriority,
          icon: '@mipmap/ic_launcher',
        ),
        iOS: const DarwinNotificationDetails(),
      ),
      // All FCM `data` values arrive as strings.
      payload: message.data['notificationId'] as String?,
    );
  }

  void _handleTap(RemoteMessage message) {
    _badge.refresh();
    _openInbox(notificationId: message.data['notificationId'] as String?);
  }

  /// ⚠️ Routes on `notificationId`, never on `data.type`. `SECURITY` covers
  /// six unrelated events with no shared destination, so branching on the
  /// type would send a suspended-account alert to the same screen as a
  /// 2FA confirmation.
  ///
  /// The id is currently only used to decide *that* the inbox should open —
  /// the list is not deep-scrolled to it, because a single-row fetch route
  /// does not exist and the row may be on any page.
  void _openInbox({String? notificationId}) {
    final navigator = _navigatorKey.currentState;
    if (navigator == null) return;
    navigator.pushNamed(Routes.notificationsScreen);
  }
}
