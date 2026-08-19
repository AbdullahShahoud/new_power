import 'package:flutter/foundation.dart';

import 'catalog_enums.dart';

/// The complete set of parameters that define one product result set.
///
/// §7.5 is emphatic that `/categories/filters` must receive the **same**
/// `category` / `includeSubtree` / `attr` / `q` as `/products` — the rail is
/// only meaningful when its result set matches the list's. Keeping them in
/// one immutable object is what makes that structurally hard to get wrong:
/// both repository calls take this same value.
@immutable
class ProductQuery {
  /// Category **id or slug**.
  final String? category;
  final bool includeSubtree;

  /// Raw user input. §11.1 — do **not** pre-normalise or strip punctuation;
  /// the server ports its own `normKey` verbatim and any client-side
  /// cleanup risks diverging from it.
  final String? q;

  /// `attr[CODE]` → the comma-joined token list, already escaped.
  final Map<String, List<String>> attributes;

  final ProductSort? sort;

  final bool? hasDatasheet;
  final bool? available;
  final int page;
  final int limit;

  const ProductQuery({
    this.category,
    this.includeSubtree = true,
    this.q,
    this.attributes = const {},
    this.sort,
    this.hasDatasheet,
    this.available,
    this.page = 1,
    this.limit = 20,
  });

  /// §11.2 — the server drops a `q` under 2 characters and silently returns
  /// an unfiltered list. A UI must never present that as a search result, so
  /// the gate is applied here, once, rather than at each call site.
  String? get effectiveQuery {
    final trimmed = q?.trim() ?? '';
    return trimmed.length >= 2 ? trimmed : null;
  }

  /// True when anything narrows the result set beyond the category and the
  /// search term — the dynamic `attr` rail **or** any of the fixed filters.
  bool get hasFilters =>
      attributes.isNotEmpty ||
      hasDatasheet == true ||
      available != null;

  int get appliedFilterCount =>
      attributes.values.fold(0, (sum, values) => sum + values.length) +
      (hasDatasheet == true ? 1 : 0) +
      (available != null ? 1 : 0);

  /// §7.7 — the default is `relevance` with a usable `q`, `name` otherwise.
  /// `relevance` without a term is silently downgraded server-side, so
  /// sending it would misreport the active sort back to the user.
  ProductSort get effectiveSort {
    if (sort != null) {
      if (sort == ProductSort.relevance && effectiveQuery == null) {
        return ProductSort.name;
      }
      return sort!;
    }
    return effectiveQuery != null ? ProductSort.relevance : ProductSort.name;
  }

  /// §4.3 — Dio's default `ListFormat` cannot produce `attr[KEY]=value` from
  /// a `Map`, so the map is flattened by hand. Top-level `?POWER=…` is not
  /// an option: `forbidNonWhitelisted` would 400 on all 100 attribute codes.
  ///
  /// §12.3 — values within one attribute are comma-joined (**OR**), while
  /// separate attributes **AND** together.
  Map<String, dynamic> toQueryParameters() {
    final params = <String, dynamic>{
      'page': page,
      'limit': limit,
      'includeSubtree': includeSubtree,
      'sort': effectiveSort.wireValue,
    };
    if (category != null) params['category'] = category;
    final search = effectiveQuery;
    if (search != null) params['q'] = search;
    if (hasDatasheet == true) params['hasDatasheet'] = true;
    if (available != null) params['available'] = available;
    attributes.forEach((code, values) {
      if (values.isEmpty) return;
      params['attr[$code]'] = values.join(',');
    });
    return params;
  }

  /// The rail's parameters: the same result set, minus paging and sorting
  /// (which don't affect facet counts and would only be dead weight).
  Map<String, dynamic> toFilterQueryParameters() {
    final params = <String, dynamic>{'includeSubtree': includeSubtree};
    if (category != null) params['category'] = category;
    final search = effectiveQuery;
    if (search != null) params['q'] = search;
    // ⚠️ `hasDatasheet` / `available` are deliberately NOT sent here.
    // `CategoryFiltersQueryDto` binds only `category`, `includeSubtree`,
    // `attr` and `q`, and the pipe runs with `forbidNonWhitelisted: true` —
    // so any extra key is a 400 `VALIDATION_ERROR`, not a silent strip
    // §2.2).
    //
    // The cost is that facet counts are computed *without* them, so they can
    // overstate what the list returns once they are applied. The server
    // offers no way to narrow them, so the rail's counts are treated as the
    // approximations they are rather than as promises.
    attributes.forEach((code, values) {
      if (values.isEmpty) return;
      params["attr[$code]"] = values.join(",");
    });
    return params;
  }

  ProductQuery copyWith({
    Object? category = _sentinel,
    bool? includeSubtree,
    Object? q = _sentinel,
    Map<String, List<String>>? attributes,
    Object? sort = _sentinel,
    Object? hasDatasheet = _sentinel,
    Object? available = _sentinel,
    int? page,
    int? limit,
  }) {
    return ProductQuery(
      category: category == _sentinel ? this.category : category as String?,
      includeSubtree: includeSubtree ?? this.includeSubtree,
      q: q == _sentinel ? this.q : q as String?,
      attributes: attributes ?? this.attributes,
      sort: sort == _sentinel ? this.sort : sort as ProductSort?,
      hasDatasheet: hasDatasheet == _sentinel
          ? this.hasDatasheet
          : hasDatasheet as bool?,
      available: available == _sentinel ? this.available : available as bool?,
      page: page ?? this.page,
      limit: limit ?? this.limit,
    );
  }

  /// Toggles one option of one attribute, resetting to page 1 — §7.7 says
  /// **any** change to `q`/`category`/`attr`/`sort`/flags must reset paging.
  ProductQuery toggleAttribute(String code, String optionCode) {
    final next = {
      for (final entry in attributes.entries) entry.key: [...entry.value],
    };
    final values = next.putIfAbsent(code, () => <String>[]);
    if (values.contains(optionCode)) {
      values.remove(optionCode);
      if (values.isEmpty) next.remove(code);
    } else {
      values.add(optionCode);
    }
    return copyWith(attributes: next, page: 1);
  }

  /// Replaces an attribute's whole value list — used by the RANGE slider,
  /// which emits exactly one `lo..hi` token.
  ProductQuery setAttribute(String code, List<String> values) {
    final next = {
      for (final entry in attributes.entries) entry.key: [...entry.value],
    };
    if (values.isEmpty) {
      next.remove(code);
    } else {
      next[code] = values;
    }
    return copyWith(attributes: next, page: 1);
  }

  /// §19.3 — the recovery step for `CATALOG_UNKNOWN_FILTER_ATTRIBUTE` /
  /// `CATALOG_INVALID_FILTER_VALUE`: drop the offending attribute, retry
  /// **once**, then rebuild the rail.
  ProductQuery withoutAttribute(String code) {
    if (!attributes.containsKey(code)) return this;
    final next = {
      for (final entry in attributes.entries)
        if (entry.key != code) entry.key: [...entry.value],
    };
    return copyWith(attributes: next, page: 1);
  }

  /// "Clear all" means every filter, the fixed ones included — leaving an
  /// availability or datasheet filter silently applied behind a cleared rail
  /// is exactly the confusion the button exists to prevent.
  ProductQuery cleared() => copyWith(
    attributes: const {},
    hasDatasheet: null,
    available: null,
    page: 1,
  );

  static const _sentinel = Object();

  @override
  bool operator ==(Object other) =>
      other is ProductQuery &&
      other.category == category &&
      other.includeSubtree == includeSubtree &&
      other.q == q &&
      other.sort == sort &&
      other.hasDatasheet == hasDatasheet &&
      other.available == available &&
      other.page == page &&
      other.limit == limit &&
      mapEquals(
        other.attributes.map((k, v) => MapEntry(k, v.join(','))),
        attributes.map((k, v) => MapEntry(k, v.join(','))),
      );

  @override
  int get hashCode => Object.hash(
    category,
    includeSubtree,
    q,
    sort,
    hasDatasheet,
    available,
    page,
    limit,
    attributes.entries.map((e) => '${e.key}=${e.value.join(',')}').join('&'),
  );
}
