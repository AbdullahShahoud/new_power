import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_response_meta.dart';
import 'activity_view.dart';
import 'actor_view.dart';

part 'activities_list_response.freezed.dart';
part 'activities_list_response.g.dart';

/// §5 `GET /projects/{projectId}/activities` and `GET /activities` — same
/// envelope, `pagination` a sibling of `data` (§1.3), newest first by
/// `occurredAt`.
@freezed
abstract class ActivitiesListResponse with _$ActivitiesListResponse {
  const factory ActivitiesListResponse({
    bool? success,
    String? message,
    @Default(<ActivityView>[]) List<ActivityView> data,
    required PaginationMeta pagination,
    ApiResponseMeta? meta,
  }) = _ActivitiesListResponse;

  factory ActivitiesListResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivitiesListResponseFromJson(json);
}
