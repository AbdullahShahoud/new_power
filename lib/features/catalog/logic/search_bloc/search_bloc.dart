import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/models/product_view.dart';
import '../../data/repo/catalog_repository.dart';

part 'search_bloc.freezed.dart';

@freezed
sealed class SearchEvent with _$SearchEvent {
  /// Already debounced by the caller. §7.8 — a typeahead firing per
  /// keystroke exhausts the 30-per-minute budget in about 15 characters.
  const factory SearchEvent.termChanged(String term) = SearchTermChanged;
  const factory SearchEvent.cleared() = SearchCleared;
}

enum SuggestStatus { idle, loading, loaded, empty }

@freezed
sealed class SearchState with _$SearchState {
  const factory SearchState({
    @Default('') String term,
    @Default(SuggestStatus.idle) SuggestStatus status,
    @Default(<SuggestionView>[]) List<SuggestionView> suggestions,
  }) = _SearchState;
}

/// The typeahead behind the catalogue search screen.
///
/// Suggestions are **not** a substitute for `/products?q=` — selecting one
/// navigates straight to the product by slug, while submitting the term runs
/// a real list query (§7.8).
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final CatalogRepository _repository;

  int _generation = 0;

  SearchBloc(this._repository) : super(const SearchState()) {
    on<SearchTermChanged>(_onTermChanged);
    on<SearchCleared>(_onCleared);
  }

  Future<void> _onTermChanged(
    SearchTermChanged event,
    Emitter<SearchState> emit,
  ) async {
    final term = event.term;
    final trimmed = term.trim();

    // §11.2 — under 2 characters the server returns `[]` rather than an
    // error, so the gate here saves a request rather than preventing one.
    if (trimmed.length < 2) {
      emit(
        state.copyWith(
          term: term,
          status: SuggestStatus.idle,
          suggestions: const [],
        ),
      );
      return;
    }

    final ticket = ++_generation;
    emit(state.copyWith(term: term, status: SuggestStatus.loading));

    final result = await _repository.suggest(trimmed);
    if (emit.isDone || ticket != _generation) return;

    if (result is Failure<List<SuggestionView>>) {
      // A failed typeahead is never worth an error state — the user is
      // mid-word and the real search still works. Fall silent.
      emit(state.copyWith(status: SuggestStatus.idle, suggestions: const []));
      return;
    }

    final items = (result as Success<List<SuggestionView>>).data;
    emit(
      state.copyWith(
        status: items.isEmpty ? SuggestStatus.empty : SuggestStatus.loaded,
        suggestions: items,
      ),
    );
  }

  void _onCleared(SearchCleared event, Emitter<SearchState> emit) {
    _generation++;
    emit(const SearchState());
  }
}
