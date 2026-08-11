import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_response_meta.dart';
import 'register_project_result.dart';

part 'register_project_response.freezed.dart';
part 'register_project_response.g.dart';

/// §5 `POST /projects` — `201 Created`, `data` is `RegisterProjectResult`.
@freezed
abstract class RegisterProjectResponse with _$RegisterProjectResponse {
  const factory RegisterProjectResponse({
    bool? success,
    String? message,
    required RegisterProjectResult data,
    ApiResponseMeta? meta,
  }) = _RegisterProjectResponse;

  factory RegisterProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterProjectResponseFromJson(json);
}
