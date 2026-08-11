// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resolve_file_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResolveFileRequest {

 String get key;
/// Create a copy of ResolveFileRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResolveFileRequestCopyWith<ResolveFileRequest> get copyWith => _$ResolveFileRequestCopyWithImpl<ResolveFileRequest>(this as ResolveFileRequest, _$identity);

  /// Serializes this ResolveFileRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResolveFileRequest&&(identical(other.key, key) || other.key == key));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key);

@override
String toString() {
  return 'ResolveFileRequest(key: $key)';
}


}

/// @nodoc
abstract mixin class $ResolveFileRequestCopyWith<$Res>  {
  factory $ResolveFileRequestCopyWith(ResolveFileRequest value, $Res Function(ResolveFileRequest) _then) = _$ResolveFileRequestCopyWithImpl;
@useResult
$Res call({
 String key
});




}
/// @nodoc
class _$ResolveFileRequestCopyWithImpl<$Res>
    implements $ResolveFileRequestCopyWith<$Res> {
  _$ResolveFileRequestCopyWithImpl(this._self, this._then);

  final ResolveFileRequest _self;
  final $Res Function(ResolveFileRequest) _then;

/// Create a copy of ResolveFileRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ResolveFileRequest].
extension ResolveFileRequestPatterns on ResolveFileRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResolveFileRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResolveFileRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResolveFileRequest value)  $default,){
final _that = this;
switch (_that) {
case _ResolveFileRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResolveFileRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ResolveFileRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResolveFileRequest() when $default != null:
return $default(_that.key);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key)  $default,) {final _that = this;
switch (_that) {
case _ResolveFileRequest():
return $default(_that.key);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key)?  $default,) {final _that = this;
switch (_that) {
case _ResolveFileRequest() when $default != null:
return $default(_that.key);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResolveFileRequest implements ResolveFileRequest {
  const _ResolveFileRequest({required this.key});
  factory _ResolveFileRequest.fromJson(Map<String, dynamic> json) => _$ResolveFileRequestFromJson(json);

@override final  String key;

/// Create a copy of ResolveFileRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResolveFileRequestCopyWith<_ResolveFileRequest> get copyWith => __$ResolveFileRequestCopyWithImpl<_ResolveFileRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResolveFileRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResolveFileRequest&&(identical(other.key, key) || other.key == key));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key);

@override
String toString() {
  return 'ResolveFileRequest(key: $key)';
}


}

/// @nodoc
abstract mixin class _$ResolveFileRequestCopyWith<$Res> implements $ResolveFileRequestCopyWith<$Res> {
  factory _$ResolveFileRequestCopyWith(_ResolveFileRequest value, $Res Function(_ResolveFileRequest) _then) = __$ResolveFileRequestCopyWithImpl;
@override @useResult
$Res call({
 String key
});




}
/// @nodoc
class __$ResolveFileRequestCopyWithImpl<$Res>
    implements _$ResolveFileRequestCopyWith<$Res> {
  __$ResolveFileRequestCopyWithImpl(this._self, this._then);

  final _ResolveFileRequest _self;
  final $Res Function(_ResolveFileRequest) _then;

/// Create a copy of ResolveFileRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,}) {
  return _then(_ResolveFileRequest(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
