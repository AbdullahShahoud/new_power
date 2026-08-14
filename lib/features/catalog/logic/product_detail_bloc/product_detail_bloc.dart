import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/models/product_view.dart';
import '../../data/repo/catalog_repository.dart';

part 'product_detail_bloc.freezed.dart';

@freezed
sealed class ProductDetailEvent with _$ProductDetailEvent {
  const factory ProductDetailEvent.requested(String idOrSlug) =
      ProductDetailRequested;
}

enum ProductDetailStatus {
  initial,
  loading,
  loaded,

  /// `404 CATALOG_PRODUCT_NOT_FOUND`. ⚠️ "Not published" and "not there" are
  /// **deliberately indistinguishable** (BR-4) — you cannot tell them apart
  /// and are not meant to. Do not retry.
  notFound,
  networkError,

  /// `503` — server state, transient.
  catalogUnavailable,
}

@freezed
sealed class ProductDetailState with _$ProductDetailState {
  const factory ProductDetailState({
    @Default(ProductDetailStatus.initial) ProductDetailStatus status,
    ProductDetailView? product,
    String? errorMessage,
  }) = _ProductDetailState;
}

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final CatalogRepository _repository;

  ProductDetailBloc(this._repository) : super(const ProductDetailState()) {
    on<ProductDetailRequested>(_onRequested);
  }

  Future<void> _onRequested(
    ProductDetailRequested event,
    Emitter<ProductDetailState> emit,
  ) async {
    emit(
      state.copyWith(
        status: ProductDetailStatus.loading,
        errorMessage: null,
      ),
    );

    final result = await _repository.getProduct(event.idOrSlug);
    if (result is Failure<ProductDetailView>) {
      final error = result.error;
      emit(
        state.copyWith(
          status: error.isProductNotFound
              ? ProductDetailStatus.notFound
              : error.isNoPublishedVersion
              ? ProductDetailStatus.catalogUnavailable
              : ProductDetailStatus.networkError,
          errorMessage: error.message,
        ),
      );
      return;
    }

    // A DISCONTINUED product lands here as a normal 200 (BR-2) — the screen
    // renders it with a banner rather than hiding it, because historical
    // activities and outcomes reference it and blanking the page would erase
    // things that genuinely happened.
    emit(
      state.copyWith(
        status: ProductDetailStatus.loaded,
        product: (result as Success<ProductDetailView>).data,
      ),
    );
  }
}
