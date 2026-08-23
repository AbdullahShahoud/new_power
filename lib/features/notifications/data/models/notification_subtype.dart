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

  /// Every row renders the **server's own** `title`/`message`.
  ///
  /// ⚠️ This used to be true only for admin broadcasts, with a client-side
  /// Arabic map keyed on the sub-type covering everything else. That is now
  /// wrong. A notification is stored as a template key plus its parameters
  /// and is rendered on the way out against the reader's `language`
  /// preference, so the text arrives already localised — and the client
  /// checklist is explicit: "display title/message verbatim, never
  /// translate client-side".
  ///
  /// A local map would now actively lose information: template parameters
  /// carry manager names, territory codes and project titles that this app
  /// never receives, so a mapped string could only ever be the generic
  /// version of a sentence the server already personalised.
  bool get rendersServerText => true;
}

/// Where tapping a row goes.
///
/// ⚠️ Resolved from **`metadata`**, never from `title`. The checklist is
/// explicit about this, and the reason is now structural: titles are
/// server-rendered in the reader's language, so any string match would
/// break the moment a rep switches to Arabic — or the moment the backend
/// edits a template.
enum NotificationDestination {
  none,
  securityPassword,
  securityTwoFactor,

  /// `metadata.projectId` — the four-eyes settlement loop. An outcome
  /// submitted / confirmed / rejected all point at the project; `outcomeId`
  /// narrows to the row inside it.
  project,
}

/// The deep-link target for one notification.
///
/// Takes the whole row rather than just the sub-type: the project link is
/// carried by `metadata`, which the sub-type derivation does not preserve.
NotificationDestination destinationOf(NotificationView notification) {
  // A project link wins over anything the sub-type implies — it is the only
  // destination the server actually hands us an id for.
  final projectId = notification.metadata?['projectId'];
  if (projectId is String && projectId.isNotEmpty) {
    return NotificationDestination.project;
  }
  return switch (resolveSubType(notification)) {
    NotificationSubType.passwordChanged ||
    NotificationSubType.passwordReset ||
    NotificationSubType.adminPasswordReset =>
      NotificationDestination.securityPassword,
    NotificationSubType.twoFactorEnabled =>
      NotificationDestination.securityTwoFactor,
    _ => NotificationDestination.none,
  };
}

/// The project a notification points at, when it points at one.
String? projectIdOf(NotificationView notification) {
  final value = notification.metadata?['projectId'];
  return value is String && value.isNotEmpty ? value : null;
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
