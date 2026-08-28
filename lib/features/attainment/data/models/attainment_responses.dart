import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_response_meta.dart';
import 'attainment_view.dart';

part 'attainment_responses.freezed.dart';
part 'attainment_responses.g.dart';

/// `GET /attainment/me` (§2).
///
/// The global `TransformResponseInterceptor` envelope, with **no
/// `pagination` key** — `targets` is a complete list, so nothing here pages.
///
/// `message` is human prose ("Attainment retrieved successfully") and is
/// deliberately not modelled as anything to branch on.
@freezed
abstract class MyAttainmentResponse with _$MyAttainmentResponse {
  const factory MyAttainmentResponse({
    bool? success,
    String? message,

    /// Never `null` on a 200 — an absent target is `targets: []`, not a
    /// missing payload.
    @Default(MyAttainmentView()) MyAttainmentView data,
    ApiResponseMeta? meta,
  }) = _MyAttainmentResponse;

  factory MyAttainmentResponse.fromJson(Map<String, dynamic> json) =>
      _$MyAttainmentResponseFromJson(json);
}
