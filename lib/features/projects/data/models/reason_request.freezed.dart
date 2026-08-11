// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reason_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReasonRequest {

 String get reason;
/// Create a copy of ReasonRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReasonRequestCopyWith<ReasonRequest> get copyWith => _$ReasonRequestCopyWithImpl<ReasonRequest>(this as ReasonRequest, _$identity);

  /// Serializes this ReasonRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReasonRequest&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reason);

@override
String toString() {
  return 'ReasonRequest(reason: $reason)';
}


}

/// @nodoc
abstract mixin class $ReasonRequestCopyWith<$Res>  {
  factory $ReasonRequestCopyWith(ReasonRequest value, $Res Function(ReasonRequest) _then) = _$ReasonRequestCopyWithImpl;
@useResult
$Res call({
 String reason
});




}
/// @nodoc
class _$ReasonRequestCopyWithImpl<$Res>
    implements $ReasonRequestCopyWith<$Res> {
  _$ReasonRequestCopyWithImpl(this._self, this._then);

  final ReasonRequest _self;
  final $Res Function(ReasonRequest) _then;

/// Create a copy of ReasonRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reason = null,}) {
  return _then(_self.copyWith(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ReasonRequest].
extension ReasonRequestPatterns on ReasonRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReasonRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReasonRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReasonRequest value)  $default,){
final _that = this;
switch (_that) {
case _ReasonRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReasonRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ReasonRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReasonRequest() when $default != null:
return $default(_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String reason)  $default,) {final _that = this;
switch (_that) {
case _ReasonRequest():
return $default(_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String reason)?  $default,) {final _that = this;
switch (_that) {
case _ReasonRequest() when $default != null:
return $default(_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReasonRequest implements ReasonRequest {
  const _ReasonRequest({required this.reason});
  factory _ReasonRequest.fromJson(Map<String, dynamic> json) => _$ReasonRequestFromJson(json);

@override final  String reason;

/// Create a copy of ReasonRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReasonRequestCopyWith<_ReasonRequest> get copyWith => __$ReasonRequestCopyWithImpl<_ReasonRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReasonRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReasonRequest&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reason);

@override
String toString() {
  return 'ReasonRequest(reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$ReasonRequestCopyWith<$Res> implements $ReasonRequestCopyWith<$Res> {
  factory _$ReasonRequestCopyWith(_ReasonRequest value, $Res Function(_ReasonRequest) _then) = __$ReasonRequestCopyWithImpl;
@override @useResult
$Res call({
 String reason
});




}
/// @nodoc
class __$ReasonRequestCopyWithImpl<$Res>
    implements _$ReasonRequestCopyWith<$Res> {
  __$ReasonRequestCopyWithImpl(this._self, this._then);

  final _ReasonRequest _self;
  final $Res Function(_ReasonRequest) _then;

/// Create a copy of ReasonRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reason = null,}) {
  return _then(_ReasonRequest(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
