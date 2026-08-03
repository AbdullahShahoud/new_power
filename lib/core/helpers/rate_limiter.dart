import 'package:synchronized/synchronized.dart';

import 'secure_storage_helper.dart';

/// Client-side rate limiter using SecureStorageHelper for tamper-resistant
/// persistence. Counters are stored in the OS keychain/keystore, making them
/// inaccessible to unprivileged processes even on rooted devices.
///
/// This is a **UX safety net only** — preventing accidental repeated taps /
/// obvious spam before a request even reaches the network — not a substitute
/// for the backend's own rate limits (see auth.md's per-endpoint throttles).
/// The two work together:
///   - [recordFailure] applies a short local backoff after a few consecutive
///     failures (e.g. mistyped password), so an impatient user can't burn
///     through their server-side attempt budget by mashing the button.
///   - [lockFor] is called with the server's own `Retry-After` /
///     `retryAfter` value whenever a call actually comes back `429
///     RATE_LIMIT_EXCEEDED` — that authoritative window always wins over any
///     locally-guessed backoff.
///
/// Strategy for the local safety net:
///   - Every 3 consecutive failures triggers a lockout.
///   - Backoff doubles each lockout round: 30s → 60s → 120s → 240s …
///   - A single success resets the counter and any active lock.
class RateLimiter {
  RateLimiter._();
  static final Lock _lock = Lock();
  // default max attempts before lockout; can be overridden per operation
  // Default: 3 attempts before first lockout (30s)
  static const int _maxAttempts = 3;
  static const Map<String, int> _customMaxAttempts = {
    login: 3,
    register: 3,
    resetCode: 3,
    resetPassword: 3,
    otp: 3,
  };

  static String _attemptsKey(String op) => 'rl_${op}_attempts';
  static String _lockedUntilKey(String op) => 'rl_${op}_locked_until';
  static String _lockoutRoundKey(String op) => 'rl_${op}_lockout_round';

  /// Returns the number of seconds remaining in the lockout,
  /// or `null` if the operation is not currently locked.
  static Future<int?> checkLock(String op) async {
    final lockedUntilStr = await SecureStorageHelper.readSafe(
      key: _lockedUntilKey(op),
    );
    final lockedUntilMs = int.tryParse(lockedUntilStr ?? '');
    if (lockedUntilMs == null || lockedUntilMs == 0) return null;

    final remaining =
        ((lockedUntilMs - DateTime.now().millisecondsSinceEpoch) / 1000).ceil();
    return remaining > 0 ? remaining : null;
  }

  /// Records a failed attempt or counts an operation attempt for [op].
  ///
  /// For most operations, this records failures only. For rate-limited
  /// operations like export, this can count both successes and failures
  /// toward the attempt limit.
  ///
  /// Returns the lockout duration in seconds if this attempt triggered a
  /// lockout, or `null` if the user still has remaining attempts.
  static Future<int?> recordFailure(String op) async {
    return await _lock.synchronized(() async {
      final prevStr = await SecureStorageHelper.readSafe(key: _attemptsKey(op));
      final prev = int.tryParse(prevStr ?? '') ?? 0;
      final attempts = prev + 1;
      await SecureStorageHelper.save(
        key: _attemptsKey(op),
        value: attempts.toString(),
      );

      final maxAtt = _customMaxAttempts[op] ?? _maxAttempts;
      // Trigger lockout when attempts reach maxAtt
      if (attempts >= maxAtt) {
        // Get current lockout round (increments each time a new lockout is triggered)
        final roundStr = await SecureStorageHelper.readSafe(
          key: _lockoutRoundKey(op),
        );
        final currentRound = int.tryParse(roundStr ?? '') ?? 0;
        final nextRound = currentRound + 1;

        // Save incremented lockout round
        await SecureStorageHelper.save(
          key: _lockoutRoundKey(op),
          value: nextRound.toString(),
        );

        // 30s, 60s, 120s, 240s, … (doubles each round, capped at 24 hours)
        final rawBackoff = 30 * (1 << (nextRound - 1));
        final backoffSeconds = rawBackoff > 86400 ? 86400 : rawBackoff;
        final lockedUntilMs =
            DateTime.now().millisecondsSinceEpoch + backoffSeconds * 1000;
        await SecureStorageHelper.save(
          key: _lockedUntilKey(op),
          value: lockedUntilMs.toString(),
        );

        // Reset attempt counter for next round
        await SecureStorageHelper.save(key: _attemptsKey(op), value: '0');

        return backoffSeconds;
      }

      return null;
    });
  }

  /// Returns how many attempts remain before the next lockout.
  static Future<int> remainingAttempts(String op) async {
    final attemptsStr = await SecureStorageHelper.readSafe(
      key: _attemptsKey(op),
    );
    final attempts = int.tryParse(attemptsStr ?? '') ?? 0;
    final maxAtt = _customMaxAttempts[op] ?? _maxAttempts;
    // Safe subtraction: if storage is corrupted and attempts > maxAtt,
    // clamp to 0 rather than returning a misleading positive value.
    final remaining = maxAtt - attempts;
    return remaining < 0 ? 0 : remaining;
  }

  /// Resets the attempt counter and clears any active lock for [op].
  /// Also resets the lockout round on successful operation.
  static Future<void> reset(String op) async {
    await SecureStorageHelper.save(key: _attemptsKey(op), value: '0');
    await SecureStorageHelper.save(key: _lockedUntilKey(op), value: '0');
    await SecureStorageHelper.save(key: _lockoutRoundKey(op), value: '0');
  }

  /// Lock [op] for exactly [seconds] — used when the **server** returns
  /// `429 RATE_LIMIT_EXCEEDED` with an authoritative retry window (from the
  /// `Retry-After` header or `error.details.retryAfter`). This overrides any
  /// locally-guessed backoff with the real one, per auth.md's per-endpoint
  /// throttles. Does not touch the attempt counter/round — a server-driven
  /// lock isn't part of the local escalating-backoff sequence.
  static Future<void> lockFor(String op, int seconds) async {
    if (seconds <= 0) return;
    final lockedUntilMs =
        DateTime.now().millisecondsSinceEpoch + seconds * 1000;
    await SecureStorageHelper.save(
      key: _lockedUntilKey(op),
      value: lockedUntilMs.toString(),
    );
  }

  // ── Named operations (auth-scoped) ────────────────────────────────────────
  static const String login = 'login';
  static const String otp = 'otp';
  static const String register = 'register';
  static const String forgotPassword = 'forgot_password';
  static const String resetPassword = 'reset_password';
  static const String resetCode = 'reset_code';
}
