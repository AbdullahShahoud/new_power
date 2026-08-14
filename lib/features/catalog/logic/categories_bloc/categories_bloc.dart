import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/models/category_view.dart';
import '../../data/repo/catalog_repository.dart';
import 'categories_event.dart';
import 'categories_state.dart';

/// The browse surface. Holds the whole tree for the session — 43 rows, and
/// §19.4 lists caching it among the required rate-limit mitigations.
class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CatalogRepository _repository;

  CategoriesBloc(this._repository) : super(const CategoriesState()) {
    on<CategoriesTreeRequested>(_onTreeRequested);
    on<CategoriesCategoryRequested>(_onCategoryRequested);
    on<CategoriesViewModeToggled>(_onViewModeToggled);
  }

  Future<void> _onTreeRequested(
    CategoriesTreeRequested event,
    Emitter<CategoriesState> emit,
  ) async {
    if (!event.refresh && state.roots.isNotEmpty) return;

    emit(
      state.copyWith(
        status: CategoriesStatus.loading,
        errorMessage: null,
        catalogUnavailable: false,
      ),
    );

    // The repository holds the tree for the session, so a revisit to the tab
    // costs no request — only an explicit pull-to-refresh goes to the wire.
    final result = await _repository.getCategories(
      tree: true,
      forceRefresh: event.refresh,
    );
    if (result is Failure<List<CategoryView>>) {
      emit(
        state.copyWith(
          status: CategoriesStatus.networkError,
          errorMessage: result.error.message,
          catalogUnavailable: result.error.isNoPublishedVersion,
        ),
      );
      return;
    }

    final roots = (result as Success<List<CategoryView>>).data;
    emit(
      state.copyWith(
        status: roots.isEmpty
            ? CategoriesStatus.empty
            : CategoriesStatus.loaded,
        roots: roots,
      ),
    );
  }

  Future<void> _onCategoryRequested(
    CategoriesCategoryRequested event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(
      state.copyWith(
        detailStatus: CategoriesStatus.loading,
        detailErrorMessage: null,
      ),
    );

    final result = await _repository.getCategory(event.idOrSlug);
    if (result is Failure<GetCategoryResultView>) {
      emit(
        state.copyWith(
          detailStatus: CategoriesStatus.networkError,
          detailErrorMessage: result.error.message,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        detailStatus: CategoriesStatus.loaded,
        selected: (result as Success<GetCategoryResultView>).data,
      ),
    );
  }

  void _onViewModeToggled(
    CategoriesViewModeToggled event,
    Emitter<CategoriesState> emit,
  ) {
    emit(
      state.copyWith(
        viewMode: state.viewMode == CategoryViewMode.grid
            ? CategoryViewMode.list
            : CategoryViewMode.grid,
      ),
    );
  }
}
