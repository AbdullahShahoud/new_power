import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_response_meta.dart';
// Not a `show` import: freezed's generated copyWith references
// `$PaginationMetaCopyWith`, which a narrowed import hides.
import '../../../projects/data/models/actor_view.dart';
import 'notification_view.dart';

part 'notification_responses.freezed.dart';
part 'notification_responses.g.dart';

/// §4.2 `GET /notifications` — `pagination` is a **sibling of `data`**, not
/// nested inside it.
///
/// ⚠️ Three paginated shapes now exist in this API and must not share one
/// parser: the catalogue nests everything under `data` with no `pagination`
/// key at all; the directory and notifications both use this sibling form.
/// The field names here are identical to the directory's, so the existing
/// [PaginationMeta] is reused rather than duplicated — only the key *order*
/// differs, which JSON does not care about.
@freezed
abstract class NotificationsListResponse with _$NotificationsListResponse {
  const factory NotificationsListResponse({
    bool? success,
    String? message,
    @Default(<NotificationView>[]) List<NotificationView> data,
    PaginationMeta? pagination,
    ApiResponseMeta? meta,
  }) = _NotificationsListResponse;

  factory NotificationsListResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationsListResponseFromJson(json);
}

/// §6.2 / §6.5 — both the badge and `read-all` answer `{ count: int }`.
@freezed
abstract class NotificationCountData with _$NotificationCountData {
  const factory NotificationCountData({@Default(0) int count}) =
      _NotificationCountData;

  factory NotificationCountData.fromJson(Map<String, dynamic> json) =>
      _$NotificationCountDataFromJson(json);
}

@freezed
abstract class NotificationCountResponse with _$NotificationCountResponse {
  const factory NotificationCountResponse({
    bool? success,
    String? message,
    required NotificationCountData data,
    ApiResponseMeta? meta,
  }) = _NotificationCountResponse;

  factory NotificationCountResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationCountResponseFromJson(json);
}

/// §6.4 `PATCH /{id}/read` — the only route that returns the full row.
@freezed
abstract class NotificationDetailResponse with _$NotificationDetailResponse {
  const factory NotificationDetailResponse({
    bool? success,
    String? message,
    NotificationView? data,
    ApiResponseMeta? meta,
  }) = _NotificationDetailResponse;

  factory NotificationDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationDetailResponseFromJson(json);
}

/// §6.6 `DELETE /notifications/{id}` — ⚠️ carries **no `data` key at all**.
/// It is omitted from the JSON rather than sent as null, so the parser has
/// to tolerate its absence; that is why this response has no `data` field.
@freezed
abstract class NotificationActionResponse with _$NotificationActionResponse {
  const factory NotificationActionResponse({
    bool? success,
    String? message,
    ApiResponseMeta? meta,
  }) = _NotificationActionResponse;

  factory NotificationActionResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationActionResponseFromJson(json);
}

/// §6.7 / §6.8 — `{ registered: true }` / `{ removed: true }`. Modelled as
/// one shape because the caller only needs "it worked".
@freezed
abstract class FcmTokenResponse with _$FcmTokenResponse {
  const factory FcmTokenResponse({
    bool? success,
    String? message,
    ApiResponseMeta? meta,
  }) = _FcmTokenResponse;

  factory FcmTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$FcmTokenResponseFromJson(json);
}

/// §6.7 body. ⚠️ The server's character class is **strict**: letters,
/// digits, `_`, `:` and `-` only, max 1024 chars. A `/`, `.`, `+` or `=`
/// anywhere in the token is a 400.
@freezed
abstract class RegisterFcmTokenRequest with _$RegisterFcmTokenRequest {
  const factory RegisterFcmTokenRequest({required String fcmToken}) =
      _RegisterFcmTokenRequest;

  factory RegisterFcmTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterFcmTokenRequestFromJson(json);
}

/// Client-side mirror of the server's `@Matches` rule, so a malformed token
/// is caught before it costs a request against the 30/60s budget.
final RegExp kFcmTokenPattern = RegExp(r'^[A-Za-z0-9_:\-]+$');

@freezed
abstract class NotificationPreferencesResponse
    with _$NotificationPreferencesResponse {
  const factory NotificationPreferencesResponse({
    bool? success,
    String? message,
    required NotificationPreferencesView data,
    ApiResponseMeta? meta,
  }) = _NotificationPreferencesResponse;

  factory NotificationPreferencesResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$NotificationPreferencesResponseFromJson(json);
}
