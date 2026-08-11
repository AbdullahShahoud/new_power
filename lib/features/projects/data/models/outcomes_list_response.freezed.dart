// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outcomes_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OutcomesListResponse {

 bool? get success; String? get message; List<OutcomeView> get data; PaginationMeta get pagination; ApiResponseMeta? get meta;
/// Create a copy of OutcomesListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutcomesListResponseCopyWith<OutcomesListResponse> get copyWith => _$OutcomesListResponseCopyWithImpl<OutcomesListResponse>(this as OutcomesListResponse, _$identity);

  /// Serializes this OutcomesListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutcomesListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data),pagination,meta);

@override
String toString() {
  return 'OutcomesListResponse(success: $success, message: $message, data: $data, pagination: $pagination, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $OutcomesListResponseCopyWith<$Res>  {
  factory $OutcomesListResponseCopyWith(OutcomesListResponse value, $Res Function(OutcomesListResponse) _then) = _$OutcomesListResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, List<OutcomeView> data, PaginationMeta pagination, ApiResponseMeta? meta
});


$PaginationMetaCopyWith<$Res> get pagination;$ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$OutcomesListResponseCopyWithImpl<$Res>
    implements $OutcomesListResponseCopyWith<$Res> {
  _$OutcomesListResponseCopyWithImpl(this._self, this._then);

  final OutcomesListResponse _self;
  final $Res Function(OutcomesListResponse) _then;

/// Create a copy of OutcomesListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? pagination = null,Object? meta = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<OutcomeView>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationMeta,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}
/// Create a copy of OutcomesListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res> get pagination {
  
  return $PaginationMetaCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}/// Create a copy of OutcomesListResponse
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


/// Adds pattern-matching-related methods to [OutcomesListResponse].
extension OutcomesListResponsePatterns on OutcomesListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OutcomesListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OutcomesListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OutcomesListResponse value)  $default,){
final _that = this;
switch (_that) {
case _OutcomesListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OutcomesListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _OutcomesListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<OutcomeView> data,  PaginationMeta pagination,  ApiResponseMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OutcomesListResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<OutcomeView> data,  PaginationMeta pagination,  ApiResponseMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _OutcomesListResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  List<OutcomeView> data,  PaginationMeta pagination,  ApiResponseMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _OutcomesListResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.pagination,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OutcomesListResponse implements OutcomesListResponse {
  const _OutcomesListResponse({this.success, this.message, final  List<OutcomeView> data = const <OutcomeView>[], required this.pagination, this.meta}): _data = data;
  factory _OutcomesListResponse.fromJson(Map<String, dynamic> json) => _$OutcomesListResponseFromJson(json);

@override final  bool? success;
@override final  String? message;
 final  List<OutcomeView> _data;
@override@JsonKey() List<OutcomeView> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  PaginationMeta pagination;
@override final  ApiResponseMeta? meta;

/// Create a copy of OutcomesListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OutcomesListResponseCopyWith<_OutcomesListResponse> get copyWith => __$OutcomesListResponseCopyWithImpl<_OutcomesListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OutcomesListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OutcomesListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data),pagination,meta);

@override
String toString() {
  return 'OutcomesListResponse(success: $success, message: $message, data: $data, pagination: $pagination, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$OutcomesListResponseCopyWith<$Res> implements $OutcomesListResponseCopyWith<$Res> {
  factory _$OutcomesListResponseCopyWith(_OutcomesListResponse value, $Res Function(_OutcomesListResponse) _then) = __$OutcomesListResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, List<OutcomeView> data, PaginationMeta pagination, ApiResponseMeta? meta
});


@override $PaginationMetaCopyWith<$Res> get pagination;@override $ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$OutcomesListResponseCopyWithImpl<$Res>
    implements _$OutcomesListResponseCopyWith<$Res> {
  __$OutcomesListResponseCopyWithImpl(this._self, this._then);

  final _OutcomesListResponse _self;
  final $Res Function(_OutcomesListResponse) _then;

/// Create a copy of OutcomesListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? pagination = null,Object? meta = freezed,}) {
  return _then(_OutcomesListResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<OutcomeView>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationMeta,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}

/// Create a copy of OutcomesListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res> get pagination {
  
  return $PaginationMetaCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}/// Create a copy of OutcomesListResponse
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
