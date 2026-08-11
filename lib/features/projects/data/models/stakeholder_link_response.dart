import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_response_meta.dart';
import 'stakeholder_link_view.dart';

part 'stakeholder_link_response.freezed.dart';
part 'stakeholder_link_response.g.dart';

/// stakeholders.md — `data` is a bare `StakeholderLinkView`. Shared by
/// `POST`, `PATCH`, `DELETE`, `.../replace`.
@freezed
abstract class StakeholderLinkResponse with _$StakeholderLinkResponse {
  const factory StakeholderLinkResponse({
    bool? success,
    String? message,
    required StakeholderLinkView data,
    ApiResponseMeta? meta,
  }) = _StakeholderLinkResponse;

  factory StakeholderLinkResponse.fromJson(Map<String, dynamic> json) =>
      _$StakeholderLinkResponseFromJson(json);
}

/// `GET /projects/{projectId}/stakeholders` — no pagination documented (a
/// project's stakeholder roster is small, same reasoning as the embedded
/// `ProjectDetailView.stakeholders` array it mirrors).
@freezed
abstract class StakeholderLinksListResponse
    with _$StakeholderLinksListResponse {
  const factory StakeholderLinksListResponse({
    bool? success,
    String? message,
    @Default(<StakeholderLinkView>[]) List<StakeholderLinkView> data,
    ApiResponseMeta? meta,
  }) = _StakeholderLinksListResponse;

  factory StakeholderLinksListResponse.fromJson(Map<String, dynamic> json) =>
      _$StakeholderLinksListResponseFromJson(json);
}
