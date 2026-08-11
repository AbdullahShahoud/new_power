import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_response_meta.dart';
import 'project_image_view.dart';

part 'project_images_response.freezed.dart';
part 'project_images_response.g.dart';

/// §5 `POST /projects/{id}/images` — `201 Created`, `data` is a bare
/// `ProjectImageView[]` (the newly added images only, not the whole
/// gallery). Not paginated (§1.3's two explicit exceptions).
@freezed
abstract class ProjectImagesResponse with _$ProjectImagesResponse {
  const factory ProjectImagesResponse({
    bool? success,
    String? message,
    @Default(<ProjectImageView>[]) List<ProjectImageView> data,
    ApiResponseMeta? meta,
  }) = _ProjectImagesResponse;

  factory ProjectImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectImagesResponseFromJson(json);
}
