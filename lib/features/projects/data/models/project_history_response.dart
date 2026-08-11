import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_response_meta.dart';
import 'actor_view.dart';
import 'project_history_entry_view.dart';

part 'project_history_response.freezed.dart';
part 'project_history_response.g.dart';

/// §5 `GET /projects/{id}/history` — paginated, `pagination` sibling of
/// `data` (§1.3). Entries discriminate on `kind` (`STAGE`/`STATUS`).
@freezed
abstract class ProjectHistoryResponse with _$ProjectHistoryResponse {
  const factory ProjectHistoryResponse({
    bool? success,
    String? message,
    @Default(<ProjectHistoryEntryView>[]) List<ProjectHistoryEntryView> data,
    required PaginationMeta pagination,
    ApiResponseMeta? meta,
  }) = _ProjectHistoryResponse;

  factory ProjectHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectHistoryResponseFromJson(json);
}
