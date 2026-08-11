import 'package:freezed_annotation/freezed_annotation.dart';
import 'enums.dart';

part 'sync_activities_result.freezed.dart';
part 'sync_activities_result.g.dart';

/// §6 — per-item outcome of `POST /activities/sync`. `error` carries any
/// code from §11, plus the sync-only `ACTIVITY_SYNC_FAILED` (the one code
/// worth retrying later — every other rejection means "fix and resubmit as
/// a new item").
@freezed
abstract class SyncActivityItemResult with _$SyncActivityItemResult {
  const factory SyncActivityItemResult({
    required String clientRef,
    required SyncItemStatus status,
    String? activityId,
    SyncActivityItemError? error,
  }) = _SyncActivityItemResult;

  factory SyncActivityItemResult.fromJson(Map<String, dynamic> json) =>
      _$SyncActivityItemResultFromJson(json);
}

@freezed
abstract class SyncActivityItemError with _$SyncActivityItemError {
  const factory SyncActivityItemError({
    required String code,
    required String message,
  }) = _SyncActivityItemError;

  factory SyncActivityItemError.fromJson(Map<String, dynamic> json) =>
      _$SyncActivityItemErrorFromJson(json);
}

/// §6 `POST /activities/sync` — `data`. Idempotency comes from `clientRef`;
/// match results to inputs by it, never by array order. Always `200`, never
/// all-or-nothing — a full replay after a dropped response is always safe.
@freezed
abstract class SyncActivitiesResult with _$SyncActivitiesResult {
  const factory SyncActivitiesResult({
    @Default(<SyncActivityItemResult>[]) List<SyncActivityItemResult> results,
    required int created,
    required int duplicates,
    required int rejected,
  }) = _SyncActivitiesResult;

  factory SyncActivitiesResult.fromJson(Map<String, dynamic> json) =>
      _$SyncActivitiesResultFromJson(json);
}
