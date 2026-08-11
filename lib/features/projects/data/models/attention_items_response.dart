import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_response_meta.dart';
import 'attention_item_view.dart';

part 'attention_items_response.freezed.dart';
part 'attention_items_response.g.dart';

/// §5 `GET /projects/needs-attention` — `data` is a bare
/// `AttentionItemView[]`. **No pagination** (§1.3's second explicit
/// exception, alongside `POST /projects/{id}/images`).
@freezed
abstract class AttentionItemsResponse with _$AttentionItemsResponse {
  const factory AttentionItemsResponse({
    bool? success,
    String? message,
    @Default(<AttentionItemView>[]) List<AttentionItemView> data,
    ApiResponseMeta? meta,
  }) = _AttentionItemsResponse;

  factory AttentionItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$AttentionItemsResponseFromJson(json);
}
