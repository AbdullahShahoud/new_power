import 'package:flutter/material.dart';
import '../localization/app_localizations.dart';

class AppValidators {
  // Private constructor to prevent instantiation
  AppValidators._();

  // ── Shared regex — the single source of truth for both this BuildContext-
  // aware live-UI validator and the model `.validate()` pre-submit guards
  // (see login_request.dart, register_request.dart, reset_password_request.dart,
  // forgot_password_request.dart, verify_otp_request.dart). Keeping one copy
  // avoids the rules drifting apart between the UI layer and the network layer.
  static final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  static final RegExp passwordSpecialCharRegex = RegExp(
    r'''[!@#$%^&*(),.?":{}|<>\-_~`/\\;'\[\]]''',
  );
  // E.164 per auth.md: optional +, then 1-9 leading digit, up to 14 more digits.
  static final RegExp phoneRegex = RegExp(r'^\+?[1-9]\d{1,14}$');
  static final RegExp otpRegex = RegExp(r'^\d{6}$');
  // Password-reset code alphabet per auth.md: uppercase letters + digits only
  // (distinct from the numeric-only 6-digit OTP used for email/device/2FA).
  static final RegExp resetCodeRegex = RegExp(r'^[A-Z0-9]{6,20}$');
  // `reason`/`note` forbidden characters — identical rule in
  // projects-client-reference.md (stage/status/location/outcome reasons) and
  // stakeholders.md (merge/archive/decision-maker reasons). One shared rule.
  static final RegExp reasonForbiddenCharsRegex = RegExp('''[<>;"']''');

  static String? validateOptionalField(String? value, BuildContext context) {
    if (value != null && value.length > 100) {
      return context.tr(' cannot exceed 100 characters');
    }
    return null;
  }

  static String? validateEmail(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return context.tr('error_empty_email');
    }

    if (!emailRegex.hasMatch(value)) {
      return context.tr('error_invalid_email');
    }

    return null;
  }

  /// Password Validation
  static String? validatePassword(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return context.tr('error_empty_password');
    }

    if (value.length < 8) {
      return context.tr('error_password_too_short');
    }

    if (value.length > 128) {
      return context.tr('error_password_too_long');
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return context.tr('error_password_uppercase');
    }

    if (!value.contains(RegExp(r'[a-z]'))) {
      return context.tr('error_password_lowercase');
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return context.tr('error_password_digit');
    }

    if (!value.contains(passwordSpecialCharRegex)) {
      return context.tr('error_password_special');
    }

    // Reject 4+ consecutive identical characters (e.g. aaaa, 1111)
    if (RegExp(r'(.)\1{3,}').hasMatch(value)) {
      return context.tr('error_password_repeated_chars');
    }

    return null;
  }

  static String? validateConfirmPassword(
    BuildContext context,
    String? value,
    String? password,
  ) {
    if (value == null || value.isEmpty) {
      return context.tr('error_confirm_password_required');
    }

    if (value != password) {
      return context.tr('error_password_mismatch');
    }

    return null;
  }

  /// Phone Validation — E.164 per auth.md (optional +, 1-9 leading digit, up to 14 more).
  static String? phone(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return context.tr('error_empty_phone');
    }

    // Strip spaces, dashes, parentheses for validation
    final cleaned = value.replaceAll(RegExp(r'[\s\-\(\)]'), '');

    if (!phoneRegex.hasMatch(cleaned)) {
      return context.tr('error_invalid_phone');
    }

    return null;
  }

  /// Name Validation
  static String? name(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return context.tr('error_empty_name');
    }

    if (value.length < 3) {
      return context.tr('error_name_too_short');
    }

    return null;
  }

  /// OTP Validation (6-digit numeric — email/device/2FA verification codes)
  static String? validateOtp(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return context.tr('error_empty_pin');
    }

    if (!otpRegex.hasMatch(value)) {
      return context.tr('error_otp_invalid_length');
    }

    return null;
  }

  /// Password-reset code validation (6-20 chars, uppercase letters + digits —
  /// a different alphabet from the numeric OTP, per auth.md POST /auth/reset-password).
  static String? validateResetCode(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return context.tr('error_empty_pin');
    }

    if (!resetCodeRegex.hasMatch(value)) {
      return context.tr('error_invalid_reset_code');
    }

    return null;
  }

  // ── Network-layer (ArgumentError-throwing) validators ─────────────────────
  // Used from model `.validate()` extensions before a request is sent — same
  // pattern as LoginRequestValidation/RegisterRequestValidation in the auth
  // module. No BuildContext available at that layer, so these return nothing
  // and throw instead of returning a localized message.

  /// Shared `reason`/`note` rule (projects-client-reference.md,
  /// stakeholders.md): 10-500 chars after trimming, must not contain
  /// `< > ; " '`. [fieldName] is used only in the thrown message.
  static void validateReason(String value, {String fieldName = 'reason'}) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      throw ArgumentError('$fieldName cannot be empty');
    }
    if (trimmed.length < 10 || trimmed.length > 500) {
      throw ArgumentError('$fieldName must be 10-500 characters');
    }
    if (reasonForbiddenCharsRegex.hasMatch(trimmed)) {
      throw ArgumentError('$fieldName contains forbidden characters');
    }
  }

  /// Decimal-degree latitude, WGS-84.
  static void validateLatitude(num value) {
    if (value < -90 || value > 90) {
      throw ArgumentError('latitude must be between -90 and 90');
    }
  }

  /// Decimal-degree longitude, WGS-84.
  static void validateLongitude(num value) {
    if (value < -180 || value > 180) {
      throw ArgumentError('longitude must be between -180 and 180');
    }
  }

  /// A coordinate pair of exactly `(0,0)` is a phone with no GPS fix, not a
  /// real location on Earth (projects-client-reference.md `PROJECT_INVALID_LOCATION`).
  static void validateCoordinates(num lat, num lng) {
    validateLatitude(lat);
    validateLongitude(lng);
    if (lat == 0 && lng == 0) {
      throw ArgumentError('location (0,0) looks like a missing GPS fix');
    }
  }

  /// Money is always `amount` + ISO-4217 `currency` together — a currency is
  /// required whenever an amount is present, never on its own. `amount` must
  /// be non-negative with at most 2 decimal places.
  static void validateMoney({
    required num? amount,
    required String? currency,
    String fieldName = 'amount',
  }) {
    if (amount == null) return;
    if (amount < 0) {
      throw ArgumentError('$fieldName must be >= 0');
    }
    final cents = (amount * 100).round();
    if ((cents / 100) != amount && (amount * 100 - cents).abs() > 0.001) {
      throw ArgumentError('$fieldName must have at most 2 decimal places');
    }
    if (currency == null || currency.trim().isEmpty) {
      throw ArgumentError('currency is required when $fieldName is present');
    }
    if (!RegExp(r'^[A-Z]{3}$').hasMatch(currency)) {
      throw ArgumentError('currency must be a 3-letter ISO-4217 code');
    }
  }

  /// UUID v4 — `personsMet[]`, `competitorAccountId`, `distributorAccountId`
  /// and friends (projects-client-reference.md §1.10). A regex rather than
  /// depending on the `uuid` package's own validator so this file has no
  /// import beyond what it already needs.
  static final RegExp uuidV4Regex = RegExp(
    r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-4[0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}$',
  );

  static void validateUuid(String value, {String fieldName = 'id'}) {
    if (!uuidV4Regex.hasMatch(value)) {
      throw ArgumentError('$fieldName must be a valid UUID v4');
    }
  }

  /// Activity `notes` (create + edit) — `20…4000` chars, trimmed. A
  /// distinct floor from [validateReason]'s `10…500` (a different domain
  /// rule, not a parameterized reuse that would obscure the two), per
  /// projects-implementation-map.md §4.
  static void validateActivityNotes(
    String value, {
    String fieldName = 'notes',
  }) {
    final trimmed = value.trim();
    if (trimmed.length < 20 || trimmed.length > 4000) {
      throw ArgumentError('$fieldName must be 20-4000 characters');
    }
  }

  /// Arabic-Indic digits `٠-٩` — stakeholders.md: "Phone numbers and
  /// registration numbers accept western digits (`0-9`) only... an
  /// Arabic-Indic value is refused rather than transliterated." Account
  /// *names* are exempt (the server folds `٠-٩` onto `0-9` for matching).
  static final RegExp arabicIndicDigitsRegex = RegExp(r'[٠-٩]');

  /// stakeholders.md `POST /accounts` `name` — `ACCOUNT_INVALID_NAME`:
  /// "blank, under 2 chars, over 200, control characters, or folds to
  /// nothing." The folding itself is a server-side comparison-key concern
  /// (diacritics, legal-form boilerplate) this client can't replicate
  /// meaningfully — the length/control-character floor is what's checkable.
  static void validateAccountName(String value, {String fieldName = 'name'}) {
    final trimmed = value.trim();
    if (trimmed.length < 2 || trimmed.length > 200) {
      throw ArgumentError('$fieldName must be 2-200 characters');
    }
    if (trimmed.contains(RegExp(r'[\x00-\x1F\x7F]'))) {
      throw ArgumentError('$fieldName contains control characters');
    }
  }

  /// stakeholders.md `POST /accounts` `registrationNumber` (optional) —
  /// western digits only; letters/digits once separators (`-`, `/`, space)
  /// are stripped.
  static void validateRegistrationNumber(
    String value, {
    String fieldName = 'registrationNumber',
  }) {
    if (arabicIndicDigitsRegex.hasMatch(value)) {
      throw ArgumentError('$fieldName must use western digits only');
    }
    final stripped = value.replaceAll(RegExp(r'[\-/\s]'), '');
    if (stripped.isEmpty || !RegExp(r'^[a-zA-Z0-9]+$').hasMatch(stripped)) {
      throw ArgumentError('$fieldName must be letters and digits only');
    }
  }

  /// A contact's/account's `phone`: at most 30 characters, western digits
  /// with an optional leading `+`.
  ///
  /// The digit-script rule is stakeholders.md's ("an Arabic-Indic value is
  /// refused rather than transliterated"); the length and shape are the
  /// bounds the standalone contact endpoints enforce.
  static void validateWesternPhone(String value, {String fieldName = 'phone'}) {
    if (arabicIndicDigitsRegex.hasMatch(value)) {
      throw ArgumentError('$fieldName must use western digits only');
    }
    final trimmed = value.trim();
    if (trimmed.length > 30) {
      throw ArgumentError('$fieldName cannot exceed 30 characters');
    }
    // Separators a rep types out of habit (spaces, dashes, parentheses) are
    // tolerated — the server normalises them. What is refused is a value
    // that carries no digits at all, or a `+` anywhere but the front.
    if (!RegExp(r'^\+?[0-9\s\-()]*[0-9][0-9\s\-()]*$').hasMatch(trimmed)) {
      throw ArgumentError(
        '$fieldName must be digits, optionally starting with +',
      );
    }
  }

  /// stakeholders.md `POST /accounts/{id}/contacts` — `firstName`/`lastName`
  /// are both required, 2–80 characters.
  static void validateContactName(String value, {String fieldName = 'name'}) {
    final trimmed = value.trim();
    if (trimmed.length < 2 || trimmed.length > 80) {
      throw ArgumentError('$fieldName must be 2-80 characters');
    }
  }
}
