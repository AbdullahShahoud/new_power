import 'dart:async';

import 'package:flutter/foundation.dart';

/// A countdown that measures **wall-clock time**, not timer ticks.
///
/// Every auth screen shows one — the 60-second resend lock on OTP entry, and
/// the server's `Retry-After` lock on login, register, forgot-password and
/// reset-password. All five held an `int` and decremented it once per
/// `Timer.periodic` tick.
///
/// That is wrong on a phone. Flutter suspends timers while the app is
/// backgrounded, so the counter freezes: a rep who switches to their mail
/// app to fetch the OTP comes back to a countdown showing exactly what it
/// showed when they left. The button stays locked for 60 seconds *of
/// foreground time*, which can be many minutes of real time — while the
/// server's own window, which runs on wall clock, opened long ago. The app
/// ends up refusing to do something the backend would happily allow.
///
/// Holding the **deadline** makes the tick rate cosmetic: it only decides
/// how often the label repaints, never what the label says. Backgrounding,
/// a device sleeping, or a dropped tick all become irrelevant.
///
/// ⚠️ Deliberately `DateTime.now()` and not a monotonic clock. The value
/// being mirrored is a server window that is itself wall-clock based, so
/// agreeing with the server matters more than being immune to a user
/// changing their device clock — and the worst case there is a lock that
/// ends early, which the server will still reject.
class Countdown {
  /// Called on every tick and whenever the deadline is set or cleared, so
  /// the host can `setState`.
  final VoidCallback onTick;

  DateTime? _deadline;
  Timer? _timer;

  Countdown(this.onTick);

  /// Whole seconds remaining, floored at zero.
  ///
  /// Rounded **up**, so the label never reads "0" while the control is still
  /// locked — a button that says it is ready but refuses the tap is worse
  /// than one that overstates the wait by a fraction of a second.
  int get secondsLeft {
    final deadline = _deadline;
    if (deadline == null) return 0;
    final remaining = deadline.difference(DateTime.now());
    if (remaining.isNegative) return 0;
    return (remaining.inMilliseconds / 1000).ceil();
  }

  bool get isActive => secondsLeft > 0;

  /// Starts (or restarts) the countdown. A non-positive [seconds] clears it.
  void start(int seconds) {
    _timer?.cancel();
    if (seconds <= 0) {
      _deadline = null;
      onTick();
      return;
    }
    _deadline = DateTime.now().add(Duration(seconds: seconds));
    onTick();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      onTick();
      if (secondsLeft == 0) timer.cancel();
    });
  }

  /// Recomputes now rather than waiting for the next tick. Call from
  /// `didChangeAppLifecycleState` on resume so the first frame after
  /// returning to the app is already correct.
  void refresh() => onTick();

  void dispose() {
    _timer?.cancel();
    _timer = null;
  }
}
