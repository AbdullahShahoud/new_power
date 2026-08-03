/// Validates the six `DeviceInfo` fields required on `/auth/register` and
/// `/auth/login` (see auth.md). Single source of truth shared by
/// `LoginRequest.validate()` and `RegisterRequest.validate()`.
class DeviceValidators {
  // Private constructor to prevent instantiation
  DeviceValidators._();

  static final RegExp _deviceIdRegex = RegExp(r'^[A-Za-z0-9_-]{10,100}$');
  static final RegExp _deviceNameRegex = RegExp(r"^[a-zA-Z0-9\s\-']{1,100}$");
  static final RegExp _deviceModelRegex = RegExp(r'^[a-zA-Z0-9\s\-\+]{1,100}$');
  static final RegExp _osVersionRegex = RegExp(r'^[a-zA-Z0-9\s.-]{1,50}$');
  static final RegExp _appVersionRegex = RegExp(
    r'^\d+\.\d+\.\d+(-[a-zA-Z0-9]+)?$',
  );
  static const _validDeviceTypes = {'android', 'ios', 'web'};

  /// Client-generated fingerprint. 10-100 chars, `^[A-Za-z0-9_-]+$`.
  static void validateDeviceId(String deviceId) {
    if (deviceId.isEmpty) {
      throw ArgumentError('deviceId cannot be empty');
    }
    if (!_deviceIdRegex.hasMatch(deviceId)) {
      throw ArgumentError(
        'deviceId must be 10-100 chars of letters, digits, "_" or "-"',
      );
    }
  }

  /// Must be one of `android`, `ios`, `web` (lower-cased).
  static void validateDeviceType(String deviceType) {
    if (deviceType.isEmpty) {
      throw ArgumentError('deviceType cannot be empty');
    }
    if (!_validDeviceTypes.contains(deviceType.toLowerCase())) {
      throw ArgumentError('deviceType must be one of: android, ios, web');
    }
  }

  /// 1-100 chars, `^[a-zA-Z0-9\s\-']+$`.
  static void validateDeviceName(String deviceName) {
    if (deviceName.isEmpty) {
      throw ArgumentError('deviceName cannot be empty');
    }
    if (!_deviceNameRegex.hasMatch(deviceName)) {
      throw ArgumentError(
        'deviceName must be 1-100 chars of letters, digits, spaces, "-" or "\'"',
      );
    }
  }

  /// 1-100 chars, `^[a-zA-Z0-9\s\-\+]+$`.
  static void validateDeviceModel(String deviceModel) {
    if (deviceModel.isEmpty) {
      throw ArgumentError('deviceModel cannot be empty');
    }
    if (!_deviceModelRegex.hasMatch(deviceModel)) {
      throw ArgumentError(
        'deviceModel must be 1-100 chars of letters, digits, spaces, "-" or "+"',
      );
    }
  }

  /// 1-50 chars, `^[a-zA-Z0-9\s.-]+$`.
  static void validateOsVersion(String osVersion) {
    if (osVersion.isEmpty) {
      throw ArgumentError('osVersion cannot be empty');
    }
    if (!_osVersionRegex.hasMatch(osVersion)) {
      throw ArgumentError(
        'osVersion must be 1-50 chars of letters, digits, spaces, "." or "-"',
      );
    }
  }

  /// Semver: `^\d+\.\d+\.\d+(-[a-zA-Z0-9]+)?$`, e.g. `1.0.0` or `1.0.0-beta`.
  static void validateAppVersion(String appVersion) {
    if (appVersion.isEmpty) {
      throw ArgumentError('appVersion cannot be empty');
    }
    if (!_appVersionRegex.hasMatch(appVersion)) {
      throw ArgumentError('appVersion must be semver, e.g. "1.0.0"');
    }
  }

  /// Validates all six DeviceInfo fields at once — the shared block both
  /// `LoginRequest.validate()` and `RegisterRequest.validate()` call.
  static void validateDeviceInfo({
    required String deviceId,
    required String deviceName,
    required String deviceType,
    required String deviceModel,
    required String osVersion,
    required String appVersion,
  }) {
    validateDeviceId(deviceId);
    validateDeviceName(deviceName);
    validateDeviceType(deviceType);
    validateDeviceModel(deviceModel);
    validateOsVersion(osVersion);
    validateAppVersion(appVersion);
  }
}
