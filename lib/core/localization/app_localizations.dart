import 'package:flutter/material.dart';
import 'languages/ar_sy.dart';
import 'languages/en_us.dart';

/// Supported languages
enum AppLanguage {
  english('en', 'English', 'US', TextDirection.ltr),
  arabic('ar', 'العربية', 'SA', TextDirection.rtl);

  final String code;
  final String name;

  /// ISO 3166-1 alpha-2 country code — used to render the flag emoji.
  final String countryCode;
  final TextDirection direction;

  const AppLanguage(this.code, this.name, this.countryCode, this.direction);

  /// Convert two-letter country code to flag emoji using Unicode regional indicators.
  String get flagEmoji {
    final base = 0x1F1E6 - 0x41; // 'A' offset
    return String.fromCharCodes(
      countryCode.toUpperCase().codeUnits.map((c) => base + c),
    );
  }
}

/// Main localization class
class AppLocalizations {
  final Locale locale;
  late Map<String, String> _localizedStrings;

  AppLocalizations(this.locale) {
    _localizedStrings = _getLanguageMap();
  }

  /// Get the current instance from context
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  /// Get localized string by key
  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }

  /// Get language map based on locale — falls back to English for missing keys.
  Map<String, String> _getLanguageMap() {
    switch (locale.languageCode) {
      case 'ar':
        return arSY;
      case 'en':
      default:
        return enUS;
    }
  }

  /// Get text direction for current locale
  TextDirection get textDirection {
    return locale.languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr;
  }

  /// Check if current language is Arabic
  bool get isArabic => locale.languageCode == 'ar';

  /// Check if current language is English
  bool get isEnglish => locale.languageCode == 'en';

  /// Get current language enum
  AppLanguage get currentLanguage {
    switch (locale.languageCode) {
      case 'ar':
        return AppLanguage.arabic;
      default:
        return AppLanguage.english;
    }
  }

  /// Supported locales
  static const List<Locale> supportedLocales = [
    Locale('en', 'US'),
    Locale('ar', 'SY'),
  ];

  /// Locale resolution callback
  static Locale localeResolutionCallback(
    Locale? locale,
    Iterable<Locale> supportedLocales,
  ) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return supportedLocale;
        }
      }
    }
    return supportedLocales.first;
  }
}

/// Localization delegate
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

/// Extension to easily access translations
extension LocalizationExtension on BuildContext {
  /// Get translation by key
  /// Usage: context.tr('key')
  String tr(String key) {
    return AppLocalizations.of(this).translate(key);
  }

  /// Get current locale
  Locale get locale => Localizations.localeOf(this);

  /// Get current text direction
  TextDirection get direction => Directionality.of(this);

  /// Check if current language is Arabic
  bool get isArabic => AppLocalizations.of(this).isArabic;

  /// Check if current language is English
  bool get isEnglish => AppLocalizations.of(this).isEnglish;
}
