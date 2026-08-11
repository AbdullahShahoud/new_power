import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_response_meta.dart';
import 'project_view.dart';

part 'project_response.freezed.dart';
part 'project_response.g.dart';

/// §5 — `data` is a bare `ProjectView` (no images, no counts). Shared by
/// `PATCH /projects/{id}`, `PUT …/stage`, `PUT …/status`, `PUT …/location` —
/// all four return exactly this shape.
@freezed
abstract class ProjectResponse with _$ProjectResponse {
  const factory ProjectResponse({
    bool? success,
    String? message,
    required ProjectView data,
    ApiResponseMeta? meta,
  }) = _ProjectResponse;

  factory ProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectResponseFromJson(json);
}
