// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_message_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserMessageResponse {

 bool? get success; String? get message; ApiResponseMeta? get meta;
/// Create a copy of UserMessageResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserMessageResponseCopyWith<UserMessageResponse> get copyWith => _$UserMessageResponseCopyWithImpl<UserMessageResponse>(this as UserMessageResponse, _$identity);

  /// Serializes this UserMessageResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserMessageResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,meta);

@override
String toString() {
  return 'UserMessageResponse(success: $success, message: $message, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $UserMessageResponseCopyWith<$Res>  {
  factory $UserMessageResponseCopyWith(UserMessageResponse value, $Res Function(UserMessageResponse) _then) = _$UserMessageResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, ApiResponseMeta? meta
});


$ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$UserMessageResponseCopyWithImpl<$Res>
    implements $UserMessageResponseCopyWith<$Res> {
  _$UserMessageResponseCopyWithImpl(this._self, this._then);

  final UserMessageResponse _self;
  final $Res Function(UserMessageResponse) _then;

/// Create a copy of UserMessageResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? meta = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}
/// Create a copy of UserMessageResponse
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


/// Adds pattern-matching-related methods to [UserMessageResponse].
extension UserMessageResponsePatterns on UserMessageResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserMessageResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserMessageResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserMessageResponse value)  $default,){
final _that = this;
switch (_that) {
case _UserMessageResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserMessageResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UserMessageResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  ApiResponseMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserMessageResponse() when $default != null:
return $default(_that.success,_that.message,_that.meta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  ApiResponseMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _UserMessageResponse():
return $default(_that.success,_that.message,_that.meta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  ApiResponseMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _UserMessageResponse() when $default != null:
return $default(_that.success,_that.message,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserMessageResponse implements UserMessageResponse {
  const _UserMessageResponse({this.success, this.message, this.meta});
  factory _UserMessageResponse.fromJson(Map<String, dynamic> json) => _$UserMessageResponseFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  ApiResponseMeta? meta;

/// Create a copy of UserMessageResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserMessageResponseCopyWith<_UserMessageResponse> get copyWith => __$UserMessageResponseCopyWithImpl<_UserMessageResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserMessageResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserMessageResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,meta);

@override
String toString() {
  return 'UserMessageResponse(success: $success, message: $message, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$UserMessageResponseCopyWith<$Res> implements $UserMessageResponseCopyWith<$Res> {
  factory _$UserMessageResponseCopyWith(_UserMessageResponse value, $Res Function(_UserMessageResponse) _then) = __$UserMessageResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, ApiResponseMeta? meta
});


@override $ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$UserMessageResponseCopyWithImpl<$Res>
    implements _$UserMessageResponseCopyWith<$Res> {
  __$UserMessageResponseCopyWithImpl(this._self, this._then);

  final _UserMessageResponse _self;
  final $Res Function(_UserMessageResponse) _then;

/// Create a copy of UserMessageResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? meta = freezed,}) {
  return _then(_UserMessageResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}

/// Create a copy of UserMessageResponse
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


/// @nodoc
mixin _$ChangeUsernameData {

 String get username;
/// Create a copy of ChangeUsernameData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeUsernameDataCopyWith<ChangeUsernameData> get copyWith => _$ChangeUsernameDataCopyWithImpl<ChangeUsernameData>(this as ChangeUsernameData, _$identity);

  /// Serializes this ChangeUsernameData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeUsernameData&&(identical(other.username, username) || other.username == username));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username);

@override
String toString() {
  return 'ChangeUsernameData(username: $username)';
}


}

/// @nodoc
abstract mixin class $ChangeUsernameDataCopyWith<$Res>  {
  factory $ChangeUsernameDataCopyWith(ChangeUsernameData value, $Res Function(ChangeUsernameData) _then) = _$ChangeUsernameDataCopyWithImpl;
@useResult
$Res call({
 String username
});




}
/// @nodoc
class _$ChangeUsernameDataCopyWithImpl<$Res>
    implements $ChangeUsernameDataCopyWith<$Res> {
  _$ChangeUsernameDataCopyWithImpl(this._self, this._then);

  final ChangeUsernameData _self;
  final $Res Function(ChangeUsernameData) _then;

/// Create a copy of ChangeUsernameData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = null,}) {
  return _then(_self.copyWith(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChangeUsernameData].
extension ChangeUsernameDataPatterns on ChangeUsernameData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChangeUsernameData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChangeUsernameData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChangeUsernameData value)  $default,){
final _that = this;
switch (_that) {
case _ChangeUsernameData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChangeUsernameData value)?  $default,){
final _that = this;
switch (_that) {
case _ChangeUsernameData() when $default != null:
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
case _ChangeUsernameData() when $default != null:
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
case _ChangeUsernameData():
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
case _ChangeUsernameData() when $default != null:
return $default(_that.username);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChangeUsernameData implements ChangeUsernameData {
  const _ChangeUsernameData({required this.username});
  factory _ChangeUsernameData.fromJson(Map<String, dynamic> json) => _$ChangeUsernameDataFromJson(json);

@override final  String username;

/// Create a copy of ChangeUsernameData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeUsernameDataCopyWith<_ChangeUsernameData> get copyWith => __$ChangeUsernameDataCopyWithImpl<_ChangeUsernameData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChangeUsernameDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeUsernameData&&(identical(other.username, username) || other.username == username));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username);

@override
String toString() {
  return 'ChangeUsernameData(username: $username)';
}


}

/// @nodoc
abstract mixin class _$ChangeUsernameDataCopyWith<$Res> implements $ChangeUsernameDataCopyWith<$Res> {
  factory _$ChangeUsernameDataCopyWith(_ChangeUsernameData value, $Res Function(_ChangeUsernameData) _then) = __$ChangeUsernameDataCopyWithImpl;
@override @useResult
$Res call({
 String username
});




}
/// @nodoc
class __$ChangeUsernameDataCopyWithImpl<$Res>
    implements _$ChangeUsernameDataCopyWith<$Res> {
  __$ChangeUsernameDataCopyWithImpl(this._self, this._then);

  final _ChangeUsernameData _self;
  final $Res Function(_ChangeUsernameData) _then;

/// Create a copy of ChangeUsernameData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = null,}) {
  return _then(_ChangeUsernameData(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ChangeUsernameResponse {

 bool? get success; String? get message; ChangeUsernameData get data; ApiResponseMeta? get meta;
/// Create a copy of ChangeUsernameResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeUsernameResponseCopyWith<ChangeUsernameResponse> get copyWith => _$ChangeUsernameResponseCopyWithImpl<ChangeUsernameResponse>(this as ChangeUsernameResponse, _$identity);

  /// Serializes this ChangeUsernameResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeUsernameResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data,meta);

@override
String toString() {
  return 'ChangeUsernameResponse(success: $success, message: $message, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $ChangeUsernameResponseCopyWith<$Res>  {
  factory $ChangeUsernameResponseCopyWith(ChangeUsernameResponse value, $Res Function(ChangeUsernameResponse) _then) = _$ChangeUsernameResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, ChangeUsernameData data, ApiResponseMeta? meta
});


$ChangeUsernameDataCopyWith<$Res> get data;$ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$ChangeUsernameResponseCopyWithImpl<$Res>
    implements $ChangeUsernameResponseCopyWith<$Res> {
  _$ChangeUsernameResponseCopyWithImpl(this._self, this._then);

  final ChangeUsernameResponse _self;
  final $Res Function(ChangeUsernameResponse) _then;

/// Create a copy of ChangeUsernameResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? meta = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ChangeUsernameData,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}
/// Create a copy of ChangeUsernameResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChangeUsernameDataCopyWith<$Res> get data {
  
  return $ChangeUsernameDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of ChangeUsernameResponse
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


/// Adds pattern-matching-related methods to [ChangeUsernameResponse].
extension ChangeUsernameResponsePatterns on ChangeUsernameResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChangeUsernameResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChangeUsernameResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChangeUsernameResponse value)  $default,){
final _that = this;
switch (_that) {
case _ChangeUsernameResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChangeUsernameResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ChangeUsernameResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  ChangeUsernameData data,  ApiResponseMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChangeUsernameResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  ChangeUsernameData data,  ApiResponseMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _ChangeUsernameResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  ChangeUsernameData data,  ApiResponseMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _ChangeUsernameResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChangeUsernameResponse implements ChangeUsernameResponse {
  const _ChangeUsernameResponse({this.success, this.message, required this.data, this.meta});
  factory _ChangeUsernameResponse.fromJson(Map<String, dynamic> json) => _$ChangeUsernameResponseFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  ChangeUsernameData data;
@override final  ApiResponseMeta? meta;

/// Create a copy of ChangeUsernameResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeUsernameResponseCopyWith<_ChangeUsernameResponse> get copyWith => __$ChangeUsernameResponseCopyWithImpl<_ChangeUsernameResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChangeUsernameResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeUsernameResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data,meta);

@override
String toString() {
  return 'ChangeUsernameResponse(success: $success, message: $message, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$ChangeUsernameResponseCopyWith<$Res> implements $ChangeUsernameResponseCopyWith<$Res> {
  factory _$ChangeUsernameResponseCopyWith(_ChangeUsernameResponse value, $Res Function(_ChangeUsernameResponse) _then) = __$ChangeUsernameResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, ChangeUsernameData data, ApiResponseMeta? meta
});


@override $ChangeUsernameDataCopyWith<$Res> get data;@override $ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$ChangeUsernameResponseCopyWithImpl<$Res>
    implements _$ChangeUsernameResponseCopyWith<$Res> {
  __$ChangeUsernameResponseCopyWithImpl(this._self, this._then);

  final _ChangeUsernameResponse _self;
  final $Res Function(_ChangeUsernameResponse) _then;

/// Create a copy of ChangeUsernameResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? meta = freezed,}) {
  return _then(_ChangeUsernameResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ChangeUsernameData,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}

/// Create a copy of ChangeUsernameResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChangeUsernameDataCopyWith<$Res> get data {
  
  return $ChangeUsernameDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of ChangeUsernameResponse
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
