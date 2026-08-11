// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counterparty_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CounterpartyView {

 String get accountId; String get name; String? get city; bool get isAuthorized;
/// Create a copy of CounterpartyView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CounterpartyViewCopyWith<CounterpartyView> get copyWith => _$CounterpartyViewCopyWithImpl<CounterpartyView>(this as CounterpartyView, _$identity);

  /// Serializes this CounterpartyView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CounterpartyView&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.name, name) || other.name == name)&&(identical(other.city, city) || other.city == city)&&(identical(other.isAuthorized, isAuthorized) || other.isAuthorized == isAuthorized));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,name,city,isAuthorized);

@override
String toString() {
  return 'CounterpartyView(accountId: $accountId, name: $name, city: $city, isAuthorized: $isAuthorized)';
}


}

/// @nodoc
abstract mixin class $CounterpartyViewCopyWith<$Res>  {
  factory $CounterpartyViewCopyWith(CounterpartyView value, $Res Function(CounterpartyView) _then) = _$CounterpartyViewCopyWithImpl;
@useResult
$Res call({
 String accountId, String name, String? city, bool isAuthorized
});




}
/// @nodoc
class _$CounterpartyViewCopyWithImpl<$Res>
    implements $CounterpartyViewCopyWith<$Res> {
  _$CounterpartyViewCopyWithImpl(this._self, this._then);

  final CounterpartyView _self;
  final $Res Function(CounterpartyView) _then;

/// Create a copy of CounterpartyView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountId = null,Object? name = null,Object? city = freezed,Object? isAuthorized = null,}) {
  return _then(_self.copyWith(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,isAuthorized: null == isAuthorized ? _self.isAuthorized : isAuthorized // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CounterpartyView].
extension CounterpartyViewPatterns on CounterpartyView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CounterpartyView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CounterpartyView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CounterpartyView value)  $default,){
final _that = this;
switch (_that) {
case _CounterpartyView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CounterpartyView value)?  $default,){
final _that = this;
switch (_that) {
case _CounterpartyView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accountId,  String name,  String? city,  bool isAuthorized)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CounterpartyView() when $default != null:
return $default(_that.accountId,_that.name,_that.city,_that.isAuthorized);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accountId,  String name,  String? city,  bool isAuthorized)  $default,) {final _that = this;
switch (_that) {
case _CounterpartyView():
return $default(_that.accountId,_that.name,_that.city,_that.isAuthorized);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accountId,  String name,  String? city,  bool isAuthorized)?  $default,) {final _that = this;
switch (_that) {
case _CounterpartyView() when $default != null:
return $default(_that.accountId,_that.name,_that.city,_that.isAuthorized);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CounterpartyView implements CounterpartyView {
  const _CounterpartyView({required this.accountId, required this.name, this.city, required this.isAuthorized});
  factory _CounterpartyView.fromJson(Map<String, dynamic> json) => _$CounterpartyViewFromJson(json);

@override final  String accountId;
@override final  String name;
@override final  String? city;
@override final  bool isAuthorized;

/// Create a copy of CounterpartyView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CounterpartyViewCopyWith<_CounterpartyView> get copyWith => __$CounterpartyViewCopyWithImpl<_CounterpartyView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CounterpartyViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CounterpartyView&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.name, name) || other.name == name)&&(identical(other.city, city) || other.city == city)&&(identical(other.isAuthorized, isAuthorized) || other.isAuthorized == isAuthorized));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,name,city,isAuthorized);

@override
String toString() {
  return 'CounterpartyView(accountId: $accountId, name: $name, city: $city, isAuthorized: $isAuthorized)';
}


}

/// @nodoc
abstract mixin class _$CounterpartyViewCopyWith<$Res> implements $CounterpartyViewCopyWith<$Res> {
  factory _$CounterpartyViewCopyWith(_CounterpartyView value, $Res Function(_CounterpartyView) _then) = __$CounterpartyViewCopyWithImpl;
@override @useResult
$Res call({
 String accountId, String name, String? city, bool isAuthorized
});




}
/// @nodoc
class __$CounterpartyViewCopyWithImpl<$Res>
    implements _$CounterpartyViewCopyWith<$Res> {
  __$CounterpartyViewCopyWithImpl(this._self, this._then);

  final _CounterpartyView _self;
  final $Res Function(_CounterpartyView) _then;

/// Create a copy of CounterpartyView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountId = null,Object? name = null,Object? city = freezed,Object? isAuthorized = null,}) {
  return _then(_CounterpartyView(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,isAuthorized: null == isAuthorized ? _self.isAuthorized : isAuthorized // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
