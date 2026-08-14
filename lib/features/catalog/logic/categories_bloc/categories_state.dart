import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/category_view.dart';

part 'categories_state.freezed.dart';

enum CategoriesStatus { initial, loading, loaded, empty, networkError }

/// How the tree renders. The user's choice, offered **only** on the tree —
/// the product list keeps its grid, where the image is what a rep scans by.
enum CategoryViewMode { grid, list }

@freezed
sealed class CategoriesState with _$CategoriesState {
  const factory CategoriesState({
    @Default(CategoriesStatus.initial) CategoriesStatus status,

    /// Root nodes with `children` populated (`?tree=true`).
    @Default(<CategoryView>[]) List<CategoryView> roots,
    String? errorMessage,

    /// True when the failure was `CATALOG_NO_PUBLISHED_VERSION`. The
    /// taxonomy itself is **not** version-gated, so this can only arrive
    /// from a sibling call — the state carries it so the screen shows
    /// "catalogue not available yet" rather than a generic network error.
    @Default(false) bool catalogUnavailable,

    // ── one category (child screen) ──────────────────────────────────
    @Default(CategoriesStatus.initial) CategoriesStatus detailStatus,
    GetCategoryResultView? selected,
    String? detailErrorMessage,

    @Default(CategoryViewMode.grid) CategoryViewMode viewMode,
  }) = _CategoriesState;
}
