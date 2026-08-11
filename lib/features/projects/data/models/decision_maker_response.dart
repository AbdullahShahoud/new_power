import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_response_meta.dart';
import 'actor_view.dart';
import 'decision_maker_history_entry.dart';
import 'decision_maker_view.dart';

part 'decision_maker_response.freezed.dart';
part 'decision_maker_response.g.dart';

/// stakeholders.md `GET/PUT/DELETE /projects/{projectId}/decision-maker` —
/// `data` is nullable directly: "returns `data: null` when none is flagged
/// — an ordinary state for a project at Lead, not an error."
@freezed
abstract class DecisionMakerResponse with _$DecisionMakerResponse {
  const factory DecisionMakerResponse({
    bool? success,
    String? message,
    DecisionMakerView? data,
    ApiResponseMeta? meta,
  }) = _DecisionMakerResponse;

  factory DecisionMakerResponse.fromJson(Map<String, dynamic> json) =>
      _$DecisionMakerResponseFromJson(json);
}

/// `GET /projects/{projectId}/decision-maker/history` — "paginated, because
/// the table is append-only."
@freezed
abstract class DecisionMakerHistoryResponse
    with _$DecisionMakerHistoryResponse {
  const factory DecisionMakerHistoryResponse({
    bool? success,
    String? message,
    @Default(<DecisionMakerHistoryEntry>[]) List<DecisionMakerHistoryEntry> data,
    required PaginationMeta pagination,
    ApiResponseMeta? meta,
  }) = _DecisionMakerHistoryResponse;

  factory DecisionMakerHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$DecisionMakerHistoryResponseFromJson(json);
}
