import 'package:json_annotation/json_annotation.dart';

/// notifications-mobile-integration.md §11.
///
/// Seven values are declared server-side but **only `SECURITY` (6 events)
/// and `SYSTEM` (2 events) are ever emitted** — the rest are e-wallet
/// leftovers with no producer in this backend. They are modelled anyway
/// because an admin broadcast may carry any of them, but no type-specific
/// UI is built for them (§7.1).
enum NotificationType {
  @JsonValue('SECURITY')
  security,
  @JsonValue('SYSTEM')
  system,
  @JsonValue('TRANSACTION')
  transaction,
  @JsonValue('MARKETING')
  marketing,
  @JsonValue('MESSAGE_RECEIVED')
  messageReceived,
  @JsonValue('PAYMENT_REQUEST_RECEIVED')
  paymentRequestReceived,
  @JsonValue('PAYMENT_REQUEST_UPDATED')
  paymentRequestUpdated,

  /// Anything the backend adds before this app ships an update.
  @JsonValue(null)
  unknown,
}

extension NotificationTypeX on NotificationType {
  String get wireValue => switch (this) {
    NotificationType.security => 'SECURITY',
    NotificationType.system => 'SYSTEM',
    NotificationType.transaction => 'TRANSACTION',
    NotificationType.marketing => 'MARKETING',
    NotificationType.messageReceived => 'MESSAGE_RECEIVED',
    NotificationType.paymentRequestReceived => 'PAYMENT_REQUEST_RECEIVED',
    NotificationType.paymentRequestUpdated => 'PAYMENT_REQUEST_UPDATED',
    NotificationType.unknown => 'UNKNOWN',
  };

  String get labelKey => switch (this) {
    NotificationType.security => 'notifications_type_security',
    NotificationType.system => 'notifications_type_system',
    _ => 'notifications_type_other',
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
enum NotificationFilter { all, security, system }

extension NotificationFilterX on NotificationFilter {
  /// `null` means "send no `type` parameter at all".
  NotificationType? get type => switch (this) {
    NotificationFilter.all => null,
    NotificationFilter.security => NotificationType.security,
    NotificationFilter.system => NotificationType.system,
  };

  String get labelKey => switch (this) {
    NotificationFilter.all => 'notifications_filter_all',
    NotificationFilter.security => 'notifications_type_security',
    NotificationFilter.system => 'notifications_type_system',
  };
}
