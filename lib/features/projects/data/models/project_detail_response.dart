import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_response_meta.dart';
import 'project_detail_view.dart';

part 'project_detail_response.freezed.dart';
part 'project_detail_response.g.dart';

/// §5 `GET /projects/{id}` — `data` is `ProjectDetailView`.
@freezed
abstract class ProjectDetailResponse with _$ProjectDetailResponse {
  const factory ProjectDetailResponse({
    bool? success,
    String? message,
    required ProjectDetailView data,
    ApiResponseMeta? meta,
  }) = _ProjectDetailResponse;

  factory ProjectDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectDetailResponseFromJson(json);
}
