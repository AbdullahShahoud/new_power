import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/notification_enums.dart';

part 'inbox_event.freezed.dart';

@freezed
sealed class InboxEvent with _$InboxEvent {
  /// First page. Also used by pull-to-refresh.
  const factory InboxEvent.opened() = InboxOpened;
  const factory InboxEvent.refreshed() = InboxRefreshed;

  /// ⚠️ Resets to `page=1` — §S1: paging must restart whenever the chip
  /// changes, or page 2 of the old filter lands under page 1 of the new one.
  const factory InboxEvent.filterChanged(NotificationFilter filter) =
      InboxFilterChanged;

  const factory InboxEvent.nextPageRequested() = InboxNextPageRequested;

  /// Optimistic: the dot clears in the same frame and the request is fired
  /// after. Reverted only if the row turns out to be gone.
  const factory InboxEvent.readRequested(String id) = InboxReadRequested;

  const factory InboxEvent.readAllRequested() = InboxReadAllRequested;

  /// Removes the row locally and starts the undo window — the `DELETE` is
  /// **not** sent yet.
  const factory InboxEvent.archiveRequested(String id) = InboxArchiveRequested;

  /// Puts the row back and cancels the pending request. Nothing was ever
  /// sent, so there is nothing to undo server-side.
  const factory InboxEvent.archiveUndone(String id) = InboxArchiveUndone;

  /// Fired when the undo window closes — this is what actually calls the
  /// API.
  const factory InboxEvent.archiveCommitted(String id) = InboxArchiveCommitted;
}
