import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_response_meta.dart';
import 'activity_detail_view.dart';

part 'activity_detail_response.freezed.dart';
part 'activity_detail_response.g.dart';

/// §5 `GET /activities/{id}` — `data` is `ActivityDetailView`. Also the
/// response shape of `PATCH /activities/{id}`, except that one's `data` is
/// a bare `ActivityView` (no `revisions`) — see `activity_response.dart`.
@freezed
abstract class ActivityDetailResponse with _$ActivityDetailResponse {
  const factory ActivityDetailResponse({
    bool? success,
    String? message,
    required ActivityDetailView data,
    ApiResponseMeta? meta,
  }) = _ActivityDetailResponse;

  factory ActivityDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivityDetailResponseFromJson(json);
}
