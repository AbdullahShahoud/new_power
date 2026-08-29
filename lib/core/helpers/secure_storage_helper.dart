import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'cache_helper.dart';

/// Wrapper around [FlutterSecureStorage] for **sensitive** credentials only.
///
/// Non-sensitive preferences (theme, language, onboarding flags, rate-limit
/// counters) belong in [CacheHelper] / SharedPreferences instead.
class SecureStorageHelper {
  SecureStorageHelper._();

  // ── Sensitive key constants ─────────────────────────────────────────────────
  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refreshToken';
  // Client-generated device fingerprint (auth.md's DeviceInfo.deviceId),
  // sent inline on register/login and as the X-Device-Id header afterwards.
  static const String deviceId = 'deviceId';
  // Handle returned by register/login/verify-otp for the next verify-otp call.
  static const String verificationId = 'verificationId';
  static const String accessTokenExpiresAt = 'accessTokenExpiresAt';
  static const String refreshTokenExpiresAt = 'refreshTokenExpiresAt';

  // ── Storage instance ────────────────────────────────────────────────────────
  static const FlutterSecureStorage _storage = FlutterSecureStorage(
    // Android: wrap in EncryptedSharedPreferences (AES-256)
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    // iOS: make data available as soon as the device is first unlocked,
    // so background tasks can still read tokens after a reboot.
    // iOS: restrict to this device only — prevents credential migration via
    // iCloud backup or device transfer (required for financial app data).
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  /// Purges credentials left behind by a **previous installation**.
  ///
  /// Call once, before anything reads a token — `main()` does this ahead of
  /// `AppStartupRouter.resolve()`.
  ///
  /// On iOS the Keychain is not part of the app container and survives
  /// deletion of the app. Reinstalling therefore hands the new install the
  /// previous user's `refreshToken`, `accessToken` and `deviceId`, and
  /// `AppStartupRouter` restores straight to the home screen as them — no
  /// login, no consent. On a shared or resold handset that is somebody
  /// else's session. Android clears app storage on uninstall, so this is a
  /// no-op there, but it runs on both platforms so the behaviour is one
  /// thing rather than two.
  ///
  /// The marker lives in SharedPreferences precisely *because* it does not
  /// survive uninstall: "the flag is missing but the keychain is populated"
  /// is exactly the signal that the app was reinstalled. Keeping the marker
  /// in secure storage would make it survive too, and detect nothing.
  ///
  /// [CacheHelper.init] must have run first.
  static Future<void> purgeIfFreshInstall() async {
    const String marker = CacheHelper.secureStorageInitialised;
    final alreadyInitialised =
        CacheHelper.getData(key: marker) as bool? ?? false;
    if (alreadyInitialised) return;

    try {
      await _storage.deleteAll();
    } catch (e) {
      // A keychain that cannot be cleared is the same class of problem as
      // one that cannot be read: readSafe() degrades every key to "absent",
      // so the user lands on login either way.
      debugPrint('[SecureStorage] fresh-install purge failed: $e');
    }
    await CacheHelper.saveData(key: marker, value: true);
  }

  // ── CRUD ────────────────────────────────────────────────────────────────────

  static Future<void> save({required String key, required String value}) async {
    try {
      await _storage.write(key: key, value: value);
    } catch (e) {
      throw SecureStorageException('Faild to Write to Secure Storage:$e');
    }
  }

  // static Future<String?> read({required String key}) async {
  //   return _storage.read(key: key);
  // }

  /// Deletes a key, tolerating a storage failure.
  ///
  /// Deliberately does not throw. The callers are all teardown paths —
  /// `AuthService._clearLocalSession`, `DioFactory._clearAuthTokens` — and
  /// they delete several keys in sequence. A throw part-way through aborts
  /// the rest, so a user whose keystore is unhappy could not complete a
  /// logout even though the server had already revoked the session, leaving
  /// the app locally "signed in" to nothing.
  ///
  /// [save] still throws: a credential that cannot be persisted is a real
  /// failure the caller must see. Removal failing is not.
  static Future<void> delete({required String key}) async {
    try {
      await _storage.delete(key: key);
    } catch (e) {
      debugPrint('[SecureStorage] delete failed for "$key", continuing: $e');
    }
  }

  static Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  /// Safely read a sensitive value from secure storage.
  ///
  /// Returns `null` when the key is absent, the value is empty, **or the
  /// read fails**.
  ///
  /// ⚠️ This used to rethrow as [SecureStorageException] on a read failure.
  /// That looked like the careful choice and was the opposite: `null` here
  /// means "no session", which every caller already handles by sending the
  /// user to login. A throw, by contrast, escapes into
  /// `AppStartupRouter.resolve()`'s catch-all — which routes to
  /// `startupError` on every launch — and into `DioFactory`'s `onRequest`
  /// interceptor, which fails every request before it is sent. Neither has
  /// an in-app recovery path.
  ///
  /// A read can fail for reasons that have nothing to do with an attacker:
  /// a restored EncryptedSharedPreferences blob whose keystore master key
  /// did not migrate, keystore corruption after an OS update, or a device
  /// whose keystore is temporarily unavailable before first unlock.
  /// Degrading those to a re-login is correct; bricking the install is not.
  ///
  /// A corrupt entry is deleted on the way out so the failure does not
  /// repeat on every subsequent read.
  static Future<String?> readSafe({required String key}) async {
    try {
      final value = await _storage.read(key: key);
      if (value == null || value.isEmpty) {
        return null;
      }
      return value;
    } catch (e) {
      debugPrint(
        '[SecureStorage] unreadable entry for "$key" — treating as absent: $e',
      );
      // Best-effort cleanup; if this throws too, the read still reports
      // "absent", which is the outcome the caller needs.
      try {
        await _storage.delete(key: key);
      } catch (_) {}
      return null;
    }
  }
}

/// Exception thrown when secure storage operations fail.
/// This indicates a critical security issue that requires logout.
class SecureStorageException implements Exception {
  final String message;
  SecureStorageException(this.message);

  @override
  String toString() => 'SecureStorageException: $message';
}
