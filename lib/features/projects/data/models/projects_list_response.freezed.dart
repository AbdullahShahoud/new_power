// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'projects_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectsListResponse {

 bool? get success; String? get message; List<ProjectSummaryView> get data; PaginationMeta get pagination; ApiResponseMeta? get meta;
/// Create a copy of ProjectsListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectsListResponseCopyWith<ProjectsListResponse> get copyWith => _$ProjectsListResponseCopyWithImpl<ProjectsListResponse>(this as ProjectsListResponse, _$identity);

  /// Serializes this ProjectsListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectsListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data),pagination,meta);

@override
String toString() {
  return 'ProjectsListResponse(success: $success, message: $message, data: $data, pagination: $pagination, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $ProjectsListResponseCopyWith<$Res>  {
  factory $ProjectsListResponseCopyWith(ProjectsListResponse value, $Res Function(ProjectsListResponse) _then) = _$ProjectsListResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, List<ProjectSummaryView> data, PaginationMeta pagination, ApiResponseMeta? meta
});


$PaginationMetaCopyWith<$Res> get pagination;$ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$ProjectsListResponseCopyWithImpl<$Res>
    implements $ProjectsListResponseCopyWith<$Res> {
  _$ProjectsListResponseCopyWithImpl(this._self, this._then);

  final ProjectsListResponse _self;
  final $Res Function(ProjectsListResponse) _then;

/// Create a copy of ProjectsListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? pagination = null,Object? meta = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<ProjectSummaryView>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationMeta,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}
/// Create a copy of ProjectsListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res> get pagination {
  
  return $PaginationMetaCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}/// Create a copy of ProjectsListResponse
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


/// Adds pattern-matching-related methods to [ProjectsListResponse].
extension ProjectsListResponsePatterns on ProjectsListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectsListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectsListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectsListResponse value)  $default,){
final _that = this;
switch (_that) {
case _ProjectsListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectsListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectsListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<ProjectSummaryView> data,  PaginationMeta pagination,  ApiResponseMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectsListResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<ProjectSummaryView> data,  PaginationMeta pagination,  ApiResponseMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _ProjectsListResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  List<ProjectSummaryView> data,  PaginationMeta pagination,  ApiResponseMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _ProjectsListResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.pagination,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectsListResponse implements ProjectsListResponse {
  const _ProjectsListResponse({this.success, this.message, final  List<ProjectSummaryView> data = const <ProjectSummaryView>[], required this.pagination, this.meta}): _data = data;
  factory _ProjectsListResponse.fromJson(Map<String, dynamic> json) => _$ProjectsListResponseFromJson(json);

@override final  bool? success;
@override final  String? message;
 final  List<ProjectSummaryView> _data;
@override@JsonKey() List<ProjectSummaryView> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  PaginationMeta pagination;
@override final  ApiResponseMeta? meta;

/// Create a copy of ProjectsListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectsListResponseCopyWith<_ProjectsListResponse> get copyWith => __$ProjectsListResponseCopyWithImpl<_ProjectsListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectsListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectsListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data),pagination,meta);

@override
String toString() {
  return 'ProjectsListResponse(success: $success, message: $message, data: $data, pagination: $pagination, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$ProjectsListResponseCopyWith<$Res> implements $ProjectsListResponseCopyWith<$Res> {
  factory _$ProjectsListResponseCopyWith(_ProjectsListResponse value, $Res Function(_ProjectsListResponse) _then) = __$ProjectsListResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, List<ProjectSummaryView> data, PaginationMeta pagination, ApiResponseMeta? meta
});


@override $PaginationMetaCopyWith<$Res> get pagination;@override $ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$ProjectsListResponseCopyWithImpl<$Res>
    implements _$ProjectsListResponseCopyWith<$Res> {
  __$ProjectsListResponseCopyWithImpl(this._self, this._then);

  final _ProjectsListResponse _self;
  final $Res Function(_ProjectsListResponse) _then;

/// Create a copy of ProjectsListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? pagination = null,Object? meta = freezed,}) {
  return _then(_ProjectsListResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<ProjectSummaryView>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationMeta,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}

/// Create a copy of ProjectsListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res> get pagination {
  
  return $PaginationMetaCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}/// Create a copy of ProjectsListResponse
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
mixin _$NearbyProjectsResponse {

 bool? get success; String? get message; List<NearbyProjectCardView> get data; PaginationMeta get pagination; ApiResponseMeta? get meta;
/// Create a copy of NearbyProjectsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NearbyProjectsResponseCopyWith<NearbyProjectsResponse> get copyWith => _$NearbyProjectsResponseCopyWithImpl<NearbyProjectsResponse>(this as NearbyProjectsResponse, _$identity);

  /// Serializes this NearbyProjectsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyProjectsResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data),pagination,meta);

@override
String toString() {
  return 'NearbyProjectsResponse(success: $success, message: $message, data: $data, pagination: $pagination, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $NearbyProjectsResponseCopyWith<$Res>  {
  factory $NearbyProjectsResponseCopyWith(NearbyProjectsResponse value, $Res Function(NearbyProjectsResponse) _then) = _$NearbyProjectsResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, List<NearbyProjectCardView> data, PaginationMeta pagination, ApiResponseMeta? meta
});


$PaginationMetaCopyWith<$Res> get pagination;$ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$NearbyProjectsResponseCopyWithImpl<$Res>
    implements $NearbyProjectsResponseCopyWith<$Res> {
  _$NearbyProjectsResponseCopyWithImpl(this._self, this._then);

  final NearbyProjectsResponse _self;
  final $Res Function(NearbyProjectsResponse) _then;

/// Create a copy of NearbyProjectsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? pagination = null,Object? meta = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<NearbyProjectCardView>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationMeta,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}
/// Create a copy of NearbyProjectsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res> get pagination {
  
  return $PaginationMetaCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}/// Create a copy of NearbyProjectsResponse
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


/// Adds pattern-matching-related methods to [NearbyProjectsResponse].
extension NearbyProjectsResponsePatterns on NearbyProjectsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NearbyProjectsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NearbyProjectsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NearbyProjectsResponse value)  $default,){
final _that = this;
switch (_that) {
case _NearbyProjectsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NearbyProjectsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _NearbyProjectsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<NearbyProjectCardView> data,  PaginationMeta pagination,  ApiResponseMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NearbyProjectsResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<NearbyProjectCardView> data,  PaginationMeta pagination,  ApiResponseMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _NearbyProjectsResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  List<NearbyProjectCardView> data,  PaginationMeta pagination,  ApiResponseMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _NearbyProjectsResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.pagination,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NearbyProjectsResponse implements NearbyProjectsResponse {
  const _NearbyProjectsResponse({this.success, this.message, final  List<NearbyProjectCardView> data = const <NearbyProjectCardView>[], required this.pagination, this.meta}): _data = data;
  factory _NearbyProjectsResponse.fromJson(Map<String, dynamic> json) => _$NearbyProjectsResponseFromJson(json);

@override final  bool? success;
@override final  String? message;
 final  List<NearbyProjectCardView> _data;
@override@JsonKey() List<NearbyProjectCardView> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  PaginationMeta pagination;
@override final  ApiResponseMeta? meta;

/// Create a copy of NearbyProjectsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NearbyProjectsResponseCopyWith<_NearbyProjectsResponse> get copyWith => __$NearbyProjectsResponseCopyWithImpl<_NearbyProjectsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NearbyProjectsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NearbyProjectsResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data),pagination,meta);

@override
String toString() {
  return 'NearbyProjectsResponse(success: $success, message: $message, data: $data, pagination: $pagination, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$NearbyProjectsResponseCopyWith<$Res> implements $NearbyProjectsResponseCopyWith<$Res> {
  factory _$NearbyProjectsResponseCopyWith(_NearbyProjectsResponse value, $Res Function(_NearbyProjectsResponse) _then) = __$NearbyProjectsResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, List<NearbyProjectCardView> data, PaginationMeta pagination, ApiResponseMeta? meta
});


@override $PaginationMetaCopyWith<$Res> get pagination;@override $ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$NearbyProjectsResponseCopyWithImpl<$Res>
    implements _$NearbyProjectsResponseCopyWith<$Res> {
  __$NearbyProjectsResponseCopyWithImpl(this._self, this._then);

  final _NearbyProjectsResponse _self;
  final $Res Function(_NearbyProjectsResponse) _then;

/// Create a copy of NearbyProjectsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? pagination = null,Object? meta = freezed,}) {
  return _then(_NearbyProjectsResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<NearbyProjectCardView>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationMeta,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}

/// Create a copy of NearbyProjectsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res> get pagination {
  
  return $PaginationMetaCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}/// Create a copy of NearbyProjectsResponse
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
