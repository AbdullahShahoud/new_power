// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductsEvent()';
}


}

/// @nodoc
class $ProductsEventCopyWith<$Res>  {
$ProductsEventCopyWith(ProductsEvent _, $Res Function(ProductsEvent) __);
}


/// Adds pattern-matching-related methods to [ProductsEvent].
extension ProductsEventPatterns on ProductsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProductsOpened value)?  opened,TResult Function( ProductsQueryChanged value)?  queryChanged,TResult Function( ProductsAttributeToggled value)?  attributeToggled,TResult Function( ProductsAttributeRangeSet value)?  attributeRangeSet,TResult Function( ProductsAttributeCleared value)?  attributeCleared,TResult Function( ProductsFiltersCleared value)?  filtersCleared,TResult Function( ProductsSortChanged value)?  sortChanged,TResult Function( ProductsNextPageRequested value)?  nextPageRequested,TResult Function( ProductsRefreshed value)?  refreshed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProductsOpened() when opened != null:
return opened(_that);case ProductsQueryChanged() when queryChanged != null:
return queryChanged(_that);case ProductsAttributeToggled() when attributeToggled != null:
return attributeToggled(_that);case ProductsAttributeRangeSet() when attributeRangeSet != null:
return attributeRangeSet(_that);case ProductsAttributeCleared() when attributeCleared != null:
return attributeCleared(_that);case ProductsFiltersCleared() when filtersCleared != null:
return filtersCleared(_that);case ProductsSortChanged() when sortChanged != null:
return sortChanged(_that);case ProductsNextPageRequested() when nextPageRequested != null:
return nextPageRequested(_that);case ProductsRefreshed() when refreshed != null:
return refreshed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProductsOpened value)  opened,required TResult Function( ProductsQueryChanged value)  queryChanged,required TResult Function( ProductsAttributeToggled value)  attributeToggled,required TResult Function( ProductsAttributeRangeSet value)  attributeRangeSet,required TResult Function( ProductsAttributeCleared value)  attributeCleared,required TResult Function( ProductsFiltersCleared value)  filtersCleared,required TResult Function( ProductsSortChanged value)  sortChanged,required TResult Function( ProductsNextPageRequested value)  nextPageRequested,required TResult Function( ProductsRefreshed value)  refreshed,}){
final _that = this;
switch (_that) {
case ProductsOpened():
return opened(_that);case ProductsQueryChanged():
return queryChanged(_that);case ProductsAttributeToggled():
return attributeToggled(_that);case ProductsAttributeRangeSet():
return attributeRangeSet(_that);case ProductsAttributeCleared():
return attributeCleared(_that);case ProductsFiltersCleared():
return filtersCleared(_that);case ProductsSortChanged():
return sortChanged(_that);case ProductsNextPageRequested():
return nextPageRequested(_that);case ProductsRefreshed():
return refreshed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProductsOpened value)?  opened,TResult? Function( ProductsQueryChanged value)?  queryChanged,TResult? Function( ProductsAttributeToggled value)?  attributeToggled,TResult? Function( ProductsAttributeRangeSet value)?  attributeRangeSet,TResult? Function( ProductsAttributeCleared value)?  attributeCleared,TResult? Function( ProductsFiltersCleared value)?  filtersCleared,TResult? Function( ProductsSortChanged value)?  sortChanged,TResult? Function( ProductsNextPageRequested value)?  nextPageRequested,TResult? Function( ProductsRefreshed value)?  refreshed,}){
final _that = this;
switch (_that) {
case ProductsOpened() when opened != null:
return opened(_that);case ProductsQueryChanged() when queryChanged != null:
return queryChanged(_that);case ProductsAttributeToggled() when attributeToggled != null:
return attributeToggled(_that);case ProductsAttributeRangeSet() when attributeRangeSet != null:
return attributeRangeSet(_that);case ProductsAttributeCleared() when attributeCleared != null:
return attributeCleared(_that);case ProductsFiltersCleared() when filtersCleared != null:
return filtersCleared(_that);case ProductsSortChanged() when sortChanged != null:
return sortChanged(_that);case ProductsNextPageRequested() when nextPageRequested != null:
return nextPageRequested(_that);case ProductsRefreshed() when refreshed != null:
return refreshed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ProductQuery query)?  opened,TResult Function( ProductQuery query)?  queryChanged,TResult Function( String code,  String optionCode)?  attributeToggled,TResult Function( String code,  String value)?  attributeRangeSet,TResult Function( String code)?  attributeCleared,TResult Function()?  filtersCleared,TResult Function( ProductSort sort)?  sortChanged,TResult Function()?  nextPageRequested,TResult Function()?  refreshed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProductsOpened() when opened != null:
return opened(_that.query);case ProductsQueryChanged() when queryChanged != null:
return queryChanged(_that.query);case ProductsAttributeToggled() when attributeToggled != null:
return attributeToggled(_that.code,_that.optionCode);case ProductsAttributeRangeSet() when attributeRangeSet != null:
return attributeRangeSet(_that.code,_that.value);case ProductsAttributeCleared() when attributeCleared != null:
return attributeCleared(_that.code);case ProductsFiltersCleared() when filtersCleared != null:
return filtersCleared();case ProductsSortChanged() when sortChanged != null:
return sortChanged(_that.sort);case ProductsNextPageRequested() when nextPageRequested != null:
return nextPageRequested();case ProductsRefreshed() when refreshed != null:
return refreshed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ProductQuery query)  opened,required TResult Function( ProductQuery query)  queryChanged,required TResult Function( String code,  String optionCode)  attributeToggled,required TResult Function( String code,  String value)  attributeRangeSet,required TResult Function( String code)  attributeCleared,required TResult Function()  filtersCleared,required TResult Function( ProductSort sort)  sortChanged,required TResult Function()  nextPageRequested,required TResult Function()  refreshed,}) {final _that = this;
switch (_that) {
case ProductsOpened():
return opened(_that.query);case ProductsQueryChanged():
return queryChanged(_that.query);case ProductsAttributeToggled():
return attributeToggled(_that.code,_that.optionCode);case ProductsAttributeRangeSet():
return attributeRangeSet(_that.code,_that.value);case ProductsAttributeCleared():
return attributeCleared(_that.code);case ProductsFiltersCleared():
return filtersCleared();case ProductsSortChanged():
return sortChanged(_that.sort);case ProductsNextPageRequested():
return nextPageRequested();case ProductsRefreshed():
return refreshed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ProductQuery query)?  opened,TResult? Function( ProductQuery query)?  queryChanged,TResult? Function( String code,  String optionCode)?  attributeToggled,TResult? Function( String code,  String value)?  attributeRangeSet,TResult? Function( String code)?  attributeCleared,TResult? Function()?  filtersCleared,TResult? Function( ProductSort sort)?  sortChanged,TResult? Function()?  nextPageRequested,TResult? Function()?  refreshed,}) {final _that = this;
switch (_that) {
case ProductsOpened() when opened != null:
return opened(_that.query);case ProductsQueryChanged() when queryChanged != null:
return queryChanged(_that.query);case ProductsAttributeToggled() when attributeToggled != null:
return attributeToggled(_that.code,_that.optionCode);case ProductsAttributeRangeSet() when attributeRangeSet != null:
return attributeRangeSet(_that.code,_that.value);case ProductsAttributeCleared() when attributeCleared != null:
return attributeCleared(_that.code);case ProductsFiltersCleared() when filtersCleared != null:
return filtersCleared();case ProductsSortChanged() when sortChanged != null:
return sortChanged(_that.sort);case ProductsNextPageRequested() when nextPageRequested != null:
return nextPageRequested();case ProductsRefreshed() when refreshed != null:
return refreshed();case _:
  return null;

}
}

}

/// @nodoc


class ProductsOpened implements ProductsEvent {
  const ProductsOpened(this.query);
  

 final  ProductQuery query;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsOpenedCopyWith<ProductsOpened> get copyWith => _$ProductsOpenedCopyWithImpl<ProductsOpened>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsOpened&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'ProductsEvent.opened(query: $query)';
}


}

/// @nodoc
abstract mixin class $ProductsOpenedCopyWith<$Res> implements $ProductsEventCopyWith<$Res> {
  factory $ProductsOpenedCopyWith(ProductsOpened value, $Res Function(ProductsOpened) _then) = _$ProductsOpenedCopyWithImpl;
@useResult
$Res call({
 ProductQuery query
});




}
/// @nodoc
class _$ProductsOpenedCopyWithImpl<$Res>
    implements $ProductsOpenedCopyWith<$Res> {
  _$ProductsOpenedCopyWithImpl(this._self, this._then);

  final ProductsOpened _self;
  final $Res Function(ProductsOpened) _then;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(ProductsOpened(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as ProductQuery,
  ));
}


}

/// @nodoc


class ProductsQueryChanged implements ProductsEvent {
  const ProductsQueryChanged(this.query);
  

 final  ProductQuery query;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsQueryChangedCopyWith<ProductsQueryChanged> get copyWith => _$ProductsQueryChangedCopyWithImpl<ProductsQueryChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsQueryChanged&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'ProductsEvent.queryChanged(query: $query)';
}


}

/// @nodoc
abstract mixin class $ProductsQueryChangedCopyWith<$Res> implements $ProductsEventCopyWith<$Res> {
  factory $ProductsQueryChangedCopyWith(ProductsQueryChanged value, $Res Function(ProductsQueryChanged) _then) = _$ProductsQueryChangedCopyWithImpl;
@useResult
$Res call({
 ProductQuery query
});




}
/// @nodoc
class _$ProductsQueryChangedCopyWithImpl<$Res>
    implements $ProductsQueryChangedCopyWith<$Res> {
  _$ProductsQueryChangedCopyWithImpl(this._self, this._then);

  final ProductsQueryChanged _self;
  final $Res Function(ProductsQueryChanged) _then;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(ProductsQueryChanged(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as ProductQuery,
  ));
}


}

/// @nodoc


class ProductsAttributeToggled implements ProductsEvent {
  const ProductsAttributeToggled({required this.code, required this.optionCode});
  

 final  String code;
 final  String optionCode;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsAttributeToggledCopyWith<ProductsAttributeToggled> get copyWith => _$ProductsAttributeToggledCopyWithImpl<ProductsAttributeToggled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsAttributeToggled&&(identical(other.code, code) || other.code == code)&&(identical(other.optionCode, optionCode) || other.optionCode == optionCode));
}


@override
int get hashCode => Object.hash(runtimeType,code,optionCode);

@override
String toString() {
  return 'ProductsEvent.attributeToggled(code: $code, optionCode: $optionCode)';
}


}

/// @nodoc
abstract mixin class $ProductsAttributeToggledCopyWith<$Res> implements $ProductsEventCopyWith<$Res> {
  factory $ProductsAttributeToggledCopyWith(ProductsAttributeToggled value, $Res Function(ProductsAttributeToggled) _then) = _$ProductsAttributeToggledCopyWithImpl;
@useResult
$Res call({
 String code, String optionCode
});




}
/// @nodoc
class _$ProductsAttributeToggledCopyWithImpl<$Res>
    implements $ProductsAttributeToggledCopyWith<$Res> {
  _$ProductsAttributeToggledCopyWithImpl(this._self, this._then);

  final ProductsAttributeToggled _self;
  final $Res Function(ProductsAttributeToggled) _then;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? code = null,Object? optionCode = null,}) {
  return _then(ProductsAttributeToggled(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,optionCode: null == optionCode ? _self.optionCode : optionCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProductsAttributeRangeSet implements ProductsEvent {
  const ProductsAttributeRangeSet({required this.code, required this.value});
  

 final  String code;
 final  String value;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsAttributeRangeSetCopyWith<ProductsAttributeRangeSet> get copyWith => _$ProductsAttributeRangeSetCopyWithImpl<ProductsAttributeRangeSet>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsAttributeRangeSet&&(identical(other.code, code) || other.code == code)&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,code,value);

@override
String toString() {
  return 'ProductsEvent.attributeRangeSet(code: $code, value: $value)';
}


}

/// @nodoc
abstract mixin class $ProductsAttributeRangeSetCopyWith<$Res> implements $ProductsEventCopyWith<$Res> {
  factory $ProductsAttributeRangeSetCopyWith(ProductsAttributeRangeSet value, $Res Function(ProductsAttributeRangeSet) _then) = _$ProductsAttributeRangeSetCopyWithImpl;
@useResult
$Res call({
 String code, String value
});




}
/// @nodoc
class _$ProductsAttributeRangeSetCopyWithImpl<$Res>
    implements $ProductsAttributeRangeSetCopyWith<$Res> {
  _$ProductsAttributeRangeSetCopyWithImpl(this._self, this._then);

  final ProductsAttributeRangeSet _self;
  final $Res Function(ProductsAttributeRangeSet) _then;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? code = null,Object? value = null,}) {
  return _then(ProductsAttributeRangeSet(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProductsAttributeCleared implements ProductsEvent {
  const ProductsAttributeCleared(this.code);
  

 final  String code;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsAttributeClearedCopyWith<ProductsAttributeCleared> get copyWith => _$ProductsAttributeClearedCopyWithImpl<ProductsAttributeCleared>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsAttributeCleared&&(identical(other.code, code) || other.code == code));
}


@override
int get hashCode => Object.hash(runtimeType,code);

@override
String toString() {
  return 'ProductsEvent.attributeCleared(code: $code)';
}


}

/// @nodoc
abstract mixin class $ProductsAttributeClearedCopyWith<$Res> implements $ProductsEventCopyWith<$Res> {
  factory $ProductsAttributeClearedCopyWith(ProductsAttributeCleared value, $Res Function(ProductsAttributeCleared) _then) = _$ProductsAttributeClearedCopyWithImpl;
@useResult
$Res call({
 String code
});




}
/// @nodoc
class _$ProductsAttributeClearedCopyWithImpl<$Res>
    implements $ProductsAttributeClearedCopyWith<$Res> {
  _$ProductsAttributeClearedCopyWithImpl(this._self, this._then);

  final ProductsAttributeCleared _self;
  final $Res Function(ProductsAttributeCleared) _then;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? code = null,}) {
  return _then(ProductsAttributeCleared(
null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProductsFiltersCleared implements ProductsEvent {
  const ProductsFiltersCleared();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsFiltersCleared);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductsEvent.filtersCleared()';
}


}




/// @nodoc


class ProductsSortChanged implements ProductsEvent {
  const ProductsSortChanged(this.sort);
  

 final  ProductSort sort;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsSortChangedCopyWith<ProductsSortChanged> get copyWith => _$ProductsSortChangedCopyWithImpl<ProductsSortChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsSortChanged&&(identical(other.sort, sort) || other.sort == sort));
}


@override
int get hashCode => Object.hash(runtimeType,sort);

@override
String toString() {
  return 'ProductsEvent.sortChanged(sort: $sort)';
}


}

/// @nodoc
abstract mixin class $ProductsSortChangedCopyWith<$Res> implements $ProductsEventCopyWith<$Res> {
  factory $ProductsSortChangedCopyWith(ProductsSortChanged value, $Res Function(ProductsSortChanged) _then) = _$ProductsSortChangedCopyWithImpl;
@useResult
$Res call({
 ProductSort sort
});




}
/// @nodoc
class _$ProductsSortChangedCopyWithImpl<$Res>
    implements $ProductsSortChangedCopyWith<$Res> {
  _$ProductsSortChangedCopyWithImpl(this._self, this._then);

  final ProductsSortChanged _self;
  final $Res Function(ProductsSortChanged) _then;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sort = null,}) {
  return _then(ProductsSortChanged(
null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as ProductSort,
  ));
}


}

/// @nodoc


class ProductsNextPageRequested implements ProductsEvent {
  const ProductsNextPageRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsNextPageRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductsEvent.nextPageRequested()';
}


}




/// @nodoc


class ProductsRefreshed implements ProductsEvent {
  const ProductsRefreshed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsRefreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductsEvent.refreshed()';
}


}




// dart format on
