import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_response_meta.dart';
import 'actor_view.dart';
import 'nearby_project_card_view.dart';
import 'project_view.dart';

part 'projects_list_response.freezed.dart';
part 'projects_list_response.g.dart';

/// §5 `GET /projects` — `pagination` is a sibling of `data`, not nested
/// inside it (§1.3).
@freezed
abstract class ProjectsListResponse with _$ProjectsListResponse {
  const factory ProjectsListResponse({
    bool? success,
    String? message,
    @Default(<ProjectSummaryView>[]) List<ProjectSummaryView> data,
    required PaginationMeta pagination,
    ApiResponseMeta? meta,
  }) = _ProjectsListResponse;

  factory ProjectsListResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectsListResponseFromJson(json);
}

/// §5 `GET /projects/nearby` — same envelope shape as [ProjectsListResponse]
/// but a different row type ([NearbyProjectCardView] is deliberately not a
/// `ProjectSummaryView`, §9), so it isn't the same generic class.
@freezed
abstract class NearbyProjectsResponse with _$NearbyProjectsResponse {
  const factory NearbyProjectsResponse({
    bool? success,
    String? message,
    @Default(<NearbyProjectCardView>[]) List<NearbyProjectCardView> data,
    required PaginationMeta pagination,
    ApiResponseMeta? meta,
  }) = _NearbyProjectsResponse;

  factory NearbyProjectsResponse.fromJson(Map<String, dynamic> json) =>
      _$NearbyProjectsResponseFromJson(json);
}
