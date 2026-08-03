import 'package:flutter/material.dart';
import '../helpers/cache_helper.dart';

/// Holds the user's preferred display currency for the home wallet card.
/// When a currency is explicitly set, only that wallet is shown.
/// When no explicit preference is set, all wallets are shown.
class CurrencyManager extends ValueNotifier<String> {
  static const String _key = 'preferred_currency';
  static const String _preferenceEnabledKey = 'currency_preference_enabled';
  static const String defaultCurrency = 'USD';

  bool _preferenceEnabled = false;

  /// All currencies the user can pick from in Profile → App Preferences.
  /// Mirrors the set of wallet currencies the backend supports.
  static const List<String> supported = [
    'USD',
    'EUR',
    'GBP',
    'SYP',
    'AED',
    'SAR',
    'EGP',
    'JOD',
  ];

  CurrencyManager() : super(defaultCurrency) {
    _load();
  }

  /// Check if user has explicitly set a currency preference
  bool get isPreferenceEnabled => _preferenceEnabled;

  Future<void> _load() async {
    final saved = CacheHelper.getData(key: _key);
    if (saved is String && supported.contains(saved)) {
      value = saved;
    }
    // Load preference enabled flag
    final enabled = CacheHelper.getData(key: _preferenceEnabledKey) ?? false;
    _preferenceEnabled = enabled is bool ? enabled : false;
  }

  Future<void> setPreferred(String currency) async {
    if (!supported.contains(currency)) return;
    value = currency;
    _preferenceEnabled = true;
    await CacheHelper.saveData(key: _key, value: currency);
    await CacheHelper.saveData(key: _preferenceEnabledKey, value: true);
  }

  Future<void> clearPreference() async {
    value = defaultCurrency;
    _preferenceEnabled = false;
    await CacheHelper.saveData(key: _preferenceEnabledKey, value: false);
  }
}
