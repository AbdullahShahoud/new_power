// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_history_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectHistoryResponse {

 bool? get success; String? get message; List<ProjectHistoryEntryView> get data; PaginationMeta get pagination; ApiResponseMeta? get meta;
/// Create a copy of ProjectHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectHistoryResponseCopyWith<ProjectHistoryResponse> get copyWith => _$ProjectHistoryResponseCopyWithImpl<ProjectHistoryResponse>(this as ProjectHistoryResponse, _$identity);

  /// Serializes this ProjectHistoryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectHistoryResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data),pagination,meta);

@override
String toString() {
  return 'ProjectHistoryResponse(success: $success, message: $message, data: $data, pagination: $pagination, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $ProjectHistoryResponseCopyWith<$Res>  {
  factory $ProjectHistoryResponseCopyWith(ProjectHistoryResponse value, $Res Function(ProjectHistoryResponse) _then) = _$ProjectHistoryResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, List<ProjectHistoryEntryView> data, PaginationMeta pagination, ApiResponseMeta? meta
});


$PaginationMetaCopyWith<$Res> get pagination;$ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$ProjectHistoryResponseCopyWithImpl<$Res>
    implements $ProjectHistoryResponseCopyWith<$Res> {
  _$ProjectHistoryResponseCopyWithImpl(this._self, this._then);

  final ProjectHistoryResponse _self;
  final $Res Function(ProjectHistoryResponse) _then;

/// Create a copy of ProjectHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? pagination = null,Object? meta = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<ProjectHistoryEntryView>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationMeta,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}
/// Create a copy of ProjectHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res> get pagination {
  
  return $PaginationMetaCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}/// Create a copy of ProjectHistoryResponse
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


/// Adds pattern-matching-related methods to [ProjectHistoryResponse].
extension ProjectHistoryResponsePatterns on ProjectHistoryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectHistoryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectHistoryResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectHistoryResponse value)  $default,){
final _that = this;
switch (_that) {
case _ProjectHistoryResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectHistoryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectHistoryResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<ProjectHistoryEntryView> data,  PaginationMeta pagination,  ApiResponseMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectHistoryResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<ProjectHistoryEntryView> data,  PaginationMeta pagination,  ApiResponseMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _ProjectHistoryResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  List<ProjectHistoryEntryView> data,  PaginationMeta pagination,  ApiResponseMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _ProjectHistoryResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.pagination,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectHistoryResponse implements ProjectHistoryResponse {
  const _ProjectHistoryResponse({this.success, this.message, final  List<ProjectHistoryEntryView> data = const <ProjectHistoryEntryView>[], required this.pagination, this.meta}): _data = data;
  factory _ProjectHistoryResponse.fromJson(Map<String, dynamic> json) => _$ProjectHistoryResponseFromJson(json);

@override final  bool? success;
@override final  String? message;
 final  List<ProjectHistoryEntryView> _data;
@override@JsonKey() List<ProjectHistoryEntryView> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  PaginationMeta pagination;
@override final  ApiResponseMeta? meta;

/// Create a copy of ProjectHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectHistoryResponseCopyWith<_ProjectHistoryResponse> get copyWith => __$ProjectHistoryResponseCopyWithImpl<_ProjectHistoryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectHistoryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectHistoryResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data),pagination,meta);

@override
String toString() {
  return 'ProjectHistoryResponse(success: $success, message: $message, data: $data, pagination: $pagination, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$ProjectHistoryResponseCopyWith<$Res> implements $ProjectHistoryResponseCopyWith<$Res> {
  factory _$ProjectHistoryResponseCopyWith(_ProjectHistoryResponse value, $Res Function(_ProjectHistoryResponse) _then) = __$ProjectHistoryResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, List<ProjectHistoryEntryView> data, PaginationMeta pagination, ApiResponseMeta? meta
});


@override $PaginationMetaCopyWith<$Res> get pagination;@override $ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$ProjectHistoryResponseCopyWithImpl<$Res>
    implements _$ProjectHistoryResponseCopyWith<$Res> {
  __$ProjectHistoryResponseCopyWithImpl(this._self, this._then);

  final _ProjectHistoryResponse _self;
  final $Res Function(_ProjectHistoryResponse) _then;

/// Create a copy of ProjectHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? pagination = null,Object? meta = freezed,}) {
  return _then(_ProjectHistoryResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<ProjectHistoryEntryView>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationMeta,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}

/// Create a copy of ProjectHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res> get pagination {
  
  return $PaginationMetaCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}/// Create a copy of ProjectHistoryResponse
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
