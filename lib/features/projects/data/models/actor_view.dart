import 'package:freezed_annotation/freezed_annotation.dart';

part 'actor_view.freezed.dart';
part 'actor_view.g.dart';

/// projects-client-reference.md §9. Always nullable where it appears — a
/// `null` `ActorView` means "that id no longer names an account", never "no
/// actor was recorded"; the raw id always sits beside it on the parent model.
/// Every `…By`/`…ByUser` field carrying this is stripped entirely for a
/// `REPRESENTATIVE` (§1.7), so callers must treat it as optional, not just
/// nullable.
@freezed
abstract class ActorView with _$ActorView {
  const factory ActorView({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
  }) = _ActorView;

  factory ActorView.fromJson(Map<String, dynamic> json) =>
      _$ActorViewFromJson(json);
}

@freezed
abstract class TerritoryRefView with _$TerritoryRefView {
  const factory TerritoryRefView({
    required String id,
    required String name,
    required String code,
  }) = _TerritoryRefView;

  factory TerritoryRefView.fromJson(Map<String, dynamic> json) =>
      _$TerritoryRefViewFromJson(json);
}

/// Sibling of `data` on every paginated list response (§1.3) — not nested
/// inside `data`. Shared by every paginated endpoint across every phase of
/// this module.
@freezed
abstract class PaginationMeta with _$PaginationMeta {
  const factory PaginationMeta({
    required int total,
    required int page,
    required int limit,
    required int totalPages,
  }) = _PaginationMeta;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);
}
