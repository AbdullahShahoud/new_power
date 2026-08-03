// ignore_for_file: override_on_non_overriding_member

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/helpers/device_validators.dart';
import '../../../../core/helpers/validators.dart';

part 'register_request.freezed.dart';
part 'register_request.g.dart';

/// POST /auth/register — registration is closed: a valid `managerCode` is
/// mandatory. DeviceInfo travels flat, inline on the body, same as login.
@Freezed(toStringOverride: false)
abstract class RegisterRequest with _$RegisterRequest {
  const factory RegisterRequest({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String password,
    required String managerCode,
    required String deviceId,
    required String deviceName,
    required String deviceType,
    required String deviceModel,
    required String osVersion,
    required String appVersion,
  }) = _RegisterRequest;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  @override
  String toString() =>
      'RegisterRequest(firstName: $firstName, lastName: $lastName, email: $email, '
      'phone: ***HIDDEN***, password: ***HIDDEN***, managerCode: ***HIDDEN***, '
      'deviceId: $deviceId, deviceName: $deviceName, deviceType: $deviceType, '
      'deviceModel: $deviceModel, osVersion: $osVersion, appVersion: $appVersion)';
}

/// Extension to validate RegisterRequest data
extension RegisterRequestValidation on RegisterRequest {
  /// Validates all required fields with robust format checks before transmission
  /// Throws ArgumentError if validation fails
  void validate() {
    // First/last name — auth.md: 1-100 chars, Latin or Arabic letters, spaces,
    // hyphens, apostrophes. Client-side keeps a soft length check; the
    // character-class rule is enforced authoritatively server-side.
    final firstNameTrimmed = firstName.trim();
    if (firstNameTrimmed.isEmpty) {
      throw ArgumentError('firstName cannot be empty');
    }
    if (firstNameTrimmed.length > 100) {
      throw ArgumentError('firstName cannot exceed 100 characters');
    }

    final lastNameTrimmed = lastName.trim();
    if (lastNameTrimmed.isEmpty) {
      throw ArgumentError('lastName cannot be empty');
    }
    if (lastNameTrimmed.length > 100) {
      throw ArgumentError('lastName cannot exceed 100 characters');
    }

    // Email validation
    final emailTrimmed = email.trim();
    if (emailTrimmed.isEmpty) {
      throw ArgumentError('email cannot be empty');
    }
    if (!AppValidators.emailRegex.hasMatch(emailTrimmed)) {
      throw ArgumentError('email must be a valid email address');
    }

    // Phone — E.164 per auth.md, 8-20 chars.
    final phoneTrimmed = phone.trim();
    if (phoneTrimmed.isEmpty) {
      throw ArgumentError('phone cannot be empty');
    }
    if (phoneTrimmed.length < 8 || phoneTrimmed.length > 20) {
      throw ArgumentError('phone must be 8-20 characters');
    }
    if (!AppValidators.phoneRegex.hasMatch(phoneTrimmed)) {
      throw ArgumentError('phone must be a valid E.164 number');
    }

    // Password — full complexity rule (registration only), 8-128 chars.
    if (password.isEmpty) {
      throw ArgumentError('password cannot be empty');
    }
    if (password.length < 8) {
      throw ArgumentError('password must be at least 8 characters');
    }
    if (password.length > 128) {
      throw ArgumentError('password cannot exceed 128 characters');
    }
    if (!password.contains(RegExp(r'[A-Z]'))) {
      throw ArgumentError(
        'password must contain at least one uppercase letter',
      );
    }
    if (!password.contains(RegExp(r'[a-z]'))) {
      throw ArgumentError(
        'password must contain at least one lowercase letter',
      );
    }
    if (!password.contains(RegExp(r'[0-9]'))) {
      throw ArgumentError('password must contain at least one digit');
    }
    if (!password.contains(AppValidators.passwordSpecialCharRegex)) {
      throw ArgumentError(
        'password must contain at least one special character',
      );
    }

    // Manager code — `SM-XXXXXXXX`, <=20 chars. The server does the real
    // normalisation (case-insensitive, optional prefix); client just guards
    // against an empty/oversized submission.
    final managerCodeTrimmed = managerCode.trim();
    if (managerCodeTrimmed.isEmpty) {
      throw ArgumentError('managerCode cannot be empty');
    }
    if (managerCodeTrimmed.length > 20) {
      throw ArgumentError('managerCode cannot exceed 20 characters');
    }

    DeviceValidators.validateDeviceInfo(
      deviceId: deviceId,
      deviceName: deviceName,
      deviceType: deviceType,
      deviceModel: deviceModel,
      osVersion: osVersion,
      appVersion: appVersion,
    );
  }
}
