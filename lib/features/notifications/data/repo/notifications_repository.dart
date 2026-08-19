import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/notification_enums.dart';
import '../models/notification_responses.dart';
import '../models/notification_view.dart';

/// The `error.code` values worth branching on (§5.1).
class NotificationErrorCodes {
  NotificationErrorCodes._();

  /// Unknown id **or** another user's row — the two are deliberately
  /// indistinguishable. Drop the row locally and refresh; never show a
  /// dialog, it is a normal race (the row may have been archived on another
  /// device).
  static const String notFound = 'NOTIFICATION_NOT_FOUND';

  /// ⚠️ Dead code server-side: both mutations resolve the row through a
  /// query whose `where` already includes `userId`, so another user's row
  /// returns null and raises 404 first. Handled defensively; expect 404.
  static const String accessDenied = 'NOTIFICATION_ACCESS_DENIED';

  static const String rateLimited = 'RATE_LIMIT_EXCEEDED';

  static bool isMissing(String? code) =>
      code == notFound || code == accessDenied;
}

/// The notification inbox, badge and FCM token lifecycle.
///
/// Every mutation here is **replay-safe** after a 401 refresh (§9.4):
/// marking read twice, archiving twice and re-registering the same token
/// are all effectively idempotent — unlike the directory's creates.
class NotificationsRepository {
  final ApiService _apiService;

  NotificationsRepository(this._apiService);

  /// §6.1 — the inbox, **excluding archived rows**.
  ///
  /// `status` is deliberately not exposed as a parameter. The only value a
  /// client could usefully pass is `ARCHIVED`, and the query hard-codes
  /// `archivedAt: null` before ANDing the filter on top — so it can only
  /// ever return an empty page. Offering it would build an unreachable tab.
  Future<ApiResult<NotificationsListResponse>> list({
    int page = 1,
    int limit = 20,
    NotificationType? type,
  }) async {
    try {
      final response = await _apiService.getNotifications(
        page: page,
        // The server rejects `limit > 100` with a 400; clamping here keeps a
        // caller's mistake from costing a request against the shared budget.
        limit: limit.clamp(1, 100),
        type: type?.wireValue,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// §6.2 — the badge.
  ///
  /// The count is **write-through cached** server-side: the Redis key is
  /// deleted on every mutation *and* by the producer of every new
  /// notification, with the 5-minute TTL acting only as a safety net for a
  /// missed invalidation. So an event-driven refresh is exactly as fresh as
  /// polling would be, at a fraction of the 30-request budget.
  Future<ApiResult<int>> unreadCount() async {
    try {
      final response = await _apiService.getUnreadCount();
      return ApiResult.success(response.data.count);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// §6.4 — mark one read.
  ///
  /// ⚠️ Not idempotent in *effect*: re-reading an already-read row
  /// overwrites `readAt` with a fresh timestamp — there is no "if unread"
  /// guard. Harmless, but `readAt` is not "the first time the user saw it".
  Future<ApiResult<NotificationView?>> markRead(String id) async {
    try {
      final response = await _apiService.markNotificationRead(id);
      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// §6.5 — mark everything read.
  ///
  /// ⚠️ The returned `count` is **not** displayable. `markAllAsRead` filters
  /// on `{userId, status: UNREAD}` with no `archivedAt: null`, unlike every
  /// other query in the module — so it also marks archived rows and the
  /// count can exceed what the rep could ever see. The caller treats this as
  /// "done" and reconciles with [unreadCount].
  Future<ApiResult<void>> markAllRead() async {
    try {
      await _apiService.markAllNotificationsRead();
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// §6.6 — archive (soft-delete).
  ///
  /// ⚠️ **Irreversible from the client.** There is no un-archive route and
  /// no way to list archived rows, so this is a permanent delete in every
  /// sense that matters to the UI.
  ///
  /// It sets `archivedAt` and leaves `status` untouched — so archiving an
  /// unread row drops the badge (the count filters `archivedAt: null`)
  /// *without* marking it read.
  Future<ApiResult<void>> archive(String id) async {
    try {
      await _apiService.archiveNotification(id);
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// §6.3 — preferences.
  ///
  /// **Read-only.** `UpdatePreferencesDto` and
  /// `NotificationPreferenceService.updatePreferences()` both exist
  /// server-side but **no controller route calls them**, so there is no
  /// update counterpart to write here. Kept because the read works and is
  /// the one call a future settings screen would need first.
  Future<ApiResult<NotificationPreferencesView>> preferences() async {
    try {
      final response = await _apiService.getNotificationPreferences();
      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// §6.7 — bind a push token to this (user, device).
  ///
  /// Must be called on **every app start**, not just first login: when
  /// Firebase reports a token as unregistered the backend nulls the stored
  /// value, so a reinstalled app silently stops receiving push until it
  /// re-registers.
  Future<ApiResult<void>> registerFcmToken(String token) async {
    try {
      final trimmed = token.trim();
      // Mirrors the server's own `@Matches` + `@MaxLength(1024)`. Checked
      // here so a malformed token fails locally instead of spending one of
      // the 30 requests per minute on a guaranteed 400.
      if (trimmed.isEmpty ||
          trimmed.length > 1024 ||
          !kFcmTokenPattern.hasMatch(trimmed)) {
        throw ArgumentError('Malformed FCM token');
      }
      await _apiService.registerFcmToken(
        RegisterFcmTokenRequest(fcmToken: trimmed),
      );
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// §6.8 — clear this device's token.
  ///
  /// ⚠️ Order matters on logout: this needs a valid access token, so it must
  /// run **before** `POST /auth/logout`, not after.
  Future<ApiResult<void>> deleteFcmToken() async {
    try {
      await _apiService.deleteFcmToken();
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
