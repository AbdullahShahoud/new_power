// ignore_for_file: override_on_non_overriding_member

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/helpers/device_validators.dart';
import '../../../../core/helpers/validators.dart';

part 'login_request.freezed.dart';
part 'login_request.g.dart';

/// POST /auth/login — DeviceInfo travels flat, inline on the body (no
/// separate device-registration step; see auth.md §DeviceInfo).
@Freezed(toStringOverride: false)
abstract class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String email,
    required String password,
    required String deviceId,
    required String deviceName,
    required String deviceType,
    required String deviceModel,
    required String osVersion,
    required String appVersion,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
  @override
  String toString() {
    return "LoginRequest(email: $email, password: **MASKED**, deviceId: $deviceId, "
        "deviceName: $deviceName, deviceType: $deviceType, deviceModel: $deviceModel, "
        "osVersion: $osVersion, appVersion: $appVersion)";
  }
}

/// Extension to validate LoginRequest data
extension LoginRequestValidation on LoginRequest {
  /// Validates all required fields with robust format checks before transmission
  /// Throws ArgumentError if validation fails
  void validate() {
    // Email validation
    final emailTrimmed = email.trim();
    if (emailTrimmed.isEmpty) {
      throw ArgumentError('email cannot be empty');
    }
    if (!AppValidators.emailRegex.hasMatch(emailTrimmed)) {
      throw ArgumentError('email must be a valid email address');
    }

    // Password validation — auth.md: 8-128 chars, no complexity check on login
    // (that's a registration-only rule).
    if (password.isEmpty) {
      throw ArgumentError('password cannot be empty');
    }
    if (password.length < 8) {
      throw ArgumentError('password must be at least 8 characters');
    }
    if (password.length > 128) {
      throw ArgumentError('password cannot exceed 128 characters');
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
