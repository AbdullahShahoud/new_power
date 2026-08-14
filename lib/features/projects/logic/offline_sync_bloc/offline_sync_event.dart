import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/sync_activity_item.dart';

part 'offline_sync_event.freezed.dart';

/// Phase 4 — projects-implementation-map.md §10 (Phase 4 scope note): a
/// local queue of activities logged while offline, replayed through
/// `POST /activities/sync` (§10 Workflow 5). Owns no endpoint of its own.
@freezed
sealed class OfflineSyncEvent with _$OfflineSyncEvent {
  /// Reads the persisted queue from `OfflineQueueStore` into state. Fired
  /// once by the Bloc itself on construction (it's a singleton, so there's
  /// no per-screen moment to hook this to).
  const factory OfflineSyncEvent.queueLoaded() = OfflineQueueLoaded;

  /// A log-activity attempt failed with a connectivity-class error
  /// (`ActivityMutationStatus.offline`) — captured locally instead of lost.
  const factory OfflineSyncEvent.activityQueued({
    required SyncActivityItem item,
  }) = OfflineActivityQueued;

  /// Replays the queue through `POST /activities/sync`, chunked at the
  /// documented `1…100` items per batch. Fired manually ("Sync now") or by
  /// the `connectivity_plus` listener wired in `main.dart` when the device
  /// comes back online.
  const factory OfflineSyncEvent.syncRequested() = OfflineSyncRequested;

  /// The rep drops a `REJECTED` record they don't intend to fix — "retrying
  /// unchanged will not help" (§10 Workflow 5), so this is a discard, not a
  /// retry.
  const factory OfflineSyncEvent.itemDiscarded(String clientRef) =
      OfflineQueueItemDiscarded;
}
