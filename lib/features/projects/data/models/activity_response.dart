import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_response_meta.dart';
import 'activity_view.dart';

part 'activity_response.freezed.dart';
part 'activity_response.g.dart';

/// §5 `PATCH /activities/{id}` — `data` is a bare `ActivityView`.
@freezed
abstract class ActivityResponse with _$ActivityResponse {
  const factory ActivityResponse({
    bool? success,
    String? message,
    required ActivityView data,
    ApiResponseMeta? meta,
  }) = _ActivityResponse;

  factory ActivityResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivityResponseFromJson(json);
}
