import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/notification_enums.dart';
import '../../data/models/notification_view.dart';

part 'inbox_state.freezed.dart';

enum InboxStatus { initial, loading, loaded, empty, networkError }

@freezed
sealed class InboxState with _$InboxState {
  const factory InboxState({
    @Default(InboxStatus.initial) InboxStatus status,
    @Default(<NotificationView>[]) List<NotificationView> notifications,
    @Default(NotificationFilter.all) NotificationFilter filter,
    @Default(1) int page,
    @Default(0) int totalPages,
    @Default(false) bool isLoadingMore,
    String? errorMessage,

    /// Ids removed from the list but whose `DELETE` has not fired yet — the
    /// undo window is still open. Held so a rebuild cannot resurrect a row
    /// the rep already swiped away.
    @Default(<String>{}) Set<String> pendingArchive,
  }) = _InboxState;
}

extension InboxStateX on InboxState {
  bool get hasMore => page < totalPages;

  /// The empty state has to say different things depending on why it is
  /// empty: a genuinely empty inbox is reassuring, an empty *filter* needs
  /// a way back out.
  bool get isFilteredEmpty =>
      status == InboxStatus.empty && filter != NotificationFilter.all;
}
