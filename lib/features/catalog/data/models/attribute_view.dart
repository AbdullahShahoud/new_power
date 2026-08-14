// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import 'catalog_enums.dart';
import 'localized.dart';

part 'attribute_view.freezed.dart';
part 'attribute_view.g.dart';

/// §8.6 `AttributeOptionView`.
@freezed
abstract class AttributeOptionView with _$AttributeOptionView {
  const factory AttributeOptionView({
    required String id,

    /// The exact token to send back in `attr[CODE]=…`.
    required String code,
    required Localized label,
    @Default(0) int sortOrder,
  }) = _AttributeOptionView;

  factory AttributeOptionView.fromJson(Map<String, dynamic> json) =>
      _$AttributeOptionViewFromJson(json);
}

/// §7.1 `AttributeView` — the attribute dictionary, downloaded once.
///
/// Products carry an option **code**, never a label; this vocabulary is what
/// turns a stored `BLACK` into "Black"/"أسود". The endpoint's own
/// description calls it "download this once and hold it".
///
/// ⚠️ The vocabulary carries **no version or checksum of its own**, and
/// `manifestChecksum` hashes *product* payloads — so an admin renaming a
/// label produces no observable signal on any mobile endpoint. There is no
/// correct client-side invalidation trigger (§21-Q3); this app caches it per
/// session only.
@freezed
abstract class AttributeView with _$AttributeView {
  const factory AttributeView({
    required String id,

    /// **This is what you send as `attr[CODE]`** — filters key on the code,
    /// never the id.
    required String code,
    required Localized label,
    @JsonKey(unknownEnumValue: AttributeType.unknown)
    @Default(AttributeType.unknown)
    AttributeType dataType,
    String? canonicalUnit,

    /// NUMBER only. `0` = whole numbers, `null` = unconstrained.
    int? decimalPlaces,

    /// Global kill-switch — sending `attr[CODE]` for a non-filterable
    /// attribute is a 400.
    @Default(true) bool isFilterable,
    @Default(0) int sortOrder,

    /// Populated for ENUM; empty for NUMBER/TEXT.
    @Default(<AttributeOptionView>[]) List<AttributeOptionView> options,
  }) = _AttributeView;

  factory AttributeView.fromJson(Map<String, dynamic> json) =>
      _$AttributeViewFromJson(json);
}
