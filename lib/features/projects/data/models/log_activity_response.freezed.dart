// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log_activity_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LogActivityData {

 ActivityView get activity; String? get suggestion;
/// Create a copy of LogActivityData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogActivityDataCopyWith<LogActivityData> get copyWith => _$LogActivityDataCopyWithImpl<LogActivityData>(this as LogActivityData, _$identity);

  /// Serializes this LogActivityData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogActivityData&&(identical(other.activity, activity) || other.activity == activity)&&(identical(other.suggestion, suggestion) || other.suggestion == suggestion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activity,suggestion);

@override
String toString() {
  return 'LogActivityData(activity: $activity, suggestion: $suggestion)';
}


}

/// @nodoc
abstract mixin class $LogActivityDataCopyWith<$Res>  {
  factory $LogActivityDataCopyWith(LogActivityData value, $Res Function(LogActivityData) _then) = _$LogActivityDataCopyWithImpl;
@useResult
$Res call({
 ActivityView activity, String? suggestion
});


$ActivityViewCopyWith<$Res> get activity;

}
/// @nodoc
class _$LogActivityDataCopyWithImpl<$Res>
    implements $LogActivityDataCopyWith<$Res> {
  _$LogActivityDataCopyWithImpl(this._self, this._then);

  final LogActivityData _self;
  final $Res Function(LogActivityData) _then;

/// Create a copy of LogActivityData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activity = null,Object? suggestion = freezed,}) {
  return _then(_self.copyWith(
activity: null == activity ? _self.activity : activity // ignore: cast_nullable_to_non_nullable
as ActivityView,suggestion: freezed == suggestion ? _self.suggestion : suggestion // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of LogActivityData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActivityViewCopyWith<$Res> get activity {
  
  return $ActivityViewCopyWith<$Res>(_self.activity, (value) {
    return _then(_self.copyWith(activity: value));
  });
}
}


/// Adds pattern-matching-related methods to [LogActivityData].
extension LogActivityDataPatterns on LogActivityData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LogActivityData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LogActivityData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LogActivityData value)  $default,){
final _that = this;
switch (_that) {
case _LogActivityData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LogActivityData value)?  $default,){
final _that = this;
switch (_that) {
case _LogActivityData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ActivityView activity,  String? suggestion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LogActivityData() when $default != null:
return $default(_that.activity,_that.suggestion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ActivityView activity,  String? suggestion)  $default,) {final _that = this;
switch (_that) {
case _LogActivityData():
return $default(_that.activity,_that.suggestion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ActivityView activity,  String? suggestion)?  $default,) {final _that = this;
switch (_that) {
case _LogActivityData() when $default != null:
return $default(_that.activity,_that.suggestion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LogActivityData implements LogActivityData {
  const _LogActivityData({required this.activity, this.suggestion});
  factory _LogActivityData.fromJson(Map<String, dynamic> json) => _$LogActivityDataFromJson(json);

@override final  ActivityView activity;
@override final  String? suggestion;

/// Create a copy of LogActivityData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogActivityDataCopyWith<_LogActivityData> get copyWith => __$LogActivityDataCopyWithImpl<_LogActivityData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LogActivityDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogActivityData&&(identical(other.activity, activity) || other.activity == activity)&&(identical(other.suggestion, suggestion) || other.suggestion == suggestion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activity,suggestion);

@override
String toString() {
  return 'LogActivityData(activity: $activity, suggestion: $suggestion)';
}


}

/// @nodoc
abstract mixin class _$LogActivityDataCopyWith<$Res> implements $LogActivityDataCopyWith<$Res> {
  factory _$LogActivityDataCopyWith(_LogActivityData value, $Res Function(_LogActivityData) _then) = __$LogActivityDataCopyWithImpl;
@override @useResult
$Res call({
 ActivityView activity, String? suggestion
});


@override $ActivityViewCopyWith<$Res> get activity;

}
/// @nodoc
class __$LogActivityDataCopyWithImpl<$Res>
    implements _$LogActivityDataCopyWith<$Res> {
  __$LogActivityDataCopyWithImpl(this._self, this._then);

  final _LogActivityData _self;
  final $Res Function(_LogActivityData) _then;

/// Create a copy of LogActivityData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activity = null,Object? suggestion = freezed,}) {
  return _then(_LogActivityData(
activity: null == activity ? _self.activity : activity // ignore: cast_nullable_to_non_nullable
as ActivityView,suggestion: freezed == suggestion ? _self.suggestion : suggestion // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of LogActivityData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActivityViewCopyWith<$Res> get activity {
  
  return $ActivityViewCopyWith<$Res>(_self.activity, (value) {
    return _then(_self.copyWith(activity: value));
  });
}
}


/// @nodoc
mixin _$LogActivityResponse {

 bool? get success; String? get message; LogActivityData get data; ApiResponseMeta? get meta;
/// Create a copy of LogActivityResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogActivityResponseCopyWith<LogActivityResponse> get copyWith => _$LogActivityResponseCopyWithImpl<LogActivityResponse>(this as LogActivityResponse, _$identity);

  /// Serializes this LogActivityResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogActivityResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data,meta);

@override
String toString() {
  return 'LogActivityResponse(success: $success, message: $message, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $LogActivityResponseCopyWith<$Res>  {
  factory $LogActivityResponseCopyWith(LogActivityResponse value, $Res Function(LogActivityResponse) _then) = _$LogActivityResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, LogActivityData data, ApiResponseMeta? meta
});


$LogActivityDataCopyWith<$Res> get data;$ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$LogActivityResponseCopyWithImpl<$Res>
    implements $LogActivityResponseCopyWith<$Res> {
  _$LogActivityResponseCopyWithImpl(this._self, this._then);

  final LogActivityResponse _self;
  final $Res Function(LogActivityResponse) _then;

/// Create a copy of LogActivityResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? meta = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as LogActivityData,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}
/// Create a copy of LogActivityResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LogActivityDataCopyWith<$Res> get data {
  
  return $LogActivityDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of LogActivityResponse
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


/// Adds pattern-matching-related methods to [LogActivityResponse].
extension LogActivityResponsePatterns on LogActivityResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LogActivityResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LogActivityResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LogActivityResponse value)  $default,){
final _that = this;
switch (_that) {
case _LogActivityResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LogActivityResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LogActivityResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  LogActivityData data,  ApiResponseMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LogActivityResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  LogActivityData data,  ApiResponseMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _LogActivityResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  LogActivityData data,  ApiResponseMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _LogActivityResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LogActivityResponse implements LogActivityResponse {
  const _LogActivityResponse({this.success, this.message, required this.data, this.meta});
  factory _LogActivityResponse.fromJson(Map<String, dynamic> json) => _$LogActivityResponseFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  LogActivityData data;
@override final  ApiResponseMeta? meta;

/// Create a copy of LogActivityResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogActivityResponseCopyWith<_LogActivityResponse> get copyWith => __$LogActivityResponseCopyWithImpl<_LogActivityResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LogActivityResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogActivityResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data,meta);

@override
String toString() {
  return 'LogActivityResponse(success: $success, message: $message, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$LogActivityResponseCopyWith<$Res> implements $LogActivityResponseCopyWith<$Res> {
  factory _$LogActivityResponseCopyWith(_LogActivityResponse value, $Res Function(_LogActivityResponse) _then) = __$LogActivityResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, LogActivityData data, ApiResponseMeta? meta
});


@override $LogActivityDataCopyWith<$Res> get data;@override $ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$LogActivityResponseCopyWithImpl<$Res>
    implements _$LogActivityResponseCopyWith<$Res> {
  __$LogActivityResponseCopyWithImpl(this._self, this._then);

  final _LogActivityResponse _self;
  final $Res Function(_LogActivityResponse) _then;

/// Create a copy of LogActivityResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? meta = freezed,}) {
  return _then(_LogActivityResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as LogActivityData,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}

/// Create a copy of LogActivityResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LogActivityDataCopyWith<$Res> get data {
  
  return $LogActivityDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of LogActivityResponse
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
