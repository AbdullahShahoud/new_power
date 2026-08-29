/// Runtime switches for behaviour that is deliberately off right now.
///
/// Deliberately **non-`const`**: a `const false` would make every gated
/// branch provably unreachable and the analyzer would report the suspended
/// code as dead. Plain statics keep it compiling, keep it warning-free, and
/// leave it flippable from one place (or from a debug menu later).
class FeatureFlags {
  FeatureFlags._();

  /// Offline capture + background sync (Phase 4).
  ///
  /// **Suspended, not removed.** Everything still exists and still
  /// compiles: `OfflineSyncBloc`, `OfflineQueueStore`, the Hive box, the
  /// `POST /activities/sync` repository call, `OfflineQueueScreen` and its
  /// route. Only the *entry points* are gated:
  ///
  ///   - `main.dart` doesn't start the connectivity listener
  ///   - `log_activity_screen.dart` doesn't silently queue a failed submit
  ///   - `profile_screen.dart` hides the pending-sync card
  ///   - `dio_factory.dart` lets a connection error fail instead of parking
  ///     the request
  ///
  /// ⚠️ **Do not flip this to `true` without first re-wiring the retry
  /// path.** The comment above was accurate when written and is no longer
  /// the whole story.
  ///
  /// `DioFactory._enqueueOfflineRequest` parks the `ErrorInterceptorHandler`
  /// for a failed GET instead of completing it, on the promise that
  /// `_retryOfflineQueue` will drain the queue when connectivity returns.
  /// Nothing calls `_retryOfflineQueue` — the analyzer reports it as
  /// unreferenced, because the connectivity subscription that used to invoke
  /// it does not exist in `DioFactory`. `main.dart`'s listener drives
  /// `OfflineSyncBloc` (the *activity* queue), which is a different queue
  /// entirely.
  ///
  /// So with this flag on, the first network blip parks every in-flight GET
  /// for the full three-minute `_offlineQueueTimeout` and then fails it. To
  /// the user that is an app which hangs for three minutes on a subway.
  ///
  /// Turning the feature back on means, at minimum:
  ///   1. subscribing to `Connectivity().onConnectivityChanged` inside
  ///      `DioFactory` and calling `_retryOfflineQueue()` from it, and
  ///   2. re-testing the hang path with airplane mode toggled mid-request.
  ///
  /// Verified shipping value: `false`. See finding S6 in RELEASE_PLAN.html.
  static bool offlineSyncEnabled = false;
}
