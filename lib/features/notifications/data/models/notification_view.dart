// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/utc_date_time_converter.dart';
import 'notification_enums.dart';

part 'notification_view.freezed.dart';
part 'notification_view.g.dart';

/// §10 `Notification` — modelled on the **list projection**, which is the
/// canonical shape.
///
/// ⚠️ §4.3: the same resource comes back in three different shapes.
/// `GET /notifications` selects 7 fields; `PATCH /{id}/read` returns the
/// full Prisma row (7 + `userId`, `archivedAt`, `updatedAt`); `DELETE`
/// returns no `data` key at all. The three extra fields are therefore
/// **optional here** — they are absent from every list read, so nothing may
/// depend on them.
@freezed
abstract class NotificationView with _$NotificationView {
  @JsonSerializable(converters: [UtcDateTimeConverter()])
  const factory NotificationView({
    /// ⚠️ A **cuid**, not a uuid. The routes carry no `ParseUUIDPipe`, so
    /// never validate it as one.
    required String id,
    @JsonKey(unknownEnumValue: NotificationType.unknown)
    @Default(NotificationType.unknown)
    NotificationType type,
    @JsonKey(unknownEnumValue: NotificationStatus.unknown)
    @Default(NotificationStatus.unknown)
    NotificationStatus status,

    /// **English only** — every template is hard-coded English server-side.
    /// The UI renders an Arabic replacement keyed on the derived sub-type;
    /// see `NotificationPresentation`.
    @Default('') String title,
    @Default('') String message,

    /// Free-form and **shape-varying per event**, and it can be `null`
    /// outright (any broadcast sent without metadata). Every lookup must be
    /// null-safe — a tile has to render correctly with `metadata: null`.
    Map<String, dynamic>? metadata,
    DateTime? readAt,
    DateTime? createdAt,

    // ── present ONLY on `PATCH /{id}/read` ──────────────────────────
    String? userId,
    DateTime? archivedAt,
    DateTime? updatedAt,
  }) = _NotificationView;

  factory NotificationView.fromJson(Map<String, dynamic> json) =>
      _$NotificationViewFromJson(json);
}

extension NotificationViewX on NotificationView {
  bool get isUnread => status == NotificationStatus.unread;
}

/// The language a rep's notifications are rendered in.
///
/// ⚠️ This is **not** the app's UI language. It governs notification text
/// only — not API errors, not email, not the catalogue (which ships both
/// languages on every response and is switched client-side).
enum NotificationLanguage {
  @JsonValue('EN')
  en,
  @JsonValue('AR')
  ar,
}

extension NotificationLanguageX on NotificationLanguage {
  /// The server accepts either case (`"ar"` and `"AR"` both work); upper
  /// case matches what it returns, so a round-trip compares equal.
  String get wireValue => this == NotificationLanguage.ar ? 'AR' : 'EN';

  String get labelKey => this == NotificationLanguage.ar
      ? 'notifications_language_ar'
      : 'notifications_language_en';
}

/// `GET`/`PATCH /notifications/preferences`.
///
/// Four mute switches and a language. `transactionEnabled` is **gone** — the
/// type it governed no longer exists.
@freezed
abstract class NotificationPreferencesView
    with _$NotificationPreferencesView {
  const factory NotificationPreferencesView({
    @Default(true) bool securityEnabled,
    @Default(true) bool systemEnabled,

    /// Admin broadcasts. **Off by default**, which is why the settings
    /// screen shows it as genuinely off rather than assuming true.
    @Default(false) bool marketingEnabled,

    /// Narrower than the others: it suppresses the **push only**. The in-app
    /// row is still written, so the inbox stays complete.
    @Default(true) bool pushEnabled,
    @Default(NotificationLanguage.en) NotificationLanguage language,
  }) = _NotificationPreferencesView;

  factory NotificationPreferencesView.fromJson(Map<String, dynamic> json) =>
      _$NotificationPreferencesViewFromJson(json);
}

/// `PATCH /notifications/preferences` — **every field optional**, send only
/// what changed. A language switch is a one-key body.
///
/// `includeIfNull: false` is what makes that true on the wire: without it
/// every untouched switch would be sent as `null` and the partial update
/// would stop being partial.
@freezed
abstract class UpdateNotificationPreferencesRequest
    with _$UpdateNotificationPreferencesRequest {
  @JsonSerializable(includeIfNull: false)
  const factory UpdateNotificationPreferencesRequest({
    bool? securityEnabled,
    bool? systemEnabled,
    bool? marketingEnabled,
    bool? pushEnabled,
    NotificationLanguage? language,
  }) = _UpdateNotificationPreferencesRequest;

  factory UpdateNotificationPreferencesRequest.fromJson(
    Map<String, dynamic> json,
  ) => _$UpdateNotificationPreferencesRequestFromJson(json);
}
