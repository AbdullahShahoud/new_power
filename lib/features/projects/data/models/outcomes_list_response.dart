import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_response_meta.dart';
import 'actor_view.dart';
import 'outcome_view.dart';

part 'outcomes_list_response.freezed.dart';
part 'outcomes_list_response.g.dart';

/// §5 `GET /outcomes` — `pagination` a sibling of `data` (§1.3).
/// `?status=PENDING` returns oldest first — the manager's confirmation
/// queue, the one waiting longest surfaces first.
@freezed
abstract class OutcomesListResponse with _$OutcomesListResponse {
  const factory OutcomesListResponse({
    bool? success,
    String? message,
    @Default(<OutcomeView>[]) List<OutcomeView> data,
    required PaginationMeta pagination,
    ApiResponseMeta? meta,
  }) = _OutcomesListResponse;

  factory OutcomesListResponse.fromJson(Map<String, dynamic> json) =>
      _$OutcomesListResponseFromJson(json);
}
