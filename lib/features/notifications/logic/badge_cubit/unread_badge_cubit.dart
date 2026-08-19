import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/repo/notifications_repository.dart';

/// The unread badge — **one state object, two placements** (the bell on the
/// Home tab and anywhere else a count is shown). Registered as a lazy
/// singleton so the two can never disagree or fetch twice.
///
/// ⚠️ **Deliberately not a poller.** §9.2: the 30-request-per-minute budget
/// is shared with the catalogue and directory, and a 30-second timer burns
/// 2 req/min forever — colliding with a rep browsing products, where a
/// single category open already costs 2. The count is write-through cached
/// server-side (invalidated by every mutation *and* by the producer of every
/// new notification), so refreshing on events is exactly as fresh as polling
/// and costs a fraction as much.
///
/// Refresh triggers: app start · resume (debounced) · FCM received · after
/// any local mutation · inbox opened.
class UnreadBadgeCubit extends Cubit<int> {
  final NotificationsRepository _repository;

  UnreadBadgeCubit(this._repository) : super(0);

  DateTime? _lastFetch;

  /// Minimum gap between resume-triggered refreshes. §9.2 asks for ≥ 30 s;
  /// a rep flicking between apps would otherwise spend the budget on a
  /// number that has not changed.
  static const _resumeDebounce = Duration(seconds: 30);

  Future<void> refresh({bool debounced = false}) async {
    if (debounced && _lastFetch != null) {
      if (DateTime.now().difference(_lastFetch!) < _resumeDebounce) return;
    }
    _lastFetch = DateTime.now();

    final result = await _repository.unreadCount();
    if (isClosed) return;
    if (result is Success<int>) emit(result.data);
    // A failure leaves the last known count on screen. The badge is
    // ambient: replacing a stale number with a zero or an error state would
    // be a worse lie than showing the previous value.
  }

  /// Applied immediately on a local read/archive so the badge responds in
  /// the same frame, then reconciled by a [refresh].
  void decrement([int by = 1]) {
    final next = state - by;
    emit(next < 0 ? 0 : next);
  }

  /// After `read-all`. The server's own `count` is never used for this —
  /// it includes archived rows and can exceed what the rep could see.
  void clear() => emit(0);
}
