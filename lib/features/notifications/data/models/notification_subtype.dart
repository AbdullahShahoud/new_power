import 'notification_view.dart';

/// §4.1 of the UI spec — the sub-event a notification actually describes.
///
/// The API gives the client **no icon, no colour, no severity and no
/// destination**; all four are derived from `type` + `metadata`. This enum
/// is the single discriminator everything else keys off, which is why the
/// Arabic strings are mapped from it rather than from `title` — a title is
/// a hard-coded English template that changes whenever the backend edits a
/// string, and matching on it would break silently.
enum NotificationSubType {
  accountApproved,
  passwordChanged,
  passwordReset,
  adminPasswordReset,
  twoFactorEnabled,
  accountSuspended,
  accountBanned,
  accountReactivated,

  /// Manager-only; a rep never receives it. Kept because the same build may
  /// one day serve both roles (UI spec UQ-5).
  repPendingApproval,

  /// The safe generic. Anything unresolved lands here — including every
  /// admin broadcast, whose text is typed by a human at runtime.
  broadcast,
}

/// §4.1's resolution order, kept exactly as documented.
///
/// ⚠️ The trap this encodes: `metadata['type']` is a **sub-event name**
/// (`PASSWORD_CHANGED`) while the row's own `type` column is the
/// **category** (`SECURITY`). Two different fields with the same name — they
/// must never be conflated.
NotificationSubType resolveSubType(NotificationView notification) {
  final metadata = notification.metadata;

  // `metadata` is `Json?` server-side and is genuinely null for any
  // broadcast sent without one.
  if (metadata == null || metadata.isEmpty) {
    return NotificationSubType.broadcast;
  }

  if (metadata['type'] == 'PASSWORD_CHANGED') {
    return NotificationSubType.passwordChanged;
  }
  if (metadata['type'] == 'TWO_FACTOR_ENABLED') {
    return NotificationSubType.twoFactorEnabled;
  }
  if (metadata['action'] == 'PASSWORD_RESET') {
    return NotificationSubType.passwordReset;
  }
  if (metadata['resetBy'] == 'admin') {
    return NotificationSubType.adminPasswordReset;
  }
  if (metadata.containsKey('approvedBy')) {
    return NotificationSubType.accountApproved;
  }
  if (metadata.containsKey('representativeId')) {
    return NotificationSubType.repPendingApproval;
  }
  if (metadata.containsKey('newStatus')) {
    switch (metadata['newStatus']) {
      case 'SUSPENDED':
        return NotificationSubType.accountSuspended;
      case 'BANNED':
        return NotificationSubType.accountBanned;
      case 'ACTIVE':
        return NotificationSubType.accountReactivated;
    }
  }
  return NotificationSubType.broadcast;
}

/// How loudly a row should read. Never expressed by colour alone — a
/// critical row also carries a distinct glyph and an inline-start bar, so
/// severity survives for a colour-blind rep (UI spec §10).
enum NotificationSeverity { critical, warning, positive, neutral }

extension NotificationSubTypeX on NotificationSubType {
  /// §4.2.
  NotificationSeverity get severity => switch (this) {
    NotificationSubType.accountSuspended ||
    NotificationSubType.accountBanned => NotificationSeverity.critical,
    NotificationSubType.adminPasswordReset ||
    NotificationSubType.passwordReset => NotificationSeverity.warning,
    NotificationSubType.twoFactorEnabled ||
    NotificationSubType.accountReactivated ||
    NotificationSubType.accountApproved => NotificationSeverity.positive,
    NotificationSubType.passwordChanged ||
    NotificationSubType.repPendingApproval ||
    NotificationSubType.broadcast => NotificationSeverity.neutral,
  };

  /// A broadcast's text is written by an admin at runtime, in whatever
  /// language they choose — it can never be mapped to Arabic and must be
  /// rendered verbatim, with its direction auto-detected.
  bool get rendersServerText => this == NotificationSubType.broadcast;

  String get titleKey => 'notification_${_slug}_title';
  String get bodyKey => 'notification_${_slug}_body';

  String get _slug => switch (this) {
    NotificationSubType.accountApproved => 'account_approved',
    NotificationSubType.passwordChanged => 'password_changed',
    NotificationSubType.passwordReset => 'password_reset',
    NotificationSubType.adminPasswordReset => 'admin_password_reset',
    NotificationSubType.twoFactorEnabled => 'two_factor_enabled',
    NotificationSubType.accountSuspended => 'account_suspended',
    NotificationSubType.accountBanned => 'account_banned',
    NotificationSubType.accountReactivated => 'account_reactivated',
    NotificationSubType.repPendingApproval => 'rep_pending_approval',
    NotificationSubType.broadcast => 'broadcast',
  };
}

/// §4.3 — where tapping a row goes.
///
/// ⚠️ Of the eight events a rep can receive, only the password and 2FA ones
/// have a real destination. "Account Approved", "Suspended", "Reactivated"
/// and broadcasts describe a state; they point nowhere. So a chevron is the
/// exception, not the default, and an unknown sub-type must never show one.
enum NotificationDestination { none, securityPassword, securityTwoFactor }

extension NotificationDestinationX on NotificationSubType {
  NotificationDestination get destination => switch (this) {
    NotificationSubType.passwordChanged ||
    NotificationSubType.passwordReset ||
    NotificationSubType.adminPasswordReset =>
      NotificationDestination.securityPassword,
    NotificationSubType.twoFactorEnabled =>
      NotificationDestination.securityTwoFactor,
    _ => NotificationDestination.none,
  };
}

/// §6.1 — which `metadata` keys are worth showing a rep.
///
/// ⚠️ Almost none. `approvedBy`, `adminId` and `representativeId` are raw
/// uuids with **no name resolution anywhere on this surface**, and a raw
/// uuid must never reach a rep's screen. `previousStatus`/`newStatus` are
/// already implied by the message, `timestamp` duplicates `createdAt`, and
/// `type`/`action`/`resetBy` are consumed by the derivation above.
///
/// That leaves exactly one renderable fact.
bool showsLoggedOutOtherSessions(NotificationView notification) =>
    notification.metadata?['loggedOutOtherSessions'] == true;
