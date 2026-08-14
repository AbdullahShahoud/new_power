import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/local/offline_queue_store.dart';
import '../../data/models/enums.dart';
import '../../data/models/queued_activity_record.dart';
import '../../data/models/sync_activities_request.dart';
import '../../data/repo/activities_repository.dart';
import 'offline_sync_event.dart';
import 'offline_sync_state.dart';

const _maxBatchSize = 100;

/// Phase 4 — the local activity queue + its replay through
/// `POST /activities/sync` (§10 Workflow 5). Registered as a lazy singleton
/// (not a per-screen factory like the other Blocs) because the queue has to
/// exist and be syncable regardless of which screen is open — a rep logging
/// offline from a project detail screen and a "pending sync" screen opened
/// later both need to see the same queue.
class OfflineSyncBloc extends Bloc<OfflineSyncEvent, OfflineSyncState> {
  final OfflineQueueStore _store;
  final ActivitiesRepository _activitiesRepository;

  OfflineSyncBloc(this._store, this._activitiesRepository)
    : super(const OfflineSyncState()) {
    on<OfflineQueueLoaded>(_onQueueLoaded);
    on<OfflineActivityQueued>(_onActivityQueued);
    on<OfflineSyncRequested>(_onSyncRequested);
    on<OfflineQueueItemDiscarded>(_onItemDiscarded);
    add(const OfflineSyncEvent.queueLoaded());
  }

  Future<void> _onQueueLoaded(
    OfflineQueueLoaded event,
    Emitter<OfflineSyncState> emit,
  ) async {
    await _store.open();
    emit(
      state.copyWith(
        queueStatus: OfflineQueueStatus.loaded,
        queuedItems: _store.getAll(),
      ),
    );
  }

  Future<void> _onActivityQueued(
    OfflineActivityQueued event,
    Emitter<OfflineSyncState> emit,
  ) async {
    final record = QueuedActivityRecord(
      item: event.item,
      queuedAt: DateTime.now(),
    );
    await _store.put(record);
    emit(state.copyWith(queuedItems: _store.getAll()));
  }

  Future<void> _onItemDiscarded(
    OfflineQueueItemDiscarded event,
    Emitter<OfflineSyncState> emit,
  ) async {
    await _store.remove(event.clientRef);
    emit(state.copyWith(queuedItems: _store.getAll()));
  }

  /// Chunks at the documented `1…100` items per `POST /activities/sync`
  /// call, processing sequentially so a mid-way connectivity drop leaves
  /// already-synced chunks applied and the rest untouched in the queue —
  /// "retrying the whole batch is always safe" (idempotent on `clientRef`),
  /// so the next attempt just picks up where this one left off.
  Future<void> _onSyncRequested(
    OfflineSyncRequested event,
    Emitter<OfflineSyncState> emit,
  ) async {
    if (state.syncStatus == OfflineSyncStatus.syncing) return;
    var pending = state.queuedItems;
    if (pending.isEmpty) return;

    emit(state.copyWith(syncStatus: OfflineSyncStatus.syncing));

    var created = 0;
    var duplicates = 0;
    var rejected = 0;

    while (pending.isNotEmpty) {
      final chunk = pending.take(_maxBatchSize).toList();
      final result = await _activitiesRepository.syncBatch(
        SyncActivitiesRequest(items: chunk.map((r) => r.item).toList()),
      );
      switch (result) {
        case Success(data: final syncResult):
          for (final itemResult in syncResult.results) {
            final record = chunk.firstWhere(
              (r) => r.item.clientRef == itemResult.clientRef,
              orElse: () => chunk.first,
            );
            switch (itemResult.status) {
              case SyncItemStatus.created:
                await _store.remove(record.item.clientRef);
                created++;
              case SyncItemStatus.duplicate:
                await _store.remove(record.item.clientRef);
                duplicates++;
              case SyncItemStatus.rejected:
                await _store.put(
                  record.copyWith(
                    lastErrorCode: itemResult.error?.code,
                    lastErrorMessage: itemResult.error?.message,
                  ),
                );
                rejected++;
            }
          }
          emit(state.copyWith(queuedItems: _store.getAll()));
        case Failure():
          // Connectivity dropped again mid-sync (or a genuine server
          // error) — stop here, leave the rest of the queue as-is, and let
          // the next trigger (manual or reconnect) pick up where this left
          // off.
          emit(
            state.copyWith(
              syncStatus: OfflineSyncStatus.offline,
              queuedItems: _store.getAll(),
            ),
          );
          return;
      }
      pending = pending.skip(_maxBatchSize).toList();
    }

    emit(
      state.copyWith(
        syncStatus: OfflineSyncStatus.success,
        lastSyncAt: DateTime.now(),
        lastSyncCreated: created,
        lastSyncDuplicates: duplicates,
        lastSyncRejected: rejected,
      ),
    );
  }
}
