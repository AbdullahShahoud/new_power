// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductDetailEvent {

 String get idOrSlug;
/// Create a copy of ProductDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDetailEventCopyWith<ProductDetailEvent> get copyWith => _$ProductDetailEventCopyWithImpl<ProductDetailEvent>(this as ProductDetailEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailEvent&&(identical(other.idOrSlug, idOrSlug) || other.idOrSlug == idOrSlug));
}


@override
int get hashCode => Object.hash(runtimeType,idOrSlug);

@override
String toString() {
  return 'ProductDetailEvent(idOrSlug: $idOrSlug)';
}


}

/// @nodoc
abstract mixin class $ProductDetailEventCopyWith<$Res>  {
  factory $ProductDetailEventCopyWith(ProductDetailEvent value, $Res Function(ProductDetailEvent) _then) = _$ProductDetailEventCopyWithImpl;
@useResult
$Res call({
 String idOrSlug
});




}
/// @nodoc
class _$ProductDetailEventCopyWithImpl<$Res>
    implements $ProductDetailEventCopyWith<$Res> {
  _$ProductDetailEventCopyWithImpl(this._self, this._then);

  final ProductDetailEvent _self;
  final $Res Function(ProductDetailEvent) _then;

/// Create a copy of ProductDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? idOrSlug = null,}) {
  return _then(_self.copyWith(
idOrSlug: null == idOrSlug ? _self.idOrSlug : idOrSlug // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductDetailEvent].
extension ProductDetailEventPatterns on ProductDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProductDetailRequested value)?  requested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProductDetailRequested() when requested != null:
return requested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProductDetailRequested value)  requested,}){
final _that = this;
switch (_that) {
case ProductDetailRequested():
return requested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProductDetailRequested value)?  requested,}){
final _that = this;
switch (_that) {
case ProductDetailRequested() when requested != null:
return requested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String idOrSlug)?  requested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProductDetailRequested() when requested != null:
return requested(_that.idOrSlug);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String idOrSlug)  requested,}) {final _that = this;
switch (_that) {
case ProductDetailRequested():
return requested(_that.idOrSlug);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String idOrSlug)?  requested,}) {final _that = this;
switch (_that) {
case ProductDetailRequested() when requested != null:
return requested(_that.idOrSlug);case _:
  return null;

}
}

}

/// @nodoc


class ProductDetailRequested implements ProductDetailEvent {
  const ProductDetailRequested(this.idOrSlug);
  

@override final  String idOrSlug;

/// Create a copy of ProductDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDetailRequestedCopyWith<ProductDetailRequested> get copyWith => _$ProductDetailRequestedCopyWithImpl<ProductDetailRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailRequested&&(identical(other.idOrSlug, idOrSlug) || other.idOrSlug == idOrSlug));
}


@override
int get hashCode => Object.hash(runtimeType,idOrSlug);

@override
String toString() {
  return 'ProductDetailEvent.requested(idOrSlug: $idOrSlug)';
}


}

/// @nodoc
abstract mixin class $ProductDetailRequestedCopyWith<$Res> implements $ProductDetailEventCopyWith<$Res> {
  factory $ProductDetailRequestedCopyWith(ProductDetailRequested value, $Res Function(ProductDetailRequested) _then) = _$ProductDetailRequestedCopyWithImpl;
@override @useResult
$Res call({
 String idOrSlug
});




}
/// @nodoc
class _$ProductDetailRequestedCopyWithImpl<$Res>
    implements $ProductDetailRequestedCopyWith<$Res> {
  _$ProductDetailRequestedCopyWithImpl(this._self, this._then);

  final ProductDetailRequested _self;
  final $Res Function(ProductDetailRequested) _then;

/// Create a copy of ProductDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? idOrSlug = null,}) {
  return _then(ProductDetailRequested(
null == idOrSlug ? _self.idOrSlug : idOrSlug // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ProductDetailState {

 ProductDetailStatus get status; ProductDetailView? get product; String? get errorMessage;
/// Create a copy of ProductDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDetailStateCopyWith<ProductDetailState> get copyWith => _$ProductDetailStateCopyWithImpl<ProductDetailState>(this as ProductDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailState&&(identical(other.status, status) || other.status == status)&&(identical(other.product, product) || other.product == product)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,product,errorMessage);

@override
String toString() {
  return 'ProductDetailState(status: $status, product: $product, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ProductDetailStateCopyWith<$Res>  {
  factory $ProductDetailStateCopyWith(ProductDetailState value, $Res Function(ProductDetailState) _then) = _$ProductDetailStateCopyWithImpl;
@useResult
$Res call({
 ProductDetailStatus status, ProductDetailView? product, String? errorMessage
});


$ProductDetailViewCopyWith<$Res>? get product;

}
/// @nodoc
class _$ProductDetailStateCopyWithImpl<$Res>
    implements $ProductDetailStateCopyWith<$Res> {
  _$ProductDetailStateCopyWithImpl(this._self, this._then);

  final ProductDetailState _self;
  final $Res Function(ProductDetailState) _then;

/// Create a copy of ProductDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? product = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProductDetailStatus,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductDetailView?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ProductDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductDetailViewCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $ProductDetailViewCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductDetailState].
extension ProductDetailStatePatterns on ProductDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductDetailState value)  $default,){
final _that = this;
switch (_that) {
case _ProductDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _ProductDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProductDetailStatus status,  ProductDetailView? product,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductDetailState() when $default != null:
return $default(_that.status,_that.product,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProductDetailStatus status,  ProductDetailView? product,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ProductDetailState():
return $default(_that.status,_that.product,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProductDetailStatus status,  ProductDetailView? product,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ProductDetailState() when $default != null:
return $default(_that.status,_that.product,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ProductDetailState implements ProductDetailState {
  const _ProductDetailState({this.status = ProductDetailStatus.initial, this.product, this.errorMessage});
  

@override@JsonKey() final  ProductDetailStatus status;
@override final  ProductDetailView? product;
@override final  String? errorMessage;

/// Create a copy of ProductDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductDetailStateCopyWith<_ProductDetailState> get copyWith => __$ProductDetailStateCopyWithImpl<_ProductDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductDetailState&&(identical(other.status, status) || other.status == status)&&(identical(other.product, product) || other.product == product)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,product,errorMessage);

@override
String toString() {
  return 'ProductDetailState(status: $status, product: $product, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ProductDetailStateCopyWith<$Res> implements $ProductDetailStateCopyWith<$Res> {
  factory _$ProductDetailStateCopyWith(_ProductDetailState value, $Res Function(_ProductDetailState) _then) = __$ProductDetailStateCopyWithImpl;
@override @useResult
$Res call({
 ProductDetailStatus status, ProductDetailView? product, String? errorMessage
});


@override $ProductDetailViewCopyWith<$Res>? get product;

}
/// @nodoc
class __$ProductDetailStateCopyWithImpl<$Res>
    implements _$ProductDetailStateCopyWith<$Res> {
  __$ProductDetailStateCopyWithImpl(this._self, this._then);

  final _ProductDetailState _self;
  final $Res Function(_ProductDetailState) _then;

/// Create a copy of ProductDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? product = freezed,Object? errorMessage = freezed,}) {
  return _then(_ProductDetailState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProductDetailStatus,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductDetailView?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ProductDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductDetailViewCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $ProductDetailViewCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}

// dart format on
