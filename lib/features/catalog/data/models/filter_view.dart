// `@JsonKey` on a freezed constructor parameter is the documented way to
// reach the generated field; the analyzer flags the target anyway.
// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import 'catalog_enums.dart';
import 'localized.dart';

part 'filter_view.freezed.dart';
part 'filter_view.g.dart';

/// §8.7 `FilterOptionView`.
@freezed
abstract class FilterOptionView with _$FilterOptionView {
  const factory FilterOptionView({
    /// ⚠️ **Send this back verbatim.** It is already comma-escaped and
    /// round-trips through the parser unchanged. Never compose one yourself
    /// — a NUMBER option arrives as `65~65` (identity) and rewriting it as
    /// `65` silently switches to overlap matching, which returns more rows
    /// than the count advertised (§12.4).
    required String code,
    required Localized label,

    /// Distinct **products**, not value rows.
    @Default(0) int count,
  }) = _FilterOptionView;

  factory FilterOptionView.fromJson(Map<String, dynamic> json) =>
      _$FilterOptionViewFromJson(json);
}

/// §8.7 `FilterRange` — the observed span **within the current result set**,
/// so it narrows as other filters are applied.
@freezed
abstract class FilterRange with _$FilterRange {
  const factory FilterRange({required num min, required num max}) =
      _FilterRange;

  factory FilterRange.fromJson(Map<String, dynamic> json) =>
      _$FilterRangeFromJson(json);
}

/// §7.5 `FilterView` — one rail entry.
///
/// ⚠️ **Switch on [strategy], never on [type].** The backend is explicit
/// about why: a client that switches on `type` "will put a slider on
/// IP_RATING, which is the bug this field exists to end". `IP_RATING` is
/// stored as `NUMBER` but rendered `DISCRETE`; `VOLTAGE` is `DISCRETE` in
/// one category and `RANGE` across a subtree.
@freezed
abstract class FilterView with _$FilterView {
  const factory FilterView({
    /// Send back as `attr[CODE]`.
    required String code,
    required Localized label,

    /// Storage type — picks **formatting and filter syntax**.
    @JsonKey(unknownEnumValue: AttributeType.unknown)
    @Default(AttributeType.unknown)
    AttributeType type,

    /// **Picks the control.**
    @JsonKey(unknownEnumValue: FilterStrategy.unknown)
    @Default(FilterStrategy.unknown)
    FilterStrategy strategy,
    String? unit,

    /// DISCRETE only.
    List<FilterOptionView>? options,

    /// DISCRETE only; **absent** when false. More distinct values exist than
    /// the returned 24 — show a search box, not a complete list.
    @Default(false) bool truncated,

    /// RANGE only.
    FilterRange? range,

    /// Products in the current result set carrying this attribute **at all**.
    /// ⚠️ Not the sum of the option counts — a two-tone fitting carries two
    /// colours and is one product.
    @Default(0) int count,
  }) = _FilterView;

  factory FilterView.fromJson(Map<String, dynamic> json) =>
      _$FilterViewFromJson(json);
}

/// §7.5 `CategoryFiltersView`.
///
/// **Expect a thin rail, often.** Density is data, never hard-coded: Track
/// Light shows 110 products behind 3 filters; Down Light 64 behind 14. A
/// layout that assumes a full rail looks broken on the biggest category in
/// the catalogue.
@freezed
abstract class CategoryFiltersView with _$CategoryFiltersView {
  const factory CategoryFiltersView({
    /// Echo of the resolved category; `null` when `category` was omitted.
    String? categoryId,
    @Default(<FilterView>[]) List<FilterView> filters,
  }) = _CategoryFiltersView;

  factory CategoryFiltersView.fromJson(Map<String, dynamic> json) =>
      _$CategoryFiltersViewFromJson(json);
}
