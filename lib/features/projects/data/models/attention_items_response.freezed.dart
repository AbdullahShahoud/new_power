// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attention_items_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AttentionItemsResponse {

 bool? get success; String? get message; List<AttentionItemView> get data; ApiResponseMeta? get meta;
/// Create a copy of AttentionItemsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttentionItemsResponseCopyWith<AttentionItemsResponse> get copyWith => _$AttentionItemsResponseCopyWithImpl<AttentionItemsResponse>(this as AttentionItemsResponse, _$identity);

  /// Serializes this AttentionItemsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttentionItemsResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data),meta);

@override
String toString() {
  return 'AttentionItemsResponse(success: $success, message: $message, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $AttentionItemsResponseCopyWith<$Res>  {
  factory $AttentionItemsResponseCopyWith(AttentionItemsResponse value, $Res Function(AttentionItemsResponse) _then) = _$AttentionItemsResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, List<AttentionItemView> data, ApiResponseMeta? meta
});


$ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$AttentionItemsResponseCopyWithImpl<$Res>
    implements $AttentionItemsResponseCopyWith<$Res> {
  _$AttentionItemsResponseCopyWithImpl(this._self, this._then);

  final AttentionItemsResponse _self;
  final $Res Function(AttentionItemsResponse) _then;

/// Create a copy of AttentionItemsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? meta = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<AttentionItemView>,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}
/// Create a copy of AttentionItemsResponse
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


/// Adds pattern-matching-related methods to [AttentionItemsResponse].
extension AttentionItemsResponsePatterns on AttentionItemsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttentionItemsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttentionItemsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttentionItemsResponse value)  $default,){
final _that = this;
switch (_that) {
case _AttentionItemsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttentionItemsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AttentionItemsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<AttentionItemView> data,  ApiResponseMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttentionItemsResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<AttentionItemView> data,  ApiResponseMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _AttentionItemsResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  List<AttentionItemView> data,  ApiResponseMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _AttentionItemsResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttentionItemsResponse implements AttentionItemsResponse {
  const _AttentionItemsResponse({this.success, this.message, final  List<AttentionItemView> data = const <AttentionItemView>[], this.meta}): _data = data;
  factory _AttentionItemsResponse.fromJson(Map<String, dynamic> json) => _$AttentionItemsResponseFromJson(json);

@override final  bool? success;
@override final  String? message;
 final  List<AttentionItemView> _data;
@override@JsonKey() List<AttentionItemView> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  ApiResponseMeta? meta;

/// Create a copy of AttentionItemsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttentionItemsResponseCopyWith<_AttentionItemsResponse> get copyWith => __$AttentionItemsResponseCopyWithImpl<_AttentionItemsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttentionItemsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttentionItemsResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data),meta);

@override
String toString() {
  return 'AttentionItemsResponse(success: $success, message: $message, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$AttentionItemsResponseCopyWith<$Res> implements $AttentionItemsResponseCopyWith<$Res> {
  factory _$AttentionItemsResponseCopyWith(_AttentionItemsResponse value, $Res Function(_AttentionItemsResponse) _then) = __$AttentionItemsResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, List<AttentionItemView> data, ApiResponseMeta? meta
});


@override $ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$AttentionItemsResponseCopyWithImpl<$Res>
    implements _$AttentionItemsResponseCopyWith<$Res> {
  __$AttentionItemsResponseCopyWithImpl(this._self, this._then);

  final _AttentionItemsResponse _self;
  final $Res Function(_AttentionItemsResponse) _then;

/// Create a copy of AttentionItemsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? meta = freezed,}) {
  return _then(_AttentionItemsResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<AttentionItemView>,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}

/// Create a copy of AttentionItemsResponse
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
