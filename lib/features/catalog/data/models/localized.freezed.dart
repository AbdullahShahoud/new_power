// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'localized.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Localized {

 String? get en; String get ar;
/// Create a copy of Localized
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalizedCopyWith<Localized> get copyWith => _$LocalizedCopyWithImpl<Localized>(this as Localized, _$identity);

  /// Serializes this Localized to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Localized&&(identical(other.en, en) || other.en == en)&&(identical(other.ar, ar) || other.ar == ar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,en,ar);

@override
String toString() {
  return 'Localized(en: $en, ar: $ar)';
}


}

/// @nodoc
abstract mixin class $LocalizedCopyWith<$Res>  {
  factory $LocalizedCopyWith(Localized value, $Res Function(Localized) _then) = _$LocalizedCopyWithImpl;
@useResult
$Res call({
 String? en, String ar
});




}
/// @nodoc
class _$LocalizedCopyWithImpl<$Res>
    implements $LocalizedCopyWith<$Res> {
  _$LocalizedCopyWithImpl(this._self, this._then);

  final Localized _self;
  final $Res Function(Localized) _then;

/// Create a copy of Localized
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? en = freezed,Object? ar = null,}) {
  return _then(_self.copyWith(
en: freezed == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as String?,ar: null == ar ? _self.ar : ar // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Localized].
extension LocalizedPatterns on Localized {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Localized value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Localized() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Localized value)  $default,){
final _that = this;
switch (_that) {
case _Localized():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Localized value)?  $default,){
final _that = this;
switch (_that) {
case _Localized() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? en,  String ar)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Localized() when $default != null:
return $default(_that.en,_that.ar);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? en,  String ar)  $default,) {final _that = this;
switch (_that) {
case _Localized():
return $default(_that.en,_that.ar);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? en,  String ar)?  $default,) {final _that = this;
switch (_that) {
case _Localized() when $default != null:
return $default(_that.en,_that.ar);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Localized implements Localized {
  const _Localized({this.en, required this.ar});
  factory _Localized.fromJson(Map<String, dynamic> json) => _$LocalizedFromJson(json);

@override final  String? en;
@override final  String ar;

/// Create a copy of Localized
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalizedCopyWith<_Localized> get copyWith => __$LocalizedCopyWithImpl<_Localized>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocalizedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Localized&&(identical(other.en, en) || other.en == en)&&(identical(other.ar, ar) || other.ar == ar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,en,ar);

@override
String toString() {
  return 'Localized(en: $en, ar: $ar)';
}


}

/// @nodoc
abstract mixin class _$LocalizedCopyWith<$Res> implements $LocalizedCopyWith<$Res> {
  factory _$LocalizedCopyWith(_Localized value, $Res Function(_Localized) _then) = __$LocalizedCopyWithImpl;
@override @useResult
$Res call({
 String? en, String ar
});




}
/// @nodoc
class __$LocalizedCopyWithImpl<$Res>
    implements _$LocalizedCopyWith<$Res> {
  __$LocalizedCopyWithImpl(this._self, this._then);

  final _Localized _self;
  final $Res Function(_Localized) _then;

/// Create a copy of Localized
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? en = freezed,Object? ar = null,}) {
  return _then(_Localized(
en: freezed == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as String?,ar: null == ar ? _self.ar : ar // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
