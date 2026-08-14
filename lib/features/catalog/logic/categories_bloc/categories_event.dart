import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_event.freezed.dart';

/// Backs the catalogue's browse surface: the root grid and any category
/// screen below it.
@freezed
sealed class CategoriesEvent with _$CategoriesEvent {
  /// `GET /categories?tree=true` — 43 rows, fetched once and held for the
  /// session. Cheap, and the tree is needed for navigation anyway; §19.4
  /// names caching it as a required rate-limit mitigation.
  const factory CategoriesEvent.treeRequested({@Default(false) bool refresh}) =
      CategoriesTreeRequested;

  /// `GET /categories/{idOrSlug}` — resolves a slug into id + ancestors +
  /// direct children in one call.
  const factory CategoriesEvent.categoryRequested(String idOrSlug) =
      CategoriesCategoryRequested;

  /// Grid ⇄ list. A rep browsing a branch by name wants the list; one
  /// recognising product families by shape wants the grid. Persisted per
  /// session only — the tree is the one surface where the doc leaves the
  /// presentation open.
  const factory CategoriesEvent.viewModeToggled() = CategoriesViewModeToggled;
}
