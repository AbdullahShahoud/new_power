import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_response_meta.dart';
import 'account_view.dart';
import 'actor_view.dart';

part 'accounts_list_response.freezed.dart';
part 'accounts_list_response.g.dart';

/// stakeholders.md `GET /accounts` — `pagination` a sibling of `data` (same
/// envelope shape as every paginated list elsewhere in this app).
@freezed
abstract class AccountsListResponse with _$AccountsListResponse {
  const factory AccountsListResponse({
    bool? success,
    String? message,
    @Default(<AccountView>[]) List<AccountView> data,
    required PaginationMeta pagination,
    ApiResponseMeta? meta,
  }) = _AccountsListResponse;

  factory AccountsListResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountsListResponseFromJson(json);
}
