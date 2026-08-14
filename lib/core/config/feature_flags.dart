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
  /// Flip to `true` to bring the whole feature back — no other edits.
  static bool offlineSyncEnabled = false;
}
