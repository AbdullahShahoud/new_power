// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set_contact_account_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SetContactAccountRequest {

 String get accountId;
/// Create a copy of SetContactAccountRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetContactAccountRequestCopyWith<SetContactAccountRequest> get copyWith => _$SetContactAccountRequestCopyWithImpl<SetContactAccountRequest>(this as SetContactAccountRequest, _$identity);

  /// Serializes this SetContactAccountRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetContactAccountRequest&&(identical(other.accountId, accountId) || other.accountId == accountId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId);

@override
String toString() {
  return 'SetContactAccountRequest(accountId: $accountId)';
}


}

/// @nodoc
abstract mixin class $SetContactAccountRequestCopyWith<$Res>  {
  factory $SetContactAccountRequestCopyWith(SetContactAccountRequest value, $Res Function(SetContactAccountRequest) _then) = _$SetContactAccountRequestCopyWithImpl;
@useResult
$Res call({
 String accountId
});




}
/// @nodoc
class _$SetContactAccountRequestCopyWithImpl<$Res>
    implements $SetContactAccountRequestCopyWith<$Res> {
  _$SetContactAccountRequestCopyWithImpl(this._self, this._then);

  final SetContactAccountRequest _self;
  final $Res Function(SetContactAccountRequest) _then;

/// Create a copy of SetContactAccountRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountId = null,}) {
  return _then(_self.copyWith(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SetContactAccountRequest].
extension SetContactAccountRequestPatterns on SetContactAccountRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SetContactAccountRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SetContactAccountRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SetContactAccountRequest value)  $default,){
final _that = this;
switch (_that) {
case _SetContactAccountRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SetContactAccountRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SetContactAccountRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accountId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SetContactAccountRequest() when $default != null:
return $default(_that.accountId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accountId)  $default,) {final _that = this;
switch (_that) {
case _SetContactAccountRequest():
return $default(_that.accountId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accountId)?  $default,) {final _that = this;
switch (_that) {
case _SetContactAccountRequest() when $default != null:
return $default(_that.accountId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SetContactAccountRequest implements SetContactAccountRequest {
  const _SetContactAccountRequest({required this.accountId});
  factory _SetContactAccountRequest.fromJson(Map<String, dynamic> json) => _$SetContactAccountRequestFromJson(json);

@override final  String accountId;

/// Create a copy of SetContactAccountRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetContactAccountRequestCopyWith<_SetContactAccountRequest> get copyWith => __$SetContactAccountRequestCopyWithImpl<_SetContactAccountRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SetContactAccountRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetContactAccountRequest&&(identical(other.accountId, accountId) || other.accountId == accountId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId);

@override
String toString() {
  return 'SetContactAccountRequest(accountId: $accountId)';
}


}

/// @nodoc
abstract mixin class _$SetContactAccountRequestCopyWith<$Res> implements $SetContactAccountRequestCopyWith<$Res> {
  factory _$SetContactAccountRequestCopyWith(_SetContactAccountRequest value, $Res Function(_SetContactAccountRequest) _then) = __$SetContactAccountRequestCopyWithImpl;
@override @useResult
$Res call({
 String accountId
});




}
/// @nodoc
class __$SetContactAccountRequestCopyWithImpl<$Res>
    implements _$SetContactAccountRequestCopyWith<$Res> {
  __$SetContactAccountRequestCopyWithImpl(this._self, this._then);

  final _SetContactAccountRequest _self;
  final $Res Function(_SetContactAccountRequest) _then;

/// Create a copy of SetContactAccountRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountId = null,}) {
  return _then(_SetContactAccountRequest(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
