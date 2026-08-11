// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'decision_maker_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DecisionMakerResponse {

 bool? get success; String? get message; DecisionMakerView? get data; ApiResponseMeta? get meta;
/// Create a copy of DecisionMakerResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DecisionMakerResponseCopyWith<DecisionMakerResponse> get copyWith => _$DecisionMakerResponseCopyWithImpl<DecisionMakerResponse>(this as DecisionMakerResponse, _$identity);

  /// Serializes this DecisionMakerResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DecisionMakerResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data,meta);

@override
String toString() {
  return 'DecisionMakerResponse(success: $success, message: $message, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $DecisionMakerResponseCopyWith<$Res>  {
  factory $DecisionMakerResponseCopyWith(DecisionMakerResponse value, $Res Function(DecisionMakerResponse) _then) = _$DecisionMakerResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, DecisionMakerView? data, ApiResponseMeta? meta
});


$DecisionMakerViewCopyWith<$Res>? get data;$ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$DecisionMakerResponseCopyWithImpl<$Res>
    implements $DecisionMakerResponseCopyWith<$Res> {
  _$DecisionMakerResponseCopyWithImpl(this._self, this._then);

  final DecisionMakerResponse _self;
  final $Res Function(DecisionMakerResponse) _then;

/// Create a copy of DecisionMakerResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,Object? meta = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DecisionMakerView?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}
/// Create a copy of DecisionMakerResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DecisionMakerViewCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $DecisionMakerViewCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of DecisionMakerResponse
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


/// Adds pattern-matching-related methods to [DecisionMakerResponse].
extension DecisionMakerResponsePatterns on DecisionMakerResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DecisionMakerResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DecisionMakerResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DecisionMakerResponse value)  $default,){
final _that = this;
switch (_that) {
case _DecisionMakerResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DecisionMakerResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DecisionMakerResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  DecisionMakerView? data,  ApiResponseMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DecisionMakerResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  DecisionMakerView? data,  ApiResponseMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _DecisionMakerResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  DecisionMakerView? data,  ApiResponseMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _DecisionMakerResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DecisionMakerResponse implements DecisionMakerResponse {
  const _DecisionMakerResponse({this.success, this.message, this.data, this.meta});
  factory _DecisionMakerResponse.fromJson(Map<String, dynamic> json) => _$DecisionMakerResponseFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  DecisionMakerView? data;
@override final  ApiResponseMeta? meta;

/// Create a copy of DecisionMakerResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DecisionMakerResponseCopyWith<_DecisionMakerResponse> get copyWith => __$DecisionMakerResponseCopyWithImpl<_DecisionMakerResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DecisionMakerResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DecisionMakerResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data,meta);

@override
String toString() {
  return 'DecisionMakerResponse(success: $success, message: $message, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$DecisionMakerResponseCopyWith<$Res> implements $DecisionMakerResponseCopyWith<$Res> {
  factory _$DecisionMakerResponseCopyWith(_DecisionMakerResponse value, $Res Function(_DecisionMakerResponse) _then) = __$DecisionMakerResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, DecisionMakerView? data, ApiResponseMeta? meta
});


@override $DecisionMakerViewCopyWith<$Res>? get data;@override $ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$DecisionMakerResponseCopyWithImpl<$Res>
    implements _$DecisionMakerResponseCopyWith<$Res> {
  __$DecisionMakerResponseCopyWithImpl(this._self, this._then);

  final _DecisionMakerResponse _self;
  final $Res Function(_DecisionMakerResponse) _then;

/// Create a copy of DecisionMakerResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,Object? meta = freezed,}) {
  return _then(_DecisionMakerResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DecisionMakerView?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}

/// Create a copy of DecisionMakerResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DecisionMakerViewCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $DecisionMakerViewCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of DecisionMakerResponse
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
mixin _$DecisionMakerHistoryResponse {

 bool? get success; String? get message; List<DecisionMakerHistoryEntry> get data; PaginationMeta get pagination; ApiResponseMeta? get meta;
/// Create a copy of DecisionMakerHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DecisionMakerHistoryResponseCopyWith<DecisionMakerHistoryResponse> get copyWith => _$DecisionMakerHistoryResponseCopyWithImpl<DecisionMakerHistoryResponse>(this as DecisionMakerHistoryResponse, _$identity);

  /// Serializes this DecisionMakerHistoryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DecisionMakerHistoryResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data),pagination,meta);

@override
String toString() {
  return 'DecisionMakerHistoryResponse(success: $success, message: $message, data: $data, pagination: $pagination, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $DecisionMakerHistoryResponseCopyWith<$Res>  {
  factory $DecisionMakerHistoryResponseCopyWith(DecisionMakerHistoryResponse value, $Res Function(DecisionMakerHistoryResponse) _then) = _$DecisionMakerHistoryResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, List<DecisionMakerHistoryEntry> data, PaginationMeta pagination, ApiResponseMeta? meta
});


$PaginationMetaCopyWith<$Res> get pagination;$ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$DecisionMakerHistoryResponseCopyWithImpl<$Res>
    implements $DecisionMakerHistoryResponseCopyWith<$Res> {
  _$DecisionMakerHistoryResponseCopyWithImpl(this._self, this._then);

  final DecisionMakerHistoryResponse _self;
  final $Res Function(DecisionMakerHistoryResponse) _then;

/// Create a copy of DecisionMakerHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? pagination = null,Object? meta = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<DecisionMakerHistoryEntry>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationMeta,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}
/// Create a copy of DecisionMakerHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res> get pagination {
  
  return $PaginationMetaCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}/// Create a copy of DecisionMakerHistoryResponse
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


/// Adds pattern-matching-related methods to [DecisionMakerHistoryResponse].
extension DecisionMakerHistoryResponsePatterns on DecisionMakerHistoryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DecisionMakerHistoryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DecisionMakerHistoryResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DecisionMakerHistoryResponse value)  $default,){
final _that = this;
switch (_that) {
case _DecisionMakerHistoryResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DecisionMakerHistoryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DecisionMakerHistoryResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<DecisionMakerHistoryEntry> data,  PaginationMeta pagination,  ApiResponseMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DecisionMakerHistoryResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.pagination,_that.meta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<DecisionMakerHistoryEntry> data,  PaginationMeta pagination,  ApiResponseMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _DecisionMakerHistoryResponse():
return $default(_that.success,_that.message,_that.data,_that.pagination,_that.meta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  List<DecisionMakerHistoryEntry> data,  PaginationMeta pagination,  ApiResponseMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _DecisionMakerHistoryResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.pagination,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DecisionMakerHistoryResponse implements DecisionMakerHistoryResponse {
  const _DecisionMakerHistoryResponse({this.success, this.message, final  List<DecisionMakerHistoryEntry> data = const <DecisionMakerHistoryEntry>[], required this.pagination, this.meta}): _data = data;
  factory _DecisionMakerHistoryResponse.fromJson(Map<String, dynamic> json) => _$DecisionMakerHistoryResponseFromJson(json);

@override final  bool? success;
@override final  String? message;
 final  List<DecisionMakerHistoryEntry> _data;
@override@JsonKey() List<DecisionMakerHistoryEntry> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  PaginationMeta pagination;
@override final  ApiResponseMeta? meta;

/// Create a copy of DecisionMakerHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DecisionMakerHistoryResponseCopyWith<_DecisionMakerHistoryResponse> get copyWith => __$DecisionMakerHistoryResponseCopyWithImpl<_DecisionMakerHistoryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DecisionMakerHistoryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DecisionMakerHistoryResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data),pagination,meta);

@override
String toString() {
  return 'DecisionMakerHistoryResponse(success: $success, message: $message, data: $data, pagination: $pagination, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$DecisionMakerHistoryResponseCopyWith<$Res> implements $DecisionMakerHistoryResponseCopyWith<$Res> {
  factory _$DecisionMakerHistoryResponseCopyWith(_DecisionMakerHistoryResponse value, $Res Function(_DecisionMakerHistoryResponse) _then) = __$DecisionMakerHistoryResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, List<DecisionMakerHistoryEntry> data, PaginationMeta pagination, ApiResponseMeta? meta
});


@override $PaginationMetaCopyWith<$Res> get pagination;@override $ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$DecisionMakerHistoryResponseCopyWithImpl<$Res>
    implements _$DecisionMakerHistoryResponseCopyWith<$Res> {
  __$DecisionMakerHistoryResponseCopyWithImpl(this._self, this._then);

  final _DecisionMakerHistoryResponse _self;
  final $Res Function(_DecisionMakerHistoryResponse) _then;

/// Create a copy of DecisionMakerHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? pagination = null,Object? meta = freezed,}) {
  return _then(_DecisionMakerHistoryResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<DecisionMakerHistoryEntry>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationMeta,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}

/// Create a copy of DecisionMakerHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res> get pagination {
  
  return $PaginationMetaCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}/// Create a copy of DecisionMakerHistoryResponse
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
