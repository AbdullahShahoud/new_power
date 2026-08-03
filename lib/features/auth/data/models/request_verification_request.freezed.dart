// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_verification_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RequestVerificationRequest {

 String get verificationId;
/// Create a copy of RequestVerificationRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestVerificationRequestCopyWith<RequestVerificationRequest> get copyWith => _$RequestVerificationRequestCopyWithImpl<RequestVerificationRequest>(this as RequestVerificationRequest, _$identity);

  /// Serializes this RequestVerificationRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestVerificationRequest&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,verificationId);



}

/// @nodoc
abstract mixin class $RequestVerificationRequestCopyWith<$Res>  {
  factory $RequestVerificationRequestCopyWith(RequestVerificationRequest value, $Res Function(RequestVerificationRequest) _then) = _$RequestVerificationRequestCopyWithImpl;
@useResult
$Res call({
 String verificationId
});




}
/// @nodoc
class _$RequestVerificationRequestCopyWithImpl<$Res>
    implements $RequestVerificationRequestCopyWith<$Res> {
  _$RequestVerificationRequestCopyWithImpl(this._self, this._then);

  final RequestVerificationRequest _self;
  final $Res Function(RequestVerificationRequest) _then;

/// Create a copy of RequestVerificationRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? verificationId = null,}) {
  return _then(_self.copyWith(
verificationId: null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestVerificationRequest].
extension RequestVerificationRequestPatterns on RequestVerificationRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestVerificationRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestVerificationRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestVerificationRequest value)  $default,){
final _that = this;
switch (_that) {
case _RequestVerificationRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestVerificationRequest value)?  $default,){
final _that = this;
switch (_that) {
case _RequestVerificationRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String verificationId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestVerificationRequest() when $default != null:
return $default(_that.verificationId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String verificationId)  $default,) {final _that = this;
switch (_that) {
case _RequestVerificationRequest():
return $default(_that.verificationId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String verificationId)?  $default,) {final _that = this;
switch (_that) {
case _RequestVerificationRequest() when $default != null:
return $default(_that.verificationId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestVerificationRequest implements RequestVerificationRequest {
  const _RequestVerificationRequest({required this.verificationId});
  factory _RequestVerificationRequest.fromJson(Map<String, dynamic> json) => _$RequestVerificationRequestFromJson(json);

@override final  String verificationId;

/// Create a copy of RequestVerificationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestVerificationRequestCopyWith<_RequestVerificationRequest> get copyWith => __$RequestVerificationRequestCopyWithImpl<_RequestVerificationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestVerificationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestVerificationRequest&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,verificationId);



}

/// @nodoc
abstract mixin class _$RequestVerificationRequestCopyWith<$Res> implements $RequestVerificationRequestCopyWith<$Res> {
  factory _$RequestVerificationRequestCopyWith(_RequestVerificationRequest value, $Res Function(_RequestVerificationRequest) _then) = __$RequestVerificationRequestCopyWithImpl;
@override @useResult
$Res call({
 String verificationId
});




}
/// @nodoc
class __$RequestVerificationRequestCopyWithImpl<$Res>
    implements _$RequestVerificationRequestCopyWith<$Res> {
  __$RequestVerificationRequestCopyWithImpl(this._self, this._then);

  final _RequestVerificationRequest _self;
  final $Res Function(_RequestVerificationRequest) _then;

/// Create a copy of RequestVerificationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? verificationId = null,}) {
  return _then(_RequestVerificationRequest(
verificationId: null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
