// import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Wrapper around [SharedPreferences] for **non-sensitive** data only.
///
/// Sensitive credentials (tokens, device IDs, private keys) must use
/// [SecureStorageHelper] instead — never store secrets here.
class CacheHelper {
  CacheHelper._();

  // ── Non-sensitive key constants ─────────────────────────────────────────────
  static const String onBoarding = 'onBoarding';

  /// The product line this install runs as ([Brand.storageKey]).
  ///
  /// Absent means the picker has not been answered yet — the app routes
  /// there before anything else. Non-sensitive, so SharedPreferences is the
  /// right home; it also means a reinstall correctly asks again.
  static const String brand = 'brand';

  /// Set the first time the app runs after an install.
  ///
  /// Deliberately here and not in secure storage: SharedPreferences is wiped
  /// on uninstall, the iOS Keychain is not. "Marker absent but keychain
  /// populated" is what identifies a reinstall — see
  /// [SecureStorageHelper.purgeIfFreshInstall].
  static const String secureStorageInitialised = 'secureStorageInitialised';
  static const String themeMode = 'themeMode';
  static const String notifPermissionShown = 'notifPermissionShown';
  // SECURITY (#13): User-controlled privacy toggle — when true, the chat
  // cubit suppresses outgoing read receipts in conversations.
  static const String hideReadReceipts = 'hideReadReceipts';

  /// Grid vs list for the catalogue's category tree. A display preference,
  /// so it lives here rather than in secure storage.
  static const String catalogCategoryViewMode = 'catalogCategoryViewMode';

  // ── SharedPreferences instance ──────────────────────────────────────────────
  static SharedPreferences? sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool?> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return sharedPreferences?.setString(key, value);
    if (value is int) return sharedPreferences?.setInt(key, value);
    if (value is bool) return sharedPreferences?.setBool(key, value);
    if (value is double) return sharedPreferences?.setDouble(key, value);
    return sharedPreferences?.setStringList(key, value as List<String>);
  }

  static dynamic getData({required String key}) => sharedPreferences?.get(key);

  static Future<bool?> clearData() async => sharedPreferences?.clear();
}
