import 'package:freezed_annotation/freezed_annotation.dart';
import 'stored_file.dart';

part 'add_project_images_request.freezed.dart';
part 'add_project_images_request.g.dart';

/// §5 `POST /projects/{id}/images` body — `1 … 10 items`, each a
/// `ProjectFileRefDto`.
@freezed
abstract class AddProjectImagesRequest with _$AddProjectImagesRequest {
  const factory AddProjectImagesRequest({
    required List<ProjectFileRefDto> files,
  }) = _AddProjectImagesRequest;

  factory AddProjectImagesRequest.fromJson(Map<String, dynamic> json) =>
      _$AddProjectImagesRequestFromJson(json);
}

extension AddProjectImagesRequestValidation on AddProjectImagesRequest {
  void validate() {
    if (files.isEmpty || files.length > 10) {
      throw ArgumentError('files must contain 1-10 items');
    }
    for (final file in files) {
      file.validate();
    }
  }
}
