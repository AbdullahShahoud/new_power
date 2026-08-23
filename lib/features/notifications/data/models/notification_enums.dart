import 'package:json_annotation/json_annotation.dart';

/// notifications-client-reference.md §1.2 — **exactly three types**, each
/// mapping to one toggle on the preferences screen.
///
/// ⚠️ The earlier contract declared seven. `TRANSACTION`,
/// `MESSAGE_RECEIVED` and the two `PAYMENT_REQUEST_*` values were e-wallet
/// leftovers and are **gone**: the doc is explicit that the server now
/// answers `400 VALIDATION_ERROR` for `GET /notifications?type=TRANSACTION`,
/// so keeping them would hand a rep a filter chip that breaks the screen.
enum NotificationType {
  /// Password changed, 2FA enabled, account suspended / banned /
  /// reactivated, admin password reset.
  @JsonValue('SECURITY')
  security,

  /// Everything operational: approvals, transfers, outcome settlement,
  /// territory assignment.
  @JsonValue('SYSTEM')
  system,

  /// Admin broadcasts only. **Off by default** in preferences.
  @JsonValue('MARKETING')
  marketing,

  /// Anything the backend adds before this app ships an update.
  @JsonValue(null)
  unknown,
}

extension NotificationTypeX on NotificationType {
  String get wireValue => switch (this) {
    NotificationType.security => 'SECURITY',
    NotificationType.system => 'SYSTEM',
    NotificationType.marketing => 'MARKETING',
    NotificationType.unknown => 'UNKNOWN',
  };

  String get labelKey => switch (this) {
    NotificationType.security => 'notifications_type_security',
    NotificationType.system => 'notifications_type_system',
    NotificationType.marketing => 'notifications_type_marketing',
    NotificationType.unknown => 'notifications_type_other',
  };
}


/// §11 `NotificationStatus`.
///
/// ⚠️ `ARCHIVED` is **declared but unreachable**: archiving sets
/// `archivedAt`, never `status`, and `?status=ARCHIVED` returns an empty
/// page because the query hard-codes `archivedAt: null`. Modelled for
/// forward-compatibility; the UI branches on two.
enum NotificationStatus {
  @JsonValue('UNREAD')
  unread,
  @JsonValue('READ')
  read,
  @JsonValue('ARCHIVED')
  archived,
  @JsonValue(null)
  unknown,
}

/// The chips on the inbox. Three, because three is the whole live taxonomy
/// (§1.1 of the UI spec) — a seven-way filter bar would advertise types
/// nothing emits.
enum NotificationFilter { all, security, system, marketing }

extension NotificationFilterX on NotificationFilter {
  /// `null` means "send no `type` parameter at all".
  NotificationType? get type => switch (this) {
    NotificationFilter.all => null,
    NotificationFilter.security => NotificationType.security,
    NotificationFilter.system => NotificationType.system,
    NotificationFilter.marketing => NotificationType.marketing,
  };

  String get labelKey => switch (this) {
    NotificationFilter.all => 'notifications_filter_all',
    NotificationFilter.security => 'notifications_type_security',
    NotificationFilter.system => 'notifications_type_system',
    NotificationFilter.marketing => 'notifications_type_marketing',
  };
}
