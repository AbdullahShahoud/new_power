import 'package:flutter/material.dart';
import '../helpers/cache_helper.dart';

/// Language manager for state management and persistence
class LanguageManager extends ValueNotifier<Locale> {
  static const String _languageKey = 'app_language';

  LanguageManager() : super(const Locale('ar', 'SY')) {
    _loadLanguageFromPreferences();
  }

  /// Load saved language preference on app startup
  Future<void> _loadLanguageFromPreferences() async {
    final savedLanguage = CacheHelper.getData(key: _languageKey);
    if (savedLanguage != null) {
      value = _localeFromString(savedLanguage);
    }
  }

  /// Set language by language code
  Future<void> setLanguage(String code) async {
    switch (code) {
      case 'en':
        await setEnglish();
      default:
        await setArabic();
    }
  }

  /// Set English language
  Future<void> setEnglish() async {
    value = const Locale('en', 'US');
    await CacheHelper.saveData(key: _languageKey, value: 'en');
  }

  /// Set Arabic language
  Future<void> setArabic() async {
    value = const Locale('ar', 'SY');
    await CacheHelper.saveData(key: _languageKey, value: 'ar');
  }

  /// Convert string to Locale
  Locale _localeFromString(String languageCode) {
    switch (languageCode) {
      case 'en':
        return const Locale('en', 'US');
      default:
        return const Locale('ar', 'SY');
    }
  }

  /// Check if current language is Arabic (RTL)
  bool get isArabic => value.languageCode == 'ar';

  /// Check if current language is English
  bool get isEnglish => value.languageCode == 'en';

  /// Get current language name
  String get languageName {
    switch (value.languageCode) {
      case 'en':
        return 'English';
      default:
        return 'العربية';
    }
  }

  /// Get current language code
  String get languageCode => value.languageCode;

  /// Get text direction for current language
  TextDirection get textDirection {
    return isArabic ? TextDirection.rtl : TextDirection.ltr;
  }
}
