// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoriesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoriesEvent()';
}


}

/// @nodoc
class $CategoriesEventCopyWith<$Res>  {
$CategoriesEventCopyWith(CategoriesEvent _, $Res Function(CategoriesEvent) __);
}


/// Adds pattern-matching-related methods to [CategoriesEvent].
extension CategoriesEventPatterns on CategoriesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CategoriesTreeRequested value)?  treeRequested,TResult Function( CategoriesCategoryRequested value)?  categoryRequested,TResult Function( CategoriesViewModeToggled value)?  viewModeToggled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CategoriesTreeRequested() when treeRequested != null:
return treeRequested(_that);case CategoriesCategoryRequested() when categoryRequested != null:
return categoryRequested(_that);case CategoriesViewModeToggled() when viewModeToggled != null:
return viewModeToggled(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CategoriesTreeRequested value)  treeRequested,required TResult Function( CategoriesCategoryRequested value)  categoryRequested,required TResult Function( CategoriesViewModeToggled value)  viewModeToggled,}){
final _that = this;
switch (_that) {
case CategoriesTreeRequested():
return treeRequested(_that);case CategoriesCategoryRequested():
return categoryRequested(_that);case CategoriesViewModeToggled():
return viewModeToggled(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CategoriesTreeRequested value)?  treeRequested,TResult? Function( CategoriesCategoryRequested value)?  categoryRequested,TResult? Function( CategoriesViewModeToggled value)?  viewModeToggled,}){
final _that = this;
switch (_that) {
case CategoriesTreeRequested() when treeRequested != null:
return treeRequested(_that);case CategoriesCategoryRequested() when categoryRequested != null:
return categoryRequested(_that);case CategoriesViewModeToggled() when viewModeToggled != null:
return viewModeToggled(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool refresh)?  treeRequested,TResult Function( String idOrSlug)?  categoryRequested,TResult Function()?  viewModeToggled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CategoriesTreeRequested() when treeRequested != null:
return treeRequested(_that.refresh);case CategoriesCategoryRequested() when categoryRequested != null:
return categoryRequested(_that.idOrSlug);case CategoriesViewModeToggled() when viewModeToggled != null:
return viewModeToggled();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool refresh)  treeRequested,required TResult Function( String idOrSlug)  categoryRequested,required TResult Function()  viewModeToggled,}) {final _that = this;
switch (_that) {
case CategoriesTreeRequested():
return treeRequested(_that.refresh);case CategoriesCategoryRequested():
return categoryRequested(_that.idOrSlug);case CategoriesViewModeToggled():
return viewModeToggled();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool refresh)?  treeRequested,TResult? Function( String idOrSlug)?  categoryRequested,TResult? Function()?  viewModeToggled,}) {final _that = this;
switch (_that) {
case CategoriesTreeRequested() when treeRequested != null:
return treeRequested(_that.refresh);case CategoriesCategoryRequested() when categoryRequested != null:
return categoryRequested(_that.idOrSlug);case CategoriesViewModeToggled() when viewModeToggled != null:
return viewModeToggled();case _:
  return null;

}
}

}

/// @nodoc


class CategoriesTreeRequested implements CategoriesEvent {
  const CategoriesTreeRequested({this.refresh = false});
  

@JsonKey() final  bool refresh;

/// Create a copy of CategoriesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoriesTreeRequestedCopyWith<CategoriesTreeRequested> get copyWith => _$CategoriesTreeRequestedCopyWithImpl<CategoriesTreeRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesTreeRequested&&(identical(other.refresh, refresh) || other.refresh == refresh));
}


@override
int get hashCode => Object.hash(runtimeType,refresh);

@override
String toString() {
  return 'CategoriesEvent.treeRequested(refresh: $refresh)';
}


}

/// @nodoc
abstract mixin class $CategoriesTreeRequestedCopyWith<$Res> implements $CategoriesEventCopyWith<$Res> {
  factory $CategoriesTreeRequestedCopyWith(CategoriesTreeRequested value, $Res Function(CategoriesTreeRequested) _then) = _$CategoriesTreeRequestedCopyWithImpl;
@useResult
$Res call({
 bool refresh
});




}
/// @nodoc
class _$CategoriesTreeRequestedCopyWithImpl<$Res>
    implements $CategoriesTreeRequestedCopyWith<$Res> {
  _$CategoriesTreeRequestedCopyWithImpl(this._self, this._then);

  final CategoriesTreeRequested _self;
  final $Res Function(CategoriesTreeRequested) _then;

/// Create a copy of CategoriesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? refresh = null,}) {
  return _then(CategoriesTreeRequested(
refresh: null == refresh ? _self.refresh : refresh // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class CategoriesCategoryRequested implements CategoriesEvent {
  const CategoriesCategoryRequested(this.idOrSlug);
  

 final  String idOrSlug;

/// Create a copy of CategoriesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoriesCategoryRequestedCopyWith<CategoriesCategoryRequested> get copyWith => _$CategoriesCategoryRequestedCopyWithImpl<CategoriesCategoryRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesCategoryRequested&&(identical(other.idOrSlug, idOrSlug) || other.idOrSlug == idOrSlug));
}


@override
int get hashCode => Object.hash(runtimeType,idOrSlug);

@override
String toString() {
  return 'CategoriesEvent.categoryRequested(idOrSlug: $idOrSlug)';
}


}

/// @nodoc
abstract mixin class $CategoriesCategoryRequestedCopyWith<$Res> implements $CategoriesEventCopyWith<$Res> {
  factory $CategoriesCategoryRequestedCopyWith(CategoriesCategoryRequested value, $Res Function(CategoriesCategoryRequested) _then) = _$CategoriesCategoryRequestedCopyWithImpl;
@useResult
$Res call({
 String idOrSlug
});




}
/// @nodoc
class _$CategoriesCategoryRequestedCopyWithImpl<$Res>
    implements $CategoriesCategoryRequestedCopyWith<$Res> {
  _$CategoriesCategoryRequestedCopyWithImpl(this._self, this._then);

  final CategoriesCategoryRequested _self;
  final $Res Function(CategoriesCategoryRequested) _then;

/// Create a copy of CategoriesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? idOrSlug = null,}) {
  return _then(CategoriesCategoryRequested(
null == idOrSlug ? _self.idOrSlug : idOrSlug // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CategoriesViewModeToggled implements CategoriesEvent {
  const CategoriesViewModeToggled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesViewModeToggled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoriesEvent.viewModeToggled()';
}


}




// dart format on
