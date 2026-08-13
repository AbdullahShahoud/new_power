// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response_meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiResponseMeta {

 DateTime? get timestamp; String? get path; String? get correlationId;
/// Create a copy of ApiResponseMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiResponseMetaCopyWith<ApiResponseMeta> get copyWith => _$ApiResponseMetaCopyWithImpl<ApiResponseMeta>(this as ApiResponseMeta, _$identity);

  /// Serializes this ApiResponseMeta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiResponseMeta&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.path, path) || other.path == path)&&(identical(other.correlationId, correlationId) || other.correlationId == correlationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,path,correlationId);

@override
String toString() {
  return 'ApiResponseMeta(timestamp: $timestamp, path: $path, correlationId: $correlationId)';
}


}

/// @nodoc
abstract mixin class $ApiResponseMetaCopyWith<$Res>  {
  factory $ApiResponseMetaCopyWith(ApiResponseMeta value, $Res Function(ApiResponseMeta) _then) = _$ApiResponseMetaCopyWithImpl;
@useResult
$Res call({
 DateTime? timestamp, String? path, String? correlationId
});




}
/// @nodoc
class _$ApiResponseMetaCopyWithImpl<$Res>
    implements $ApiResponseMetaCopyWith<$Res> {
  _$ApiResponseMetaCopyWithImpl(this._self, this._then);

  final ApiResponseMeta _self;
  final $Res Function(ApiResponseMeta) _then;

/// Create a copy of ApiResponseMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timestamp = freezed,Object? path = freezed,Object? correlationId = freezed,}) {
  return _then(_self.copyWith(
timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,correlationId: freezed == correlationId ? _self.correlationId : correlationId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiResponseMeta].
extension ApiResponseMetaPatterns on ApiResponseMeta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiResponseMeta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiResponseMeta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiResponseMeta value)  $default,){
final _that = this;
switch (_that) {
case _ApiResponseMeta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiResponseMeta value)?  $default,){
final _that = this;
switch (_that) {
case _ApiResponseMeta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime? timestamp,  String? path,  String? correlationId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiResponseMeta() when $default != null:
return $default(_that.timestamp,_that.path,_that.correlationId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime? timestamp,  String? path,  String? correlationId)  $default,) {final _that = this;
switch (_that) {
case _ApiResponseMeta():
return $default(_that.timestamp,_that.path,_that.correlationId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime? timestamp,  String? path,  String? correlationId)?  $default,) {final _that = this;
switch (_that) {
case _ApiResponseMeta() when $default != null:
return $default(_that.timestamp,_that.path,_that.correlationId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiResponseMeta implements ApiResponseMeta {
  const _ApiResponseMeta({this.timestamp, this.path, this.correlationId});
  factory _ApiResponseMeta.fromJson(Map<String, dynamic> json) => _$ApiResponseMetaFromJson(json);

@override final  DateTime? timestamp;
@override final  String? path;
@override final  String? correlationId;

/// Create a copy of ApiResponseMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiResponseMetaCopyWith<_ApiResponseMeta> get copyWith => __$ApiResponseMetaCopyWithImpl<_ApiResponseMeta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiResponseMetaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiResponseMeta&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.path, path) || other.path == path)&&(identical(other.correlationId, correlationId) || other.correlationId == correlationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,path,correlationId);

@override
String toString() {
  return 'ApiResponseMeta(timestamp: $timestamp, path: $path, correlationId: $correlationId)';
}


}

/// @nodoc
abstract mixin class _$ApiResponseMetaCopyWith<$Res> implements $ApiResponseMetaCopyWith<$Res> {
  factory _$ApiResponseMetaCopyWith(_ApiResponseMeta value, $Res Function(_ApiResponseMeta) _then) = __$ApiResponseMetaCopyWithImpl;
@override @useResult
$Res call({
 DateTime? timestamp, String? path, String? correlationId
});




}
/// @nodoc
class __$ApiResponseMetaCopyWithImpl<$Res>
    implements _$ApiResponseMetaCopyWith<$Res> {
  __$ApiResponseMetaCopyWithImpl(this._self, this._then);

  final _ApiResponseMeta _self;
  final $Res Function(_ApiResponseMeta) _then;

/// Create a copy of ApiResponseMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timestamp = freezed,Object? path = freezed,Object? correlationId = freezed,}) {
  return _then(_ApiResponseMeta(
timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,correlationId: freezed == correlationId ? _self.correlationId : correlationId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
