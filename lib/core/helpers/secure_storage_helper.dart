import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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

  static Future<void> delete({required String key}) async {
    try {
      await _storage.delete(key: key);
    } catch (e) {
      throw SecureStorageException('Faild to delete from Secure Storage:$e');
    }
  }

  static Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  /// Safely read a sensitive value from secure storage.
  /// Returns null if:
  /// - The key doesn't exist
  /// - The value is empty
  /// - There's an error reading from storage (security issue)
  ///
  /// Throws [SecureStorageException] if there's a critical storage failure.
  static Future<String?> readSafe({required String key}) async {
    try {
      final value = await _storage.read(key: key);
      if (value == null || value.isEmpty) {
        return null;
      }
      return value;
    } catch (e) {
      // Security concern: throw exception to indicate storage failure
      throw SecureStorageException(
        'Failed to read sensitive data from secure storage for key: $key. Error: $e',
      );
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
