import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/models/notification_enums.dart';
import '../../data/models/notification_responses.dart';
import '../../data/models/notification_view.dart';
import '../../data/repo/notifications_repository.dart';
import '../badge_cubit/unread_badge_cubit.dart';
import 'inbox_event.dart';
import 'inbox_state.dart';

/// The inbox.
///
/// Holds a reference to [UnreadBadgeCubit] rather than letting the screen
/// juggle both: every mutation here changes the badge, and routing that
/// through the UI would mean each screen remembering to keep the two in
/// step. The badge is a lazy singleton, so this is the same instance the
/// bell reads.
class InboxBloc extends Bloc<InboxEvent, InboxState> {
  final NotificationsRepository _repository;
  final UnreadBadgeCubit _badge;

  /// Open undo windows, keyed by notification id. Cancelling one is what
  /// "undo" does — the `DELETE` was never sent.
  final Map<String, Timer> _archiveTimers = {};

  /// §3.7 of the UI spec. Long enough to notice the snackbar, short enough
  /// that the pending-request queue stays trivial.
  static const undoWindow = Duration(seconds: 4);

  static const _pageSize = 20;

  InboxBloc(this._repository, this._badge) : super(const InboxState()) {
    on<InboxOpened>((_, emit) => _load(emit));
    on<InboxRefreshed>((_, emit) => _load(emit));
    on<InboxFilterChanged>(_onFilterChanged);
    on<InboxNextPageRequested>(_onNextPage);
    on<InboxReadRequested>(_onRead);
    on<InboxReadAllRequested>(_onReadAll);
    on<InboxArchiveRequested>(_onArchiveRequested);
    on<InboxArchiveUndone>(_onArchiveUndone);
    on<InboxArchiveCommitted>(_onArchiveCommitted);
  }

  @override
  Future<void> close() {
    // Any window still open when the screen closes has already removed its
    // row locally; firing the DELETE keeps the server in step rather than
    // silently resurrecting the row on the next fetch.
    for (final entry in _archiveTimers.entries) {
      entry.value.cancel();
      _repository.archive(entry.key);
    }
    _archiveTimers.clear();
    return super.close();
  }

  Future<void> _load(Emitter<InboxState> emit) async {
    emit(state.copyWith(status: InboxStatus.loading, errorMessage: null));

    final result = await _repository.list(
      page: 1,
      limit: _pageSize,
      type: state.filter.type,
    );
    if (emit.isDone) return;

    if (result is Failure<NotificationsListResponse>) {
      emit(
        state.copyWith(
          status: InboxStatus.networkError,
          errorMessage: result.error.message,
        ),
      );
      return;
    }

    final response = (result as Success<NotificationsListResponse>).data;
    // A row whose undo window is still open must not reappear just because
    // the server still has it.
    final rows = response.data
        .where((n) => !state.pendingArchive.contains(n.id))
        .toList();

    emit(
      state.copyWith(
        // An empty inbox is a 200 with `data: []` — an empty state, never
        // an error screen.
        status: rows.isEmpty ? InboxStatus.empty : InboxStatus.loaded,
        notifications: rows,
        page: response.pagination?.page ?? 1,
        totalPages: response.pagination?.totalPages ?? 0,
        isLoadingMore: false,
      ),
    );
  }

  Future<void> _onFilterChanged(
    InboxFilterChanged event,
    Emitter<InboxState> emit,
  ) async {
    if (event.filter == state.filter) return;
    // Paging restarts with the filter — carrying `page` over would request
    // page 2 of a result set that no longer exists.
    emit(state.copyWith(filter: event.filter, page: 1, totalPages: 0));
    await _load(emit);
  }

  Future<void> _onNextPage(
    InboxNextPageRequested event,
    Emitter<InboxState> emit,
  ) async {
    if (state.isLoadingMore || !state.hasMore) return;
    if (state.status != InboxStatus.loaded) return;

    emit(state.copyWith(isLoadingMore: true));
    final next = state.page + 1;
    final result = await _repository.list(
      page: next,
      limit: _pageSize,
      type: state.filter.type,
    );
    if (emit.isDone) return;

    if (result is Failure<NotificationsListResponse>) {
      // Keep what is on screen; a failed append is not a reason to lose the
      // pages already scrolled through.
      emit(
        state.copyWith(
          isLoadingMore: false,
          errorMessage: result.error.message,
        ),
      );
      return;
    }

    final response = (result as Success<NotificationsListResponse>).data;
    emit(
      state.copyWith(
        notifications: [
          ...state.notifications,
          ...response.data.where((n) => !state.pendingArchive.contains(n.id)),
        ],
        page: response.pagination?.page ?? next,
        totalPages: response.pagination?.totalPages ?? state.totalPages,
        isLoadingMore: false,
      ),
    );
  }

  Future<void> _onRead(
    InboxReadRequested event,
    Emitter<InboxState> emit,
  ) async {
    final index = state.notifications.indexWhere((n) => n.id == event.id);
    if (index < 0) return;
    final target = state.notifications[index];
    if (!target.isUnread) return;

    // Optimistic: the dot clears now, the request follows. `readAt` is set
    // locally too so the tile does not flicker when the response lands.
    final rows = [...state.notifications];
    rows[index] = target.copyWith(
      status: NotificationStatus.read,
      readAt: DateTime.now(),
    );
    emit(state.copyWith(notifications: rows));
    _badge.decrement();

    final result = await _repository.markRead(event.id);
    if (emit.isDone) return;

    if (result is Failure<NotificationView?>) {
      if (NotificationErrorCodes.isMissing(result.error.code)) {
        // §9.1 — the row is gone (likely archived on another device). Drop
        // it without an error dialog; this is a normal race.
        emit(
          state.copyWith(
            notifications: state.notifications
                .where((n) => n.id != event.id)
                .toList(),
          ),
        );
      }
    }
    await _badge.refresh();
  }

  Future<void> _onReadAll(
    InboxReadAllRequested event,
    Emitter<InboxState> emit,
  ) async {
    final now = DateTime.now();
    emit(
      state.copyWith(
        notifications: state.notifications
            .map(
              (n) => n.isUnread
                  ? n.copyWith(status: NotificationStatus.read, readAt: now)
                  : n,
            )
            .toList(),
      ),
    );
    _badge.clear();

    await _repository.markAllRead();
    // The server's `count` is deliberately ignored — it includes archived
    // rows and can exceed what the rep could see, so it is never displayed
    // and never used to set the badge. Reconcile with the real count.
    await _badge.refresh();
  }

  void _onArchiveRequested(
    InboxArchiveRequested event,
    Emitter<InboxState> emit,
  ) {
    final target = state.notifications
        .where((n) => n.id == event.id)
        .firstOrNull;
    if (target == null) return;

    // Removed from view immediately; nothing is sent yet. Archive is
    // irreversible server-side, so the undo window exists precisely so the
    // request can still be cancelled rather than compensated.
    emit(
      state.copyWith(
        notifications: state.notifications
            .where((n) => n.id != event.id)
            .toList(),
        pendingArchive: {...state.pendingArchive, event.id},
      ),
    );

    // Archiving an *unread* row drops the badge without marking it read —
    // the count filters `archivedAt: null`, not `status`.
    if (target.isUnread) _badge.decrement();

    _archiveTimers[event.id]?.cancel();
    _archiveTimers[event.id] = Timer(
      undoWindow,
      () => add(InboxEvent.archiveCommitted(event.id)),
    );
  }

  Future<void> _onArchiveUndone(
    InboxArchiveUndone event,
    Emitter<InboxState> emit,
  ) async {
    _archiveTimers.remove(event.id)?.cancel();
    emit(
      state.copyWith(
        pendingArchive: {...state.pendingArchive}..remove(event.id),
      ),
    );
    // Nothing was sent, so restoring is a re-read rather than an un-archive
    // (there is no un-archive route to call).
    await _load(emit);
    await _badge.refresh();
  }

  Future<void> _onArchiveCommitted(
    InboxArchiveCommitted event,
    Emitter<InboxState> emit,
  ) async {
    _archiveTimers.remove(event.id)?.cancel();
    final result = await _repository.archive(event.id);
    if (emit.isDone) return;

    emit(
      state.copyWith(
        pendingArchive: {...state.pendingArchive}..remove(event.id),
        // The list may now be empty — say so rather than showing a blank.
        status: state.notifications.isEmpty && state.page == 1
            ? InboxStatus.empty
            : state.status,
      ),
    );
    if (result is Success<void>) await _badge.refresh();
  }
}
