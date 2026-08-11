import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_response_meta.dart';
import 'outcome_view.dart';

part 'outcome_response.freezed.dart';
part 'outcome_response.g.dart';

/// §5 — `data` is a bare `OutcomeView`. Shared by `POST …/won`, `POST
/// …/lost`, `GET /outcomes/{id}`, `POST …/confirm`, `POST …/reject` — all
/// five return exactly this shape.
@freezed
abstract class OutcomeResponse with _$OutcomeResponse {
  const factory OutcomeResponse({
    bool? success,
    String? message,
    required OutcomeView data,
    ApiResponseMeta? meta,
  }) = _OutcomeResponse;

  factory OutcomeResponse.fromJson(Map<String, dynamic> json) =>
      _$OutcomeResponseFromJson(json);
}
