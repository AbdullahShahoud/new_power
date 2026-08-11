// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stakeholder_link_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StakeholderLinkResponse {

 bool? get success; String? get message; StakeholderLinkView get data; ApiResponseMeta? get meta;
/// Create a copy of StakeholderLinkResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StakeholderLinkResponseCopyWith<StakeholderLinkResponse> get copyWith => _$StakeholderLinkResponseCopyWithImpl<StakeholderLinkResponse>(this as StakeholderLinkResponse, _$identity);

  /// Serializes this StakeholderLinkResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StakeholderLinkResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data,meta);

@override
String toString() {
  return 'StakeholderLinkResponse(success: $success, message: $message, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $StakeholderLinkResponseCopyWith<$Res>  {
  factory $StakeholderLinkResponseCopyWith(StakeholderLinkResponse value, $Res Function(StakeholderLinkResponse) _then) = _$StakeholderLinkResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, StakeholderLinkView data, ApiResponseMeta? meta
});


$StakeholderLinkViewCopyWith<$Res> get data;$ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$StakeholderLinkResponseCopyWithImpl<$Res>
    implements $StakeholderLinkResponseCopyWith<$Res> {
  _$StakeholderLinkResponseCopyWithImpl(this._self, this._then);

  final StakeholderLinkResponse _self;
  final $Res Function(StakeholderLinkResponse) _then;

/// Create a copy of StakeholderLinkResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? meta = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as StakeholderLinkView,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}
/// Create a copy of StakeholderLinkResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StakeholderLinkViewCopyWith<$Res> get data {
  
  return $StakeholderLinkViewCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of StakeholderLinkResponse
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


/// Adds pattern-matching-related methods to [StakeholderLinkResponse].
extension StakeholderLinkResponsePatterns on StakeholderLinkResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StakeholderLinkResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StakeholderLinkResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StakeholderLinkResponse value)  $default,){
final _that = this;
switch (_that) {
case _StakeholderLinkResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StakeholderLinkResponse value)?  $default,){
final _that = this;
switch (_that) {
case _StakeholderLinkResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  StakeholderLinkView data,  ApiResponseMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StakeholderLinkResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  StakeholderLinkView data,  ApiResponseMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _StakeholderLinkResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  StakeholderLinkView data,  ApiResponseMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _StakeholderLinkResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StakeholderLinkResponse implements StakeholderLinkResponse {
  const _StakeholderLinkResponse({this.success, this.message, required this.data, this.meta});
  factory _StakeholderLinkResponse.fromJson(Map<String, dynamic> json) => _$StakeholderLinkResponseFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  StakeholderLinkView data;
@override final  ApiResponseMeta? meta;

/// Create a copy of StakeholderLinkResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StakeholderLinkResponseCopyWith<_StakeholderLinkResponse> get copyWith => __$StakeholderLinkResponseCopyWithImpl<_StakeholderLinkResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StakeholderLinkResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StakeholderLinkResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data,meta);

@override
String toString() {
  return 'StakeholderLinkResponse(success: $success, message: $message, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$StakeholderLinkResponseCopyWith<$Res> implements $StakeholderLinkResponseCopyWith<$Res> {
  factory _$StakeholderLinkResponseCopyWith(_StakeholderLinkResponse value, $Res Function(_StakeholderLinkResponse) _then) = __$StakeholderLinkResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, StakeholderLinkView data, ApiResponseMeta? meta
});


@override $StakeholderLinkViewCopyWith<$Res> get data;@override $ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$StakeholderLinkResponseCopyWithImpl<$Res>
    implements _$StakeholderLinkResponseCopyWith<$Res> {
  __$StakeholderLinkResponseCopyWithImpl(this._self, this._then);

  final _StakeholderLinkResponse _self;
  final $Res Function(_StakeholderLinkResponse) _then;

/// Create a copy of StakeholderLinkResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? meta = freezed,}) {
  return _then(_StakeholderLinkResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as StakeholderLinkView,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}

/// Create a copy of StakeholderLinkResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StakeholderLinkViewCopyWith<$Res> get data {
  
  return $StakeholderLinkViewCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of StakeholderLinkResponse
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
mixin _$StakeholderLinksListResponse {

 bool? get success; String? get message; List<StakeholderLinkView> get data; ApiResponseMeta? get meta;
/// Create a copy of StakeholderLinksListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StakeholderLinksListResponseCopyWith<StakeholderLinksListResponse> get copyWith => _$StakeholderLinksListResponseCopyWithImpl<StakeholderLinksListResponse>(this as StakeholderLinksListResponse, _$identity);

  /// Serializes this StakeholderLinksListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StakeholderLinksListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data),meta);

@override
String toString() {
  return 'StakeholderLinksListResponse(success: $success, message: $message, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $StakeholderLinksListResponseCopyWith<$Res>  {
  factory $StakeholderLinksListResponseCopyWith(StakeholderLinksListResponse value, $Res Function(StakeholderLinksListResponse) _then) = _$StakeholderLinksListResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, List<StakeholderLinkView> data, ApiResponseMeta? meta
});


$ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$StakeholderLinksListResponseCopyWithImpl<$Res>
    implements $StakeholderLinksListResponseCopyWith<$Res> {
  _$StakeholderLinksListResponseCopyWithImpl(this._self, this._then);

  final StakeholderLinksListResponse _self;
  final $Res Function(StakeholderLinksListResponse) _then;

/// Create a copy of StakeholderLinksListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? meta = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<StakeholderLinkView>,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}
/// Create a copy of StakeholderLinksListResponse
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


/// Adds pattern-matching-related methods to [StakeholderLinksListResponse].
extension StakeholderLinksListResponsePatterns on StakeholderLinksListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StakeholderLinksListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StakeholderLinksListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StakeholderLinksListResponse value)  $default,){
final _that = this;
switch (_that) {
case _StakeholderLinksListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StakeholderLinksListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _StakeholderLinksListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<StakeholderLinkView> data,  ApiResponseMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StakeholderLinksListResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<StakeholderLinkView> data,  ApiResponseMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _StakeholderLinksListResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  List<StakeholderLinkView> data,  ApiResponseMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _StakeholderLinksListResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StakeholderLinksListResponse implements StakeholderLinksListResponse {
  const _StakeholderLinksListResponse({this.success, this.message, final  List<StakeholderLinkView> data = const <StakeholderLinkView>[], this.meta}): _data = data;
  factory _StakeholderLinksListResponse.fromJson(Map<String, dynamic> json) => _$StakeholderLinksListResponseFromJson(json);

@override final  bool? success;
@override final  String? message;
 final  List<StakeholderLinkView> _data;
@override@JsonKey() List<StakeholderLinkView> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  ApiResponseMeta? meta;

/// Create a copy of StakeholderLinksListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StakeholderLinksListResponseCopyWith<_StakeholderLinksListResponse> get copyWith => __$StakeholderLinksListResponseCopyWithImpl<_StakeholderLinksListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StakeholderLinksListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StakeholderLinksListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data),meta);

@override
String toString() {
  return 'StakeholderLinksListResponse(success: $success, message: $message, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$StakeholderLinksListResponseCopyWith<$Res> implements $StakeholderLinksListResponseCopyWith<$Res> {
  factory _$StakeholderLinksListResponseCopyWith(_StakeholderLinksListResponse value, $Res Function(_StakeholderLinksListResponse) _then) = __$StakeholderLinksListResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, List<StakeholderLinkView> data, ApiResponseMeta? meta
});


@override $ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$StakeholderLinksListResponseCopyWithImpl<$Res>
    implements _$StakeholderLinksListResponseCopyWith<$Res> {
  __$StakeholderLinksListResponseCopyWithImpl(this._self, this._then);

  final _StakeholderLinksListResponse _self;
  final $Res Function(_StakeholderLinksListResponse) _then;

/// Create a copy of StakeholderLinksListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? meta = freezed,}) {
  return _then(_StakeholderLinksListResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<StakeholderLinkView>,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}

/// Create a copy of StakeholderLinksListResponse
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
