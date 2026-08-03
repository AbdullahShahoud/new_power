import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:safe_device/safe_device.dart';

/// Device Integrity & Remote Attestation Service
///
/// Comprehensive security checks for device authenticity and integrity
/// Supports:
/// - Android: SafeDevice checks + Play Integrity API (future)
/// - iOS: SafeDevice checks + App Attest API (future)
/// - Jailbreak/Root detection
/// - Emulator detection
/// - Mock location detection
/// - Remote attestation token generation
class DeviceIntegrityService {
  DeviceIntegrityService._();

  /// Returns `true` if the device appears to be rooted / jailbroken,
  /// is running inside an emulator, or has a mock location active.
  ///
  /// Each check is run independently so that a single library error cannot
  /// suppress all signals. Emulator/mock-location checks are skipped in
  /// debug mode to keep development unblocked.
  ///
  /// Security: Prevents device registration on compromised devices
  static Future<bool> isCompromised() async {
    if (kIsWeb) return false;
    if (!Platform.isAndroid && !Platform.isIOS) return false;

    // 1. Root / jailbreak
    if (await _check(() => SafeDevice.isJailBroken)) return true;

    // 2. Emulator detection — skip in debug so the team can use simulators
    if (!kDebugMode) {
      if (await _check(() => SafeDevice.isRealDevice.then((r) => !r))) {
        return true;
      }
    }

    // 3. Mock location (Android only) — irrelevant on iOS
    if (Platform.isAndroid) {
      if (await _check(() => SafeDevice.isMockLocation)) return true;
    }

    return false;
  }

  /// Get comprehensive device integrity verdict
  ///
  /// Returns IntegrityVerdict indicating device safety level:
  /// - PASS: Device is genuine and not compromised
  /// - WARN: Some concerns but acceptable for operation
  /// - FAIL: Critical integrity issues detected
  static Future<IntegrityVerdict> getDeviceVerdict() async {
    if (kIsWeb) {
      // Web doesn't support device integrity checks
      return IntegrityVerdict.warn;
    }

    final isCompromisedDevice = await isCompromised();
    if (isCompromisedDevice) {
      return IntegrityVerdict.fail;
    }

    return IntegrityVerdict.pass;
  }

  /// Get detailed integrity report with all check results
  static Future<IntegrityReport> getDetailedReport() async {
    final isRooted = await _check(() => SafeDevice.isJailBroken);
    // M-5: Mirror the kDebugMode guard from isCompromised() so the two methods
    // are consistent — emulator is only flagged in release builds.
    final isEmulator = kDebugMode
        ? false
        : !await _check(
            () => SafeDevice.isRealDevice.then((r) => r),
            defaultValue: false,
          );
    final isMockLocation = Platform.isAndroid
        ? await _check(() => SafeDevice.isMockLocation)
        : false;

    final verdict = (isRooted || (isEmulator && !kDebugMode) || isMockLocation)
        ? IntegrityVerdict.fail
        : IntegrityVerdict.pass;

    return IntegrityReport(
      verdict: verdict,
      isNotRooted: !isRooted,
      isNotEmulator: !isEmulator,
      isNotMockLocation: !isMockLocation,
      checksPerformed: [
        'Root/Jailbreak Detection',
        'Emulator Detection',
        if (Platform.isAndroid) 'Mock Location Detection',
      ],
      reportedAt: DateTime.now(),
    );
  }

  /// Runs [check] and returns its result. Any exception is treated as
  /// `true` (compromised) to prevent hooking attacks that suppress checks
  /// by throwing.
  static Future<bool> _check(
    Future<bool> Function() check, {
    bool defaultValue = true,
  }) async {
    try {
      return await check();
    } catch (_) {
      return defaultValue;
    }
  }

  /// Check if device is safe for sensitive operations like device registration
  ///
  /// Blocks registration on:
  /// - Rooted/Jailbroken devices
  /// - Emulator (in release builds)
  /// - Devices with mock locations
  /// - Web platform (lacks hardware security module support)
  static Future<bool> isSafeForSensitiveOps() async {
    // L-4: Web has no hardware security module — treat as unsafe.
    if (kIsWeb) return false;
    return !(await isCompromised());
  }
}

/// Device Integrity Verdict
enum IntegrityVerdict {
  /// Device and app are genuine and secure
  pass,

  /// Some concerns detected but device acceptable
  warn,

  /// Critical integrity issues detected - block operation
  fail,
}

/// Detailed integrity check report
class IntegrityReport {
  /// Overall verdict from all checks
  final IntegrityVerdict verdict;

  /// Device is not rooted/jailbroken
  final bool isNotRooted;

  /// Device is not running in emulator
  final bool isNotEmulator;

  /// Device does not have mock location enabled (Android only)
  final bool isNotMockLocation;

  /// List of security checks performed
  final List<String> checksPerformed;

  /// Timestamp when report was generated
  final DateTime reportedAt;

  IntegrityReport({
    required this.verdict,
    required this.isNotRooted,
    required this.isNotEmulator,
    required this.isNotMockLocation,
    required this.checksPerformed,
    required this.reportedAt,
  });

  /// Number of checks that failed
  int get failedChecks => [
    !isNotRooted,
    !isNotEmulator,
    !isNotMockLocation,
  ].where((check) => check).length;

  /// Check if device is safe for sensitive operations
  bool isSafeForSensitiveOps() {
    return verdict == IntegrityVerdict.pass &&
        isNotRooted &&
        isNotEmulator &&
        isNotMockLocation;
  }

  /// Get human-readable status
  String getStatusMessage() {
    switch (verdict) {
      case IntegrityVerdict.pass:
        return 'Device integrity verified - safe for registration';
      case IntegrityVerdict.warn:
        return 'Device integrity warning - some concerns detected';
      case IntegrityVerdict.fail:
        return 'Device integrity failed - registration blocked';
    }
  }

  /// Get failure reasons (if any)
  List<String> getFailureReasons() {
    final reasons = <String>[];
    if (!isNotRooted) reasons.add('Device appears to be rooted/jailbroken');
    if (!isNotEmulator) reasons.add('Device appears to be running in emulator');
    if (!isNotMockLocation) reasons.add('Mock location detected');
    return reasons;
  }
}
