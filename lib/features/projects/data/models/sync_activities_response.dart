import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_response_meta.dart';
import 'sync_activities_result.dart';

part 'sync_activities_response.freezed.dart';
part 'sync_activities_response.g.dart';

/// §6 `POST /activities/sync` — always `200`, never all-or-nothing.
@freezed
abstract class SyncActivitiesResponse with _$SyncActivitiesResponse {
  const factory SyncActivitiesResponse({
    bool? success,
    String? message,
    required SyncActivitiesResult data,
    ApiResponseMeta? meta,
  }) = _SyncActivitiesResponse;

  factory SyncActivitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$SyncActivitiesResponseFromJson(json);
}
