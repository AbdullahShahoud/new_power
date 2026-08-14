// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductsState {

 ProductQuery get query; ProductsStatus get status; List<ProductListItemView> get products; int get total; int get page; int get totalPages; String? get errorMessage;/// Appending a page, as opposed to replacing the list. Keeps the
/// existing rows on screen instead of flashing a skeleton over them.
 bool get isLoadingMore;// ── the rail ────────────────────────────────────────────────────
 FiltersStatus get filtersStatus; List<FilterView> get filters;/// Set when §19.3's recovery ran: a filter the server no longer
/// recognises was dropped and the request retried. The UI owes the user
/// a notice — silently returning different results would be worse.
 String? get droppedFilterCode;
/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsStateCopyWith<ProductsState> get copyWith => _$ProductsStateCopyWithImpl<ProductsState>(this as ProductsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsState&&(identical(other.query, query) || other.query == query)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.filtersStatus, filtersStatus) || other.filtersStatus == filtersStatus)&&const DeepCollectionEquality().equals(other.filters, filters)&&(identical(other.droppedFilterCode, droppedFilterCode) || other.droppedFilterCode == droppedFilterCode));
}


@override
int get hashCode => Object.hash(runtimeType,query,status,const DeepCollectionEquality().hash(products),total,page,totalPages,errorMessage,isLoadingMore,filtersStatus,const DeepCollectionEquality().hash(filters),droppedFilterCode);

@override
String toString() {
  return 'ProductsState(query: $query, status: $status, products: $products, total: $total, page: $page, totalPages: $totalPages, errorMessage: $errorMessage, isLoadingMore: $isLoadingMore, filtersStatus: $filtersStatus, filters: $filters, droppedFilterCode: $droppedFilterCode)';
}


}

/// @nodoc
abstract mixin class $ProductsStateCopyWith<$Res>  {
  factory $ProductsStateCopyWith(ProductsState value, $Res Function(ProductsState) _then) = _$ProductsStateCopyWithImpl;
@useResult
$Res call({
 ProductQuery query, ProductsStatus status, List<ProductListItemView> products, int total, int page, int totalPages, String? errorMessage, bool isLoadingMore, FiltersStatus filtersStatus, List<FilterView> filters, String? droppedFilterCode
});




}
/// @nodoc
class _$ProductsStateCopyWithImpl<$Res>
    implements $ProductsStateCopyWith<$Res> {
  _$ProductsStateCopyWithImpl(this._self, this._then);

  final ProductsState _self;
  final $Res Function(ProductsState) _then;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,Object? status = null,Object? products = null,Object? total = null,Object? page = null,Object? totalPages = null,Object? errorMessage = freezed,Object? isLoadingMore = null,Object? filtersStatus = null,Object? filters = null,Object? droppedFilterCode = freezed,}) {
  return _then(_self.copyWith(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as ProductQuery,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProductsStatus,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductListItemView>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,filtersStatus: null == filtersStatus ? _self.filtersStatus : filtersStatus // ignore: cast_nullable_to_non_nullable
as FiltersStatus,filters: null == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as List<FilterView>,droppedFilterCode: freezed == droppedFilterCode ? _self.droppedFilterCode : droppedFilterCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductsState].
extension ProductsStatePatterns on ProductsState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductsState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductsState value)  $default,){
final _that = this;
switch (_that) {
case _ProductsState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductsState value)?  $default,){
final _that = this;
switch (_that) {
case _ProductsState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProductQuery query,  ProductsStatus status,  List<ProductListItemView> products,  int total,  int page,  int totalPages,  String? errorMessage,  bool isLoadingMore,  FiltersStatus filtersStatus,  List<FilterView> filters,  String? droppedFilterCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductsState() when $default != null:
return $default(_that.query,_that.status,_that.products,_that.total,_that.page,_that.totalPages,_that.errorMessage,_that.isLoadingMore,_that.filtersStatus,_that.filters,_that.droppedFilterCode);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProductQuery query,  ProductsStatus status,  List<ProductListItemView> products,  int total,  int page,  int totalPages,  String? errorMessage,  bool isLoadingMore,  FiltersStatus filtersStatus,  List<FilterView> filters,  String? droppedFilterCode)  $default,) {final _that = this;
switch (_that) {
case _ProductsState():
return $default(_that.query,_that.status,_that.products,_that.total,_that.page,_that.totalPages,_that.errorMessage,_that.isLoadingMore,_that.filtersStatus,_that.filters,_that.droppedFilterCode);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProductQuery query,  ProductsStatus status,  List<ProductListItemView> products,  int total,  int page,  int totalPages,  String? errorMessage,  bool isLoadingMore,  FiltersStatus filtersStatus,  List<FilterView> filters,  String? droppedFilterCode)?  $default,) {final _that = this;
switch (_that) {
case _ProductsState() when $default != null:
return $default(_that.query,_that.status,_that.products,_that.total,_that.page,_that.totalPages,_that.errorMessage,_that.isLoadingMore,_that.filtersStatus,_that.filters,_that.droppedFilterCode);case _:
  return null;

}
}

}

/// @nodoc


class _ProductsState implements ProductsState {
  const _ProductsState({this.query = const ProductQuery(), this.status = ProductsStatus.initial, final  List<ProductListItemView> products = const <ProductListItemView>[], this.total = 0, this.page = 1, this.totalPages = 0, this.errorMessage, this.isLoadingMore = false, this.filtersStatus = FiltersStatus.initial, final  List<FilterView> filters = const <FilterView>[], this.droppedFilterCode}): _products = products,_filters = filters;
  

@override@JsonKey() final  ProductQuery query;
@override@JsonKey() final  ProductsStatus status;
 final  List<ProductListItemView> _products;
@override@JsonKey() List<ProductListItemView> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override@JsonKey() final  int total;
@override@JsonKey() final  int page;
@override@JsonKey() final  int totalPages;
@override final  String? errorMessage;
/// Appending a page, as opposed to replacing the list. Keeps the
/// existing rows on screen instead of flashing a skeleton over them.
@override@JsonKey() final  bool isLoadingMore;
// ── the rail ────────────────────────────────────────────────────
@override@JsonKey() final  FiltersStatus filtersStatus;
 final  List<FilterView> _filters;
@override@JsonKey() List<FilterView> get filters {
  if (_filters is EqualUnmodifiableListView) return _filters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filters);
}

/// Set when §19.3's recovery ran: a filter the server no longer
/// recognises was dropped and the request retried. The UI owes the user
/// a notice — silently returning different results would be worse.
@override final  String? droppedFilterCode;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductsStateCopyWith<_ProductsState> get copyWith => __$ProductsStateCopyWithImpl<_ProductsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductsState&&(identical(other.query, query) || other.query == query)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.filtersStatus, filtersStatus) || other.filtersStatus == filtersStatus)&&const DeepCollectionEquality().equals(other._filters, _filters)&&(identical(other.droppedFilterCode, droppedFilterCode) || other.droppedFilterCode == droppedFilterCode));
}


@override
int get hashCode => Object.hash(runtimeType,query,status,const DeepCollectionEquality().hash(_products),total,page,totalPages,errorMessage,isLoadingMore,filtersStatus,const DeepCollectionEquality().hash(_filters),droppedFilterCode);

@override
String toString() {
  return 'ProductsState(query: $query, status: $status, products: $products, total: $total, page: $page, totalPages: $totalPages, errorMessage: $errorMessage, isLoadingMore: $isLoadingMore, filtersStatus: $filtersStatus, filters: $filters, droppedFilterCode: $droppedFilterCode)';
}


}

/// @nodoc
abstract mixin class _$ProductsStateCopyWith<$Res> implements $ProductsStateCopyWith<$Res> {
  factory _$ProductsStateCopyWith(_ProductsState value, $Res Function(_ProductsState) _then) = __$ProductsStateCopyWithImpl;
@override @useResult
$Res call({
 ProductQuery query, ProductsStatus status, List<ProductListItemView> products, int total, int page, int totalPages, String? errorMessage, bool isLoadingMore, FiltersStatus filtersStatus, List<FilterView> filters, String? droppedFilterCode
});




}
/// @nodoc
class __$ProductsStateCopyWithImpl<$Res>
    implements _$ProductsStateCopyWith<$Res> {
  __$ProductsStateCopyWithImpl(this._self, this._then);

  final _ProductsState _self;
  final $Res Function(_ProductsState) _then;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? status = null,Object? products = null,Object? total = null,Object? page = null,Object? totalPages = null,Object? errorMessage = freezed,Object? isLoadingMore = null,Object? filtersStatus = null,Object? filters = null,Object? droppedFilterCode = freezed,}) {
  return _then(_ProductsState(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as ProductQuery,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProductsStatus,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductListItemView>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,filtersStatus: null == filtersStatus ? _self.filtersStatus : filtersStatus // ignore: cast_nullable_to_non_nullable
as FiltersStatus,filters: null == filters ? _self._filters : filters // ignore: cast_nullable_to_non_nullable
as List<FilterView>,droppedFilterCode: freezed == droppedFilterCode ? _self.droppedFilterCode : droppedFilterCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
