// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_activities_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SyncActivitiesResponse {

 bool? get success; String? get message; SyncActivitiesResult get data; ApiResponseMeta? get meta;
/// Create a copy of SyncActivitiesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncActivitiesResponseCopyWith<SyncActivitiesResponse> get copyWith => _$SyncActivitiesResponseCopyWithImpl<SyncActivitiesResponse>(this as SyncActivitiesResponse, _$identity);

  /// Serializes this SyncActivitiesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncActivitiesResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data,meta);

@override
String toString() {
  return 'SyncActivitiesResponse(success: $success, message: $message, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $SyncActivitiesResponseCopyWith<$Res>  {
  factory $SyncActivitiesResponseCopyWith(SyncActivitiesResponse value, $Res Function(SyncActivitiesResponse) _then) = _$SyncActivitiesResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, SyncActivitiesResult data, ApiResponseMeta? meta
});


$SyncActivitiesResultCopyWith<$Res> get data;$ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$SyncActivitiesResponseCopyWithImpl<$Res>
    implements $SyncActivitiesResponseCopyWith<$Res> {
  _$SyncActivitiesResponseCopyWithImpl(this._self, this._then);

  final SyncActivitiesResponse _self;
  final $Res Function(SyncActivitiesResponse) _then;

/// Create a copy of SyncActivitiesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? meta = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SyncActivitiesResult,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}
/// Create a copy of SyncActivitiesResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SyncActivitiesResultCopyWith<$Res> get data {
  
  return $SyncActivitiesResultCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of SyncActivitiesResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiResponseMetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $ApiResponseMetaCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [SyncActivitiesResponse].
extension SyncActivitiesResponsePatterns on SyncActivitiesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SyncActivitiesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SyncActivitiesResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SyncActivitiesResponse value)  $default,){
final _that = this;
switch (_that) {
case _SyncActivitiesResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SyncActivitiesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SyncActivitiesResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  SyncActivitiesResult data,  ApiResponseMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SyncActivitiesResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.meta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  SyncActivitiesResult data,  ApiResponseMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _SyncActivitiesResponse():
return $default(_that.success,_that.message,_that.data,_that.meta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  SyncActivitiesResult data,  ApiResponseMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _SyncActivitiesResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SyncActivitiesResponse implements SyncActivitiesResponse {
  const _SyncActivitiesResponse({this.success, this.message, required this.data, this.meta});
  factory _SyncActivitiesResponse.fromJson(Map<String, dynamic> json) => _$SyncActivitiesResponseFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  SyncActivitiesResult data;
@override final  ApiResponseMeta? meta;

/// Create a copy of SyncActivitiesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SyncActivitiesResponseCopyWith<_SyncActivitiesResponse> get copyWith => __$SyncActivitiesResponseCopyWithImpl<_SyncActivitiesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SyncActivitiesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncActivitiesResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data,meta);

@override
String toString() {
  return 'SyncActivitiesResponse(success: $success, message: $message, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$SyncActivitiesResponseCopyWith<$Res> implements $SyncActivitiesResponseCopyWith<$Res> {
  factory _$SyncActivitiesResponseCopyWith(_SyncActivitiesResponse value, $Res Function(_SyncActivitiesResponse) _then) = __$SyncActivitiesResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, SyncActivitiesResult data, ApiResponseMeta? meta
});


@override $SyncActivitiesResultCopyWith<$Res> get data;@override $ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$SyncActivitiesResponseCopyWithImpl<$Res>
    implements _$SyncActivitiesResponseCopyWith<$Res> {
  __$SyncActivitiesResponseCopyWithImpl(this._self, this._then);

  final _SyncActivitiesResponse _self;
  final $Res Function(_SyncActivitiesResponse) _then;

/// Create a copy of SyncActivitiesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? meta = freezed,}) {
  return _then(_SyncActivitiesResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SyncActivitiesResult,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}

/// Create a copy of SyncActivitiesResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SyncActivitiesResultCopyWith<$Res> get data {
  
  return $SyncActivitiesResultCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of SyncActivitiesResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiResponseMetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $ApiResponseMetaCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}

// dart format on
