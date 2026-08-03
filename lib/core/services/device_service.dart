import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../helpers/secure_storage_helper.dart';

/// Collects the six `DeviceInfo` fields auth.md requires flat on
/// `/auth/register` and `/auth/login` bodies: deviceId, deviceName,
/// deviceType, deviceModel, osVersion, appVersion. There is no device
/// public/private key exchange and no separate device-registration call —
/// this data travels inline with the auth request that needs it.
class DeviceIdentityService {
  DeviceIdentityService._();
  static final _deviceInfo = DeviceInfoPlugin();
  static _PlatformInfo? _cachedPlatformInfo;

  /// Client-generated device fingerprint, persisted so it stays stable
  /// across app restarts. Required as `X-Device-Id` on every later request.
  static Future<String> getOrCreateDeviceId() async {
    String? existingId = await SecureStorageHelper.readSafe(
      key: SecureStorageHelper.deviceId,
    );

    if (existingId != null) {
      return existingId;
    }

    String deviceId = await _generateSecureDeviceId();

    await SecureStorageHelper.save(
      key: SecureStorageHelper.deviceId,
      value: deviceId,
    );

    return deviceId;
  }

  static Future<String> getDeviceType() async {
    if (Platform.isAndroid) return 'android';
    if (Platform.isIOS) return 'ios';
    throw UnsupportedError('Unsupported platform');
  }

  /// Sanitized to auth.md's `deviceModel` character class: letters, digits,
  /// whitespace, "-" and "+".
  static Future<String?> getDeviceModel() async {
    final info = await _getPlatformInfo();
    if (info.deviceModel == null) return null;
    return info.deviceModel!.replaceAll(RegExp(r"[^a-zA-Z0-9\s\-\+]"), '-');
  }

  static Future<String?> getOsVersion() async {
    final info = await _getPlatformInfo();
    return info.osVersion;
  }

  /// Sanitized to auth.md's `deviceName` character class: letters, digits,
  /// whitespace, "-" and "'".
  static Future<String?> getDeviceName() async {
    final info = await _getPlatformInfo();
    if (info.deviceName == null) return null;
    return info.deviceName!.replaceAll(RegExp(r"[^a-zA-Z0-9\s\-']"), '-');
  }

  static Future<String?> getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  // ══════════════════════════════════════════════════════════════════════════
  // Internal helpers
  // ══════════════════════════════════════════════════════════════════════════

  static Future<_PlatformInfo> _getPlatformInfo() async {
    if (_cachedPlatformInfo != null) return _cachedPlatformInfo!;

    if (Platform.isAndroid) {
      final android = await _deviceInfo.androidInfo;
      _cachedPlatformInfo = _PlatformInfo(
        deviceType: 'android',
        deviceModel: android.model,
        deviceName: "${android.name} ",
        osVersion: 'Android ${android.version.release}',
      );
      return _cachedPlatformInfo!;
    }

    if (Platform.isIOS) {
      final ios = await _deviceInfo.iosInfo;
      _cachedPlatformInfo = _PlatformInfo(
        deviceType: 'ios',
        deviceModel: ios.utsname.machine,
        deviceName: ios.utsname.nodename,
        osVersion: 'iOS ${ios.systemVersion}',
      );
      return _cachedPlatformInfo!;
    }

    throw UnsupportedError('Unsupported platform');
  }

  static Future<String> _generateSecureDeviceId() async {
    Map<String, dynamic> components = {};

    if (Platform.isAndroid) {
      final androidInfo = await _deviceInfo.androidInfo;
      components = {
        'android_id': androidInfo.id,
        'hardware': androidInfo.hardware,
        'device': androidInfo.device,
        'board': androidInfo.board,
        'brand': androidInfo.brand,
        'model': androidInfo.model,
        'fingerprint': androidInfo.fingerprint,
      };
    } else if (Platform.isIOS) {
      final iosInfo = await _deviceInfo.iosInfo;
      components = {
        'vendor_id': iosInfo.identifierForVendor ?? '',
        'name': iosInfo.name,
        'model': iosInfo.model,
        'system_name': iosInfo.systemName,
        'system_version': iosInfo.systemVersion,
        'utsname_machine': iosInfo.utsname.machine,
        'utsname_version': iosInfo.utsname.version,
      };
    }
    // TODO: only enabled for development release..
    // final rng = Random.secure();
    // final saltBytes = List<int>.generate(32, (_) => rng.nextInt(256));
    // components['salt'] = base64Url.encode(saltBytes);
    final combined = jsonEncode(components);
    final digest = sha256.convert(utf8.encode(combined));
    return digest.toString();
  }
}

class _PlatformInfo {
  final String deviceType;
  final String? deviceModel;
  final String? osVersion;
  final String? deviceName;

  _PlatformInfo({
    required this.deviceType,
    required this.deviceModel,
    required this.osVersion,
    required this.deviceName,
  });
}
