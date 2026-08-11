import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_response_meta.dart';
import 'activity_view.dart';

part 'log_activity_response.freezed.dart';
part 'log_activity_response.g.dart';

/// §5 `POST /projects/{projectId}/activities` — `201 Created`. `suggestion`
/// is `"SET_DORMANT"` when `outcome === WORK_STOPPED`, else `null` — an
/// offer for the UI to show, never something the server already did.
@freezed
abstract class LogActivityData with _$LogActivityData {
  const factory LogActivityData({
    required ActivityView activity,
    String? suggestion,
  }) = _LogActivityData;

  factory LogActivityData.fromJson(Map<String, dynamic> json) =>
      _$LogActivityDataFromJson(json);
}

@freezed
abstract class LogActivityResponse with _$LogActivityResponse {
  const factory LogActivityResponse({
    bool? success,
    String? message,
    required LogActivityData data,
    ApiResponseMeta? meta,
  }) = _LogActivityResponse;

  factory LogActivityResponse.fromJson(Map<String, dynamic> json) =>
      _$LogActivityResponseFromJson(json);
}
