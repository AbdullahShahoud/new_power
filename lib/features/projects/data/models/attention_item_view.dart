import 'package:freezed_annotation/freezed_annotation.dart';
import 'enums.dart';

part 'attention_item_view.freezed.dart';
part 'attention_item_view.g.dart';

/// §5 `GET /projects/needs-attention` row — the rep's home screen, one
/// entry per project, most urgent first. `message` is composed server-side
/// **in Arabic** — render it verbatim, never rebuild it from
/// `reason`/`daysWaiting`. `reason` stays machine-readable for icons and
/// grouping.
///
/// ⚠️ This endpoint is currently shadowed by `GET /projects/{id}` on the
/// backend (§12 — confirmed by test, unfixed) — every call returns
/// `400 VALIDATION_ERROR`. This model/the repository method that parses it
/// are implemented against the documented contract so nothing needs
/// reworking once the backend fixes controller ordering, but the Home tab
/// does not call this yet (projects-implementation-map.md §10.2).
@freezed
abstract class AttentionItemView with _$AttentionItemView {
  const factory AttentionItemView({
    required String projectId,
    required String name,
    required AttentionReason reason,
    required String message,
    DateTime? dueAt,
    required int daysWaiting,
  }) = _AttentionItemView;

  factory AttentionItemView.fromJson(Map<String, dynamic> json) =>
      _$AttentionItemViewFromJson(json);
}
