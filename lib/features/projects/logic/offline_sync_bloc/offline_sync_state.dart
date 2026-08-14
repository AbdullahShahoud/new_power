import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/queued_activity_record.dart';

part 'offline_sync_state.freezed.dart';

enum OfflineQueueStatus { loading, loaded }

enum OfflineSyncStatus { idle, syncing, success, offline, networkError }

/// One freezed state — the persisted queue and the in-flight sync attempt
/// are two views of the same Bloc-owned data, same reasoning as every other
/// module Bloc in this app (`ProjectsState`, `OutcomesState`, ...).
@freezed
sealed class OfflineSyncState with _$OfflineSyncState {
  const factory OfflineSyncState({
    @Default(OfflineQueueStatus.loading) OfflineQueueStatus queueStatus,
    @Default(<QueuedActivityRecord>[]) List<QueuedActivityRecord> queuedItems,
    @Default(OfflineSyncStatus.idle) OfflineSyncStatus syncStatus,
    DateTime? lastSyncAt,
    int? lastSyncCreated,
    int? lastSyncDuplicates,
    int? lastSyncRejected,
    String? syncErrorMessage,
  }) = _OfflineSyncState;
}
