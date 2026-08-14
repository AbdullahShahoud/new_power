import 'package:freezed_annotation/freezed_annotation.dart';

import 'localized.dart';

part 'category_view.freezed.dart';
part 'category_view.g.dart';

/// §8.5 `CategoryRefView` — the light shape carried inside product
/// responses. No counts.
@freezed
abstract class CategoryRefView with _$CategoryRefView {
  const factory CategoryRefView({
    required String id,
    required String slug,
    required Localized name,
    required String path,
  }) = _CategoryRefView;

  factory CategoryRefView.fromJson(Map<String, dynamic> json) =>
      _$CategoryRefViewFromJson(json);
}

/// §7.4 `CategoryView` — the full taxonomy node.
///
/// ⚠️ **Both counts exclude published-version membership** while
/// `GET /products?category=X` requires it, so a count can legitimately
/// exceed the number of products the list returns (BR-8). They are
/// navigation hints — never render one as a total beside a result set.
///
/// Both are needed: 15 products sit directly on root categories, so a UI
/// showing only `subtreeProductCount` leaves those unexplained, and one
/// showing only `productCount` renders most branches as empty.
@freezed
abstract class CategoryView with _$CategoryView {
  const factory CategoryView({
    required String id,
    required String slug,
    required Localized name,
    required String path,
    String? parentId,
    Localized? description,
    String? imageUrl,
    @Default(0) int depth,
    @Default(0) int sortOrder,
    @Default(0) int productCount,
    @Default(0) int subtreeProductCount,

    /// Present only under `?tree=true`. **Absent** (not null) in flat mode.
    List<CategoryView>? children,
  }) = _CategoryView;

  factory CategoryView.fromJson(Map<String, dynamic> json) =>
      _$CategoryViewFromJson(json);
}

extension CategoryViewX on CategoryView {
  bool get hasChildren => (children?.isNotEmpty ?? false);

  /// The count worth showing on a browse card: a branch advertises its whole
  /// subtree, a leaf its own shelf.
  int get browseCount =>
      subtreeProductCount > productCount ? subtreeProductCount : productCount;

  /// §7.4 — `path` is a materialised trail of **ancestor slugs**, so a
  /// breadcrumb needs no extra call.
  List<String> get pathSegments =>
      path.split('/').where((s) => s.isNotEmpty).toList();
}

/// §7.6 `GetCategoryResultView`.
///
/// ⚠️ `breadcrumb` here holds **ancestors only** — the category itself is
/// stripped server-side, unlike the product detail's breadcrumb which
/// includes self. Append `category.name` yourself. The two conventions must
/// not share one widget without normalising (§7.9).
@freezed
abstract class GetCategoryResultView with _$GetCategoryResultView {
  const factory GetCategoryResultView({
    required CategoryView category,
    @Default(<CategoryView>[]) List<CategoryView> breadcrumb,
    @Default(<CategoryView>[]) List<CategoryView> children,
  }) = _GetCategoryResultView;

  factory GetCategoryResultView.fromJson(Map<String, dynamic> json) =>
      _$GetCategoryResultViewFromJson(json);
}
