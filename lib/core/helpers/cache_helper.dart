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
  static const String themeMode = 'themeMode';
  static const String notifPermissionShown = 'notifPermissionShown';
  // SECURITY (#13): User-controlled privacy toggle — when true, the chat
  // cubit suppresses outgoing read receipts in conversations.
  static const String hideReadReceipts = 'hideReadReceipts';

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
