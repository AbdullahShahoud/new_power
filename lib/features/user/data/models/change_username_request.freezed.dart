// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_username_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChangeUsernameRequest {

 String get username;
/// Create a copy of ChangeUsernameRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeUsernameRequestCopyWith<ChangeUsernameRequest> get copyWith => _$ChangeUsernameRequestCopyWithImpl<ChangeUsernameRequest>(this as ChangeUsernameRequest, _$identity);

  /// Serializes this ChangeUsernameRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeUsernameRequest&&(identical(other.username, username) || other.username == username));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username);

@override
String toString() {
  return 'ChangeUsernameRequest(username: $username)';
}


}

/// @nodoc
abstract mixin class $ChangeUsernameRequestCopyWith<$Res>  {
  factory $ChangeUsernameRequestCopyWith(ChangeUsernameRequest value, $Res Function(ChangeUsernameRequest) _then) = _$ChangeUsernameRequestCopyWithImpl;
@useResult
$Res call({
 String username
});




}
/// @nodoc
class _$ChangeUsernameRequestCopyWithImpl<$Res>
    implements $ChangeUsernameRequestCopyWith<$Res> {
  _$ChangeUsernameRequestCopyWithImpl(this._self, this._then);

  final ChangeUsernameRequest _self;
  final $Res Function(ChangeUsernameRequest) _then;

/// Create a copy of ChangeUsernameRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = null,}) {
  return _then(_self.copyWith(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChangeUsernameRequest].
extension ChangeUsernameRequestPatterns on ChangeUsernameRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChangeUsernameRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChangeUsernameRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChangeUsernameRequest value)  $default,){
final _that = this;
switch (_that) {
case _ChangeUsernameRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChangeUsernameRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ChangeUsernameRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String username)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChangeUsernameRequest() when $default != null:
return $default(_that.username);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String username)  $default,) {final _that = this;
switch (_that) {
case _ChangeUsernameRequest():
return $default(_that.username);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String username)?  $default,) {final _that = this;
switch (_that) {
case _ChangeUsernameRequest() when $default != null:
return $default(_that.username);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChangeUsernameRequest implements ChangeUsernameRequest {
  const _ChangeUsernameRequest({required this.username});
  factory _ChangeUsernameRequest.fromJson(Map<String, dynamic> json) => _$ChangeUsernameRequestFromJson(json);

@override final  String username;

/// Create a copy of ChangeUsernameRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeUsernameRequestCopyWith<_ChangeUsernameRequest> get copyWith => __$ChangeUsernameRequestCopyWithImpl<_ChangeUsernameRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChangeUsernameRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeUsernameRequest&&(identical(other.username, username) || other.username == username));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username);

@override
String toString() {
  return 'ChangeUsernameRequest(username: $username)';
}


}

/// @nodoc
abstract mixin class _$ChangeUsernameRequestCopyWith<$Res> implements $ChangeUsernameRequestCopyWith<$Res> {
  factory _$ChangeUsernameRequestCopyWith(_ChangeUsernameRequest value, $Res Function(_ChangeUsernameRequest) _then) = __$ChangeUsernameRequestCopyWithImpl;
@override @useResult
$Res call({
 String username
});




}
/// @nodoc
class __$ChangeUsernameRequestCopyWithImpl<$Res>
    implements _$ChangeUsernameRequestCopyWith<$Res> {
  __$ChangeUsernameRequestCopyWithImpl(this._self, this._then);

  final _ChangeUsernameRequest _self;
  final $Res Function(_ChangeUsernameRequest) _then;

/// Create a copy of ChangeUsernameRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = null,}) {
  return _then(_ChangeUsernameRequest(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
