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

/// §10 `NotificationPreferences` — **read-only**. There is no
/// `PATCH`/`PUT /notifications/preferences` anywhere in the backend: the
/// DTO and the service method exist but no controller route calls them.
///
/// Modelled because `GET` works and the shape is confirmed, but no settings
/// screen is built on it — see the feature's README note.
@freezed
abstract class NotificationPreferencesView
    with _$NotificationPreferencesView {
  const factory NotificationPreferencesView({
    @Default(true) bool transactionEnabled,
    @Default(true) bool securityEnabled,
    @Default(true) bool systemEnabled,
    @Default(false) bool marketingEnabled,

    /// Governs the **push channel only** — the in-app row is written
    /// regardless.
    @Default(true) bool pushEnabled,
  }) = _NotificationPreferencesView;

  factory NotificationPreferencesView.fromJson(Map<String, dynamic> json) =>
      _$NotificationPreferencesViewFromJson(json);
}
