// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoriesState {

 CategoriesStatus get status;/// Root nodes with `children` populated (`?tree=true`).
 List<CategoryView> get roots; String? get errorMessage;/// True when the failure was `CATALOG_NO_PUBLISHED_VERSION`. The
/// taxonomy itself is **not** version-gated, so this can only arrive
/// from a sibling call — the state carries it so the screen shows
/// "catalogue not available yet" rather than a generic network error.
 bool get catalogUnavailable;// ── one category (child screen) ──────────────────────────────────
 CategoriesStatus get detailStatus; GetCategoryResultView? get selected; String? get detailErrorMessage; CategoryViewMode get viewMode;
/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoriesStateCopyWith<CategoriesState> get copyWith => _$CategoriesStateCopyWithImpl<CategoriesState>(this as CategoriesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.roots, roots)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.catalogUnavailable, catalogUnavailable) || other.catalogUnavailable == catalogUnavailable)&&(identical(other.detailStatus, detailStatus) || other.detailStatus == detailStatus)&&(identical(other.selected, selected) || other.selected == selected)&&(identical(other.detailErrorMessage, detailErrorMessage) || other.detailErrorMessage == detailErrorMessage)&&(identical(other.viewMode, viewMode) || other.viewMode == viewMode));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(roots),errorMessage,catalogUnavailable,detailStatus,selected,detailErrorMessage,viewMode);

@override
String toString() {
  return 'CategoriesState(status: $status, roots: $roots, errorMessage: $errorMessage, catalogUnavailable: $catalogUnavailable, detailStatus: $detailStatus, selected: $selected, detailErrorMessage: $detailErrorMessage, viewMode: $viewMode)';
}


}

/// @nodoc
abstract mixin class $CategoriesStateCopyWith<$Res>  {
  factory $CategoriesStateCopyWith(CategoriesState value, $Res Function(CategoriesState) _then) = _$CategoriesStateCopyWithImpl;
@useResult
$Res call({
 CategoriesStatus status, List<CategoryView> roots, String? errorMessage, bool catalogUnavailable, CategoriesStatus detailStatus, GetCategoryResultView? selected, String? detailErrorMessage, CategoryViewMode viewMode
});


$GetCategoryResultViewCopyWith<$Res>? get selected;

}
/// @nodoc
class _$CategoriesStateCopyWithImpl<$Res>
    implements $CategoriesStateCopyWith<$Res> {
  _$CategoriesStateCopyWithImpl(this._self, this._then);

  final CategoriesState _self;
  final $Res Function(CategoriesState) _then;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? roots = null,Object? errorMessage = freezed,Object? catalogUnavailable = null,Object? detailStatus = null,Object? selected = freezed,Object? detailErrorMessage = freezed,Object? viewMode = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CategoriesStatus,roots: null == roots ? _self.roots : roots // ignore: cast_nullable_to_non_nullable
as List<CategoryView>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,catalogUnavailable: null == catalogUnavailable ? _self.catalogUnavailable : catalogUnavailable // ignore: cast_nullable_to_non_nullable
as bool,detailStatus: null == detailStatus ? _self.detailStatus : detailStatus // ignore: cast_nullable_to_non_nullable
as CategoriesStatus,selected: freezed == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as GetCategoryResultView?,detailErrorMessage: freezed == detailErrorMessage ? _self.detailErrorMessage : detailErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,viewMode: null == viewMode ? _self.viewMode : viewMode // ignore: cast_nullable_to_non_nullable
as CategoryViewMode,
  ));
}
/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GetCategoryResultViewCopyWith<$Res>? get selected {
    if (_self.selected == null) {
    return null;
  }

  return $GetCategoryResultViewCopyWith<$Res>(_self.selected!, (value) {
    return _then(_self.copyWith(selected: value));
  });
}
}


/// Adds pattern-matching-related methods to [CategoriesState].
extension CategoriesStatePatterns on CategoriesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoriesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoriesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoriesState value)  $default,){
final _that = this;
switch (_that) {
case _CategoriesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoriesState value)?  $default,){
final _that = this;
switch (_that) {
case _CategoriesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CategoriesStatus status,  List<CategoryView> roots,  String? errorMessage,  bool catalogUnavailable,  CategoriesStatus detailStatus,  GetCategoryResultView? selected,  String? detailErrorMessage,  CategoryViewMode viewMode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoriesState() when $default != null:
return $default(_that.status,_that.roots,_that.errorMessage,_that.catalogUnavailable,_that.detailStatus,_that.selected,_that.detailErrorMessage,_that.viewMode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CategoriesStatus status,  List<CategoryView> roots,  String? errorMessage,  bool catalogUnavailable,  CategoriesStatus detailStatus,  GetCategoryResultView? selected,  String? detailErrorMessage,  CategoryViewMode viewMode)  $default,) {final _that = this;
switch (_that) {
case _CategoriesState():
return $default(_that.status,_that.roots,_that.errorMessage,_that.catalogUnavailable,_that.detailStatus,_that.selected,_that.detailErrorMessage,_that.viewMode);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CategoriesStatus status,  List<CategoryView> roots,  String? errorMessage,  bool catalogUnavailable,  CategoriesStatus detailStatus,  GetCategoryResultView? selected,  String? detailErrorMessage,  CategoryViewMode viewMode)?  $default,) {final _that = this;
switch (_that) {
case _CategoriesState() when $default != null:
return $default(_that.status,_that.roots,_that.errorMessage,_that.catalogUnavailable,_that.detailStatus,_that.selected,_that.detailErrorMessage,_that.viewMode);case _:
  return null;

}
}

}

/// @nodoc


class _CategoriesState implements CategoriesState {
  const _CategoriesState({this.status = CategoriesStatus.initial, final  List<CategoryView> roots = const <CategoryView>[], this.errorMessage, this.catalogUnavailable = false, this.detailStatus = CategoriesStatus.initial, this.selected, this.detailErrorMessage, this.viewMode = CategoryViewMode.grid}): _roots = roots;
  

@override@JsonKey() final  CategoriesStatus status;
/// Root nodes with `children` populated (`?tree=true`).
 final  List<CategoryView> _roots;
/// Root nodes with `children` populated (`?tree=true`).
@override@JsonKey() List<CategoryView> get roots {
  if (_roots is EqualUnmodifiableListView) return _roots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roots);
}

@override final  String? errorMessage;
/// True when the failure was `CATALOG_NO_PUBLISHED_VERSION`. The
/// taxonomy itself is **not** version-gated, so this can only arrive
/// from a sibling call — the state carries it so the screen shows
/// "catalogue not available yet" rather than a generic network error.
@override@JsonKey() final  bool catalogUnavailable;
// ── one category (child screen) ──────────────────────────────────
@override@JsonKey() final  CategoriesStatus detailStatus;
@override final  GetCategoryResultView? selected;
@override final  String? detailErrorMessage;
@override@JsonKey() final  CategoryViewMode viewMode;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoriesStateCopyWith<_CategoriesState> get copyWith => __$CategoriesStateCopyWithImpl<_CategoriesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoriesState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._roots, _roots)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.catalogUnavailable, catalogUnavailable) || other.catalogUnavailable == catalogUnavailable)&&(identical(other.detailStatus, detailStatus) || other.detailStatus == detailStatus)&&(identical(other.selected, selected) || other.selected == selected)&&(identical(other.detailErrorMessage, detailErrorMessage) || other.detailErrorMessage == detailErrorMessage)&&(identical(other.viewMode, viewMode) || other.viewMode == viewMode));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_roots),errorMessage,catalogUnavailable,detailStatus,selected,detailErrorMessage,viewMode);

@override
String toString() {
  return 'CategoriesState(status: $status, roots: $roots, errorMessage: $errorMessage, catalogUnavailable: $catalogUnavailable, detailStatus: $detailStatus, selected: $selected, detailErrorMessage: $detailErrorMessage, viewMode: $viewMode)';
}


}

/// @nodoc
abstract mixin class _$CategoriesStateCopyWith<$Res> implements $CategoriesStateCopyWith<$Res> {
  factory _$CategoriesStateCopyWith(_CategoriesState value, $Res Function(_CategoriesState) _then) = __$CategoriesStateCopyWithImpl;
@override @useResult
$Res call({
 CategoriesStatus status, List<CategoryView> roots, String? errorMessage, bool catalogUnavailable, CategoriesStatus detailStatus, GetCategoryResultView? selected, String? detailErrorMessage, CategoryViewMode viewMode
});


@override $GetCategoryResultViewCopyWith<$Res>? get selected;

}
/// @nodoc
class __$CategoriesStateCopyWithImpl<$Res>
    implements _$CategoriesStateCopyWith<$Res> {
  __$CategoriesStateCopyWithImpl(this._self, this._then);

  final _CategoriesState _self;
  final $Res Function(_CategoriesState) _then;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? roots = null,Object? errorMessage = freezed,Object? catalogUnavailable = null,Object? detailStatus = null,Object? selected = freezed,Object? detailErrorMessage = freezed,Object? viewMode = null,}) {
  return _then(_CategoriesState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CategoriesStatus,roots: null == roots ? _self._roots : roots // ignore: cast_nullable_to_non_nullable
as List<CategoryView>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,catalogUnavailable: null == catalogUnavailable ? _self.catalogUnavailable : catalogUnavailable // ignore: cast_nullable_to_non_nullable
as bool,detailStatus: null == detailStatus ? _self.detailStatus : detailStatus // ignore: cast_nullable_to_non_nullable
as CategoriesStatus,selected: freezed == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as GetCategoryResultView?,detailErrorMessage: freezed == detailErrorMessage ? _self.detailErrorMessage : detailErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,viewMode: null == viewMode ? _self.viewMode : viewMode // ignore: cast_nullable_to_non_nullable
as CategoryViewMode,
  ));
}

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GetCategoryResultViewCopyWith<$Res>? get selected {
    if (_self.selected == null) {
    return null;
  }

  return $GetCategoryResultViewCopyWith<$Res>(_self.selected!, (value) {
    return _then(_self.copyWith(selected: value));
  });
}
}

// dart format on
