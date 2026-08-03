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
}
