// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_responses.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationsListResponse {

 bool? get success; String? get message; List<NotificationView> get data; PaginationMeta? get pagination; ApiResponseMeta? get meta;
/// Create a copy of NotificationsListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationsListResponseCopyWith<NotificationsListResponse> get copyWith => _$NotificationsListResponseCopyWithImpl<NotificationsListResponse>(this as NotificationsListResponse, _$identity);

  /// Serializes this NotificationsListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data),pagination,meta);

@override
String toString() {
  return 'NotificationsListResponse(success: $success, message: $message, data: $data, pagination: $pagination, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $NotificationsListResponseCopyWith<$Res>  {
  factory $NotificationsListResponseCopyWith(NotificationsListResponse value, $Res Function(NotificationsListResponse) _then) = _$NotificationsListResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, List<NotificationView> data, PaginationMeta? pagination, ApiResponseMeta? meta
});


$PaginationMetaCopyWith<$Res>? get pagination;$ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$NotificationsListResponseCopyWithImpl<$Res>
    implements $NotificationsListResponseCopyWith<$Res> {
  _$NotificationsListResponseCopyWithImpl(this._self, this._then);

  final NotificationsListResponse _self;
  final $Res Function(NotificationsListResponse) _then;

/// Create a copy of NotificationsListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? pagination = freezed,Object? meta = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<NotificationView>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationMeta?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}
/// Create a copy of NotificationsListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res>? get pagination {
    if (_self.pagination == null) {
    return null;
  }

  return $PaginationMetaCopyWith<$Res>(_self.pagination!, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}/// Create a copy of NotificationsListResponse
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


/// Adds pattern-matching-related methods to [NotificationsListResponse].
extension NotificationsListResponsePatterns on NotificationsListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationsListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationsListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationsListResponse value)  $default,){
final _that = this;
switch (_that) {
case _NotificationsListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationsListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationsListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<NotificationView> data,  PaginationMeta? pagination,  ApiResponseMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationsListResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  List<NotificationView> data,  PaginationMeta? pagination,  ApiResponseMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _NotificationsListResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  List<NotificationView> data,  PaginationMeta? pagination,  ApiResponseMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _NotificationsListResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.pagination,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationsListResponse implements NotificationsListResponse {
  const _NotificationsListResponse({this.success, this.message, final  List<NotificationView> data = const <NotificationView>[], this.pagination, this.meta}): _data = data;
  factory _NotificationsListResponse.fromJson(Map<String, dynamic> json) => _$NotificationsListResponseFromJson(json);

@override final  bool? success;
@override final  String? message;
 final  List<NotificationView> _data;
@override@JsonKey() List<NotificationView> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  PaginationMeta? pagination;
@override final  ApiResponseMeta? meta;

/// Create a copy of NotificationsListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationsListResponseCopyWith<_NotificationsListResponse> get copyWith => __$NotificationsListResponseCopyWithImpl<_NotificationsListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationsListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationsListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data),pagination,meta);

@override
String toString() {
  return 'NotificationsListResponse(success: $success, message: $message, data: $data, pagination: $pagination, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$NotificationsListResponseCopyWith<$Res> implements $NotificationsListResponseCopyWith<$Res> {
  factory _$NotificationsListResponseCopyWith(_NotificationsListResponse value, $Res Function(_NotificationsListResponse) _then) = __$NotificationsListResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, List<NotificationView> data, PaginationMeta? pagination, ApiResponseMeta? meta
});


@override $PaginationMetaCopyWith<$Res>? get pagination;@override $ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$NotificationsListResponseCopyWithImpl<$Res>
    implements _$NotificationsListResponseCopyWith<$Res> {
  __$NotificationsListResponseCopyWithImpl(this._self, this._then);

  final _NotificationsListResponse _self;
  final $Res Function(_NotificationsListResponse) _then;

/// Create a copy of NotificationsListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? pagination = freezed,Object? meta = freezed,}) {
  return _then(_NotificationsListResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<NotificationView>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationMeta?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}

/// Create a copy of NotificationsListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res>? get pagination {
    if (_self.pagination == null) {
    return null;
  }

  return $PaginationMetaCopyWith<$Res>(_self.pagination!, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}/// Create a copy of NotificationsListResponse
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
mixin _$NotificationCountData {

 int get count;
/// Create a copy of NotificationCountData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationCountDataCopyWith<NotificationCountData> get copyWith => _$NotificationCountDataCopyWithImpl<NotificationCountData>(this as NotificationCountData, _$identity);

  /// Serializes this NotificationCountData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationCountData&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count);

@override
String toString() {
  return 'NotificationCountData(count: $count)';
}


}

/// @nodoc
abstract mixin class $NotificationCountDataCopyWith<$Res>  {
  factory $NotificationCountDataCopyWith(NotificationCountData value, $Res Function(NotificationCountData) _then) = _$NotificationCountDataCopyWithImpl;
@useResult
$Res call({
 int count
});




}
/// @nodoc
class _$NotificationCountDataCopyWithImpl<$Res>
    implements $NotificationCountDataCopyWith<$Res> {
  _$NotificationCountDataCopyWithImpl(this._self, this._then);

  final NotificationCountData _self;
  final $Res Function(NotificationCountData) _then;

/// Create a copy of NotificationCountData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationCountData].
extension NotificationCountDataPatterns on NotificationCountData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationCountData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationCountData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationCountData value)  $default,){
final _that = this;
switch (_that) {
case _NotificationCountData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationCountData value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationCountData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationCountData() when $default != null:
return $default(_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count)  $default,) {final _that = this;
switch (_that) {
case _NotificationCountData():
return $default(_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count)?  $default,) {final _that = this;
switch (_that) {
case _NotificationCountData() when $default != null:
return $default(_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationCountData implements NotificationCountData {
  const _NotificationCountData({this.count = 0});
  factory _NotificationCountData.fromJson(Map<String, dynamic> json) => _$NotificationCountDataFromJson(json);

@override@JsonKey() final  int count;

/// Create a copy of NotificationCountData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationCountDataCopyWith<_NotificationCountData> get copyWith => __$NotificationCountDataCopyWithImpl<_NotificationCountData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationCountDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationCountData&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count);

@override
String toString() {
  return 'NotificationCountData(count: $count)';
}


}

/// @nodoc
abstract mixin class _$NotificationCountDataCopyWith<$Res> implements $NotificationCountDataCopyWith<$Res> {
  factory _$NotificationCountDataCopyWith(_NotificationCountData value, $Res Function(_NotificationCountData) _then) = __$NotificationCountDataCopyWithImpl;
@override @useResult
$Res call({
 int count
});




}
/// @nodoc
class __$NotificationCountDataCopyWithImpl<$Res>
    implements _$NotificationCountDataCopyWith<$Res> {
  __$NotificationCountDataCopyWithImpl(this._self, this._then);

  final _NotificationCountData _self;
  final $Res Function(_NotificationCountData) _then;

/// Create a copy of NotificationCountData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,}) {
  return _then(_NotificationCountData(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$NotificationCountResponse {

 bool? get success; String? get message; NotificationCountData get data; ApiResponseMeta? get meta;
/// Create a copy of NotificationCountResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationCountResponseCopyWith<NotificationCountResponse> get copyWith => _$NotificationCountResponseCopyWithImpl<NotificationCountResponse>(this as NotificationCountResponse, _$identity);

  /// Serializes this NotificationCountResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationCountResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data,meta);

@override
String toString() {
  return 'NotificationCountResponse(success: $success, message: $message, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $NotificationCountResponseCopyWith<$Res>  {
  factory $NotificationCountResponseCopyWith(NotificationCountResponse value, $Res Function(NotificationCountResponse) _then) = _$NotificationCountResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, NotificationCountData data, ApiResponseMeta? meta
});


$NotificationCountDataCopyWith<$Res> get data;$ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$NotificationCountResponseCopyWithImpl<$Res>
    implements $NotificationCountResponseCopyWith<$Res> {
  _$NotificationCountResponseCopyWithImpl(this._self, this._then);

  final NotificationCountResponse _self;
  final $Res Function(NotificationCountResponse) _then;

/// Create a copy of NotificationCountResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? meta = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as NotificationCountData,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}
/// Create a copy of NotificationCountResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationCountDataCopyWith<$Res> get data {
  
  return $NotificationCountDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of NotificationCountResponse
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


/// Adds pattern-matching-related methods to [NotificationCountResponse].
extension NotificationCountResponsePatterns on NotificationCountResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationCountResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationCountResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationCountResponse value)  $default,){
final _that = this;
switch (_that) {
case _NotificationCountResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationCountResponse value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationCountResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  NotificationCountData data,  ApiResponseMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationCountResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  NotificationCountData data,  ApiResponseMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _NotificationCountResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  NotificationCountData data,  ApiResponseMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _NotificationCountResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationCountResponse implements NotificationCountResponse {
  const _NotificationCountResponse({this.success, this.message, required this.data, this.meta});
  factory _NotificationCountResponse.fromJson(Map<String, dynamic> json) => _$NotificationCountResponseFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  NotificationCountData data;
@override final  ApiResponseMeta? meta;

/// Create a copy of NotificationCountResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationCountResponseCopyWith<_NotificationCountResponse> get copyWith => __$NotificationCountResponseCopyWithImpl<_NotificationCountResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationCountResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationCountResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data,meta);

@override
String toString() {
  return 'NotificationCountResponse(success: $success, message: $message, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$NotificationCountResponseCopyWith<$Res> implements $NotificationCountResponseCopyWith<$Res> {
  factory _$NotificationCountResponseCopyWith(_NotificationCountResponse value, $Res Function(_NotificationCountResponse) _then) = __$NotificationCountResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, NotificationCountData data, ApiResponseMeta? meta
});


@override $NotificationCountDataCopyWith<$Res> get data;@override $ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$NotificationCountResponseCopyWithImpl<$Res>
    implements _$NotificationCountResponseCopyWith<$Res> {
  __$NotificationCountResponseCopyWithImpl(this._self, this._then);

  final _NotificationCountResponse _self;
  final $Res Function(_NotificationCountResponse) _then;

/// Create a copy of NotificationCountResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? meta = freezed,}) {
  return _then(_NotificationCountResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as NotificationCountData,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}

/// Create a copy of NotificationCountResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationCountDataCopyWith<$Res> get data {
  
  return $NotificationCountDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of NotificationCountResponse
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
mixin _$NotificationDetailResponse {

 bool? get success; String? get message; NotificationView? get data; ApiResponseMeta? get meta;
/// Create a copy of NotificationDetailResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationDetailResponseCopyWith<NotificationDetailResponse> get copyWith => _$NotificationDetailResponseCopyWithImpl<NotificationDetailResponse>(this as NotificationDetailResponse, _$identity);

  /// Serializes this NotificationDetailResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationDetailResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data,meta);

@override
String toString() {
  return 'NotificationDetailResponse(success: $success, message: $message, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $NotificationDetailResponseCopyWith<$Res>  {
  factory $NotificationDetailResponseCopyWith(NotificationDetailResponse value, $Res Function(NotificationDetailResponse) _then) = _$NotificationDetailResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, NotificationView? data, ApiResponseMeta? meta
});


$NotificationViewCopyWith<$Res>? get data;$ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$NotificationDetailResponseCopyWithImpl<$Res>
    implements $NotificationDetailResponseCopyWith<$Res> {
  _$NotificationDetailResponseCopyWithImpl(this._self, this._then);

  final NotificationDetailResponse _self;
  final $Res Function(NotificationDetailResponse) _then;

/// Create a copy of NotificationDetailResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,Object? meta = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as NotificationView?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}
/// Create a copy of NotificationDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationViewCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $NotificationViewCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of NotificationDetailResponse
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


/// Adds pattern-matching-related methods to [NotificationDetailResponse].
extension NotificationDetailResponsePatterns on NotificationDetailResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationDetailResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationDetailResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationDetailResponse value)  $default,){
final _that = this;
switch (_that) {
case _NotificationDetailResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationDetailResponse value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationDetailResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  NotificationView? data,  ApiResponseMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationDetailResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  NotificationView? data,  ApiResponseMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _NotificationDetailResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  NotificationView? data,  ApiResponseMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _NotificationDetailResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationDetailResponse implements NotificationDetailResponse {
  const _NotificationDetailResponse({this.success, this.message, this.data, this.meta});
  factory _NotificationDetailResponse.fromJson(Map<String, dynamic> json) => _$NotificationDetailResponseFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  NotificationView? data;
@override final  ApiResponseMeta? meta;

/// Create a copy of NotificationDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationDetailResponseCopyWith<_NotificationDetailResponse> get copyWith => __$NotificationDetailResponseCopyWithImpl<_NotificationDetailResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationDetailResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationDetailResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data,meta);

@override
String toString() {
  return 'NotificationDetailResponse(success: $success, message: $message, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$NotificationDetailResponseCopyWith<$Res> implements $NotificationDetailResponseCopyWith<$Res> {
  factory _$NotificationDetailResponseCopyWith(_NotificationDetailResponse value, $Res Function(_NotificationDetailResponse) _then) = __$NotificationDetailResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, NotificationView? data, ApiResponseMeta? meta
});


@override $NotificationViewCopyWith<$Res>? get data;@override $ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$NotificationDetailResponseCopyWithImpl<$Res>
    implements _$NotificationDetailResponseCopyWith<$Res> {
  __$NotificationDetailResponseCopyWithImpl(this._self, this._then);

  final _NotificationDetailResponse _self;
  final $Res Function(_NotificationDetailResponse) _then;

/// Create a copy of NotificationDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,Object? meta = freezed,}) {
  return _then(_NotificationDetailResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as NotificationView?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}

/// Create a copy of NotificationDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationViewCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $NotificationViewCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of NotificationDetailResponse
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
mixin _$NotificationActionResponse {

 bool? get success; String? get message; ApiResponseMeta? get meta;
/// Create a copy of NotificationActionResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationActionResponseCopyWith<NotificationActionResponse> get copyWith => _$NotificationActionResponseCopyWithImpl<NotificationActionResponse>(this as NotificationActionResponse, _$identity);

  /// Serializes this NotificationActionResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationActionResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,meta);

@override
String toString() {
  return 'NotificationActionResponse(success: $success, message: $message, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $NotificationActionResponseCopyWith<$Res>  {
  factory $NotificationActionResponseCopyWith(NotificationActionResponse value, $Res Function(NotificationActionResponse) _then) = _$NotificationActionResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, ApiResponseMeta? meta
});


$ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$NotificationActionResponseCopyWithImpl<$Res>
    implements $NotificationActionResponseCopyWith<$Res> {
  _$NotificationActionResponseCopyWithImpl(this._self, this._then);

  final NotificationActionResponse _self;
  final $Res Function(NotificationActionResponse) _then;

/// Create a copy of NotificationActionResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? meta = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}
/// Create a copy of NotificationActionResponse
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


/// Adds pattern-matching-related methods to [NotificationActionResponse].
extension NotificationActionResponsePatterns on NotificationActionResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationActionResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationActionResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationActionResponse value)  $default,){
final _that = this;
switch (_that) {
case _NotificationActionResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationActionResponse value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationActionResponse() when $default != null:
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
case _NotificationActionResponse() when $default != null:
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
case _NotificationActionResponse():
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
case _NotificationActionResponse() when $default != null:
return $default(_that.success,_that.message,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationActionResponse implements NotificationActionResponse {
  const _NotificationActionResponse({this.success, this.message, this.meta});
  factory _NotificationActionResponse.fromJson(Map<String, dynamic> json) => _$NotificationActionResponseFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  ApiResponseMeta? meta;

/// Create a copy of NotificationActionResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationActionResponseCopyWith<_NotificationActionResponse> get copyWith => __$NotificationActionResponseCopyWithImpl<_NotificationActionResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationActionResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationActionResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,meta);

@override
String toString() {
  return 'NotificationActionResponse(success: $success, message: $message, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$NotificationActionResponseCopyWith<$Res> implements $NotificationActionResponseCopyWith<$Res> {
  factory _$NotificationActionResponseCopyWith(_NotificationActionResponse value, $Res Function(_NotificationActionResponse) _then) = __$NotificationActionResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, ApiResponseMeta? meta
});


@override $ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$NotificationActionResponseCopyWithImpl<$Res>
    implements _$NotificationActionResponseCopyWith<$Res> {
  __$NotificationActionResponseCopyWithImpl(this._self, this._then);

  final _NotificationActionResponse _self;
  final $Res Function(_NotificationActionResponse) _then;

/// Create a copy of NotificationActionResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? meta = freezed,}) {
  return _then(_NotificationActionResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}

/// Create a copy of NotificationActionResponse
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
mixin _$NotificationPreferencesResponse {

 bool? get success; String? get message; NotificationPreferencesView get data; ApiResponseMeta? get meta;
/// Create a copy of NotificationPreferencesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationPreferencesResponseCopyWith<NotificationPreferencesResponse> get copyWith => _$NotificationPreferencesResponseCopyWithImpl<NotificationPreferencesResponse>(this as NotificationPreferencesResponse, _$identity);

  /// Serializes this NotificationPreferencesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationPreferencesResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data,meta);

@override
String toString() {
  return 'NotificationPreferencesResponse(success: $success, message: $message, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $NotificationPreferencesResponseCopyWith<$Res>  {
  factory $NotificationPreferencesResponseCopyWith(NotificationPreferencesResponse value, $Res Function(NotificationPreferencesResponse) _then) = _$NotificationPreferencesResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, NotificationPreferencesView data, ApiResponseMeta? meta
});


$NotificationPreferencesViewCopyWith<$Res> get data;$ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$NotificationPreferencesResponseCopyWithImpl<$Res>
    implements $NotificationPreferencesResponseCopyWith<$Res> {
  _$NotificationPreferencesResponseCopyWithImpl(this._self, this._then);

  final NotificationPreferencesResponse _self;
  final $Res Function(NotificationPreferencesResponse) _then;

/// Create a copy of NotificationPreferencesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? meta = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as NotificationPreferencesView,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}
/// Create a copy of NotificationPreferencesResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationPreferencesViewCopyWith<$Res> get data {
  
  return $NotificationPreferencesViewCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of NotificationPreferencesResponse
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


/// Adds pattern-matching-related methods to [NotificationPreferencesResponse].
extension NotificationPreferencesResponsePatterns on NotificationPreferencesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationPreferencesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationPreferencesResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationPreferencesResponse value)  $default,){
final _that = this;
switch (_that) {
case _NotificationPreferencesResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationPreferencesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationPreferencesResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  NotificationPreferencesView data,  ApiResponseMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationPreferencesResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  NotificationPreferencesView data,  ApiResponseMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _NotificationPreferencesResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  NotificationPreferencesView data,  ApiResponseMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _NotificationPreferencesResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationPreferencesResponse implements NotificationPreferencesResponse {
  const _NotificationPreferencesResponse({this.success, this.message, required this.data, this.meta});
  factory _NotificationPreferencesResponse.fromJson(Map<String, dynamic> json) => _$NotificationPreferencesResponseFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  NotificationPreferencesView data;
@override final  ApiResponseMeta? meta;

/// Create a copy of NotificationPreferencesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationPreferencesResponseCopyWith<_NotificationPreferencesResponse> get copyWith => __$NotificationPreferencesResponseCopyWithImpl<_NotificationPreferencesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationPreferencesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationPreferencesResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data,meta);

@override
String toString() {
  return 'NotificationPreferencesResponse(success: $success, message: $message, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$NotificationPreferencesResponseCopyWith<$Res> implements $NotificationPreferencesResponseCopyWith<$Res> {
  factory _$NotificationPreferencesResponseCopyWith(_NotificationPreferencesResponse value, $Res Function(_NotificationPreferencesResponse) _then) = __$NotificationPreferencesResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, NotificationPreferencesView data, ApiResponseMeta? meta
});


@override $NotificationPreferencesViewCopyWith<$Res> get data;@override $ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$NotificationPreferencesResponseCopyWithImpl<$Res>
    implements _$NotificationPreferencesResponseCopyWith<$Res> {
  __$NotificationPreferencesResponseCopyWithImpl(this._self, this._then);

  final _NotificationPreferencesResponse _self;
  final $Res Function(_NotificationPreferencesResponse) _then;

/// Create a copy of NotificationPreferencesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? meta = freezed,}) {
  return _then(_NotificationPreferencesResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as NotificationPreferencesView,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}

/// Create a copy of NotificationPreferencesResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationPreferencesViewCopyWith<$Res> get data {
  
  return $NotificationPreferencesViewCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of NotificationPreferencesResponse
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
mixin _$FcmTokenResponse {

 bool? get success; String? get message; ApiResponseMeta? get meta;
/// Create a copy of FcmTokenResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FcmTokenResponseCopyWith<FcmTokenResponse> get copyWith => _$FcmTokenResponseCopyWithImpl<FcmTokenResponse>(this as FcmTokenResponse, _$identity);

  /// Serializes this FcmTokenResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FcmTokenResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,meta);

@override
String toString() {
  return 'FcmTokenResponse(success: $success, message: $message, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $FcmTokenResponseCopyWith<$Res>  {
  factory $FcmTokenResponseCopyWith(FcmTokenResponse value, $Res Function(FcmTokenResponse) _then) = _$FcmTokenResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, ApiResponseMeta? meta
});


$ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$FcmTokenResponseCopyWithImpl<$Res>
    implements $FcmTokenResponseCopyWith<$Res> {
  _$FcmTokenResponseCopyWithImpl(this._self, this._then);

  final FcmTokenResponse _self;
  final $Res Function(FcmTokenResponse) _then;

/// Create a copy of FcmTokenResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? meta = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}
/// Create a copy of FcmTokenResponse
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


/// Adds pattern-matching-related methods to [FcmTokenResponse].
extension FcmTokenResponsePatterns on FcmTokenResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FcmTokenResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FcmTokenResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FcmTokenResponse value)  $default,){
final _that = this;
switch (_that) {
case _FcmTokenResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FcmTokenResponse value)?  $default,){
final _that = this;
switch (_that) {
case _FcmTokenResponse() when $default != null:
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
case _FcmTokenResponse() when $default != null:
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
case _FcmTokenResponse():
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
case _FcmTokenResponse() when $default != null:
return $default(_that.success,_that.message,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FcmTokenResponse implements FcmTokenResponse {
  const _FcmTokenResponse({this.success, this.message, this.meta});
  factory _FcmTokenResponse.fromJson(Map<String, dynamic> json) => _$FcmTokenResponseFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  ApiResponseMeta? meta;

/// Create a copy of FcmTokenResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FcmTokenResponseCopyWith<_FcmTokenResponse> get copyWith => __$FcmTokenResponseCopyWithImpl<_FcmTokenResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FcmTokenResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FcmTokenResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,meta);

@override
String toString() {
  return 'FcmTokenResponse(success: $success, message: $message, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$FcmTokenResponseCopyWith<$Res> implements $FcmTokenResponseCopyWith<$Res> {
  factory _$FcmTokenResponseCopyWith(_FcmTokenResponse value, $Res Function(_FcmTokenResponse) _then) = __$FcmTokenResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, ApiResponseMeta? meta
});


@override $ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$FcmTokenResponseCopyWithImpl<$Res>
    implements _$FcmTokenResponseCopyWith<$Res> {
  __$FcmTokenResponseCopyWithImpl(this._self, this._then);

  final _FcmTokenResponse _self;
  final $Res Function(_FcmTokenResponse) _then;

/// Create a copy of FcmTokenResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? meta = freezed,}) {
  return _then(_FcmTokenResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}

/// Create a copy of FcmTokenResponse
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
mixin _$RegisterFcmTokenRequest {

 String get fcmToken;
/// Create a copy of RegisterFcmTokenRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterFcmTokenRequestCopyWith<RegisterFcmTokenRequest> get copyWith => _$RegisterFcmTokenRequestCopyWithImpl<RegisterFcmTokenRequest>(this as RegisterFcmTokenRequest, _$identity);

  /// Serializes this RegisterFcmTokenRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterFcmTokenRequest&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fcmToken);

@override
String toString() {
  return 'RegisterFcmTokenRequest(fcmToken: $fcmToken)';
}


}

/// @nodoc
abstract mixin class $RegisterFcmTokenRequestCopyWith<$Res>  {
  factory $RegisterFcmTokenRequestCopyWith(RegisterFcmTokenRequest value, $Res Function(RegisterFcmTokenRequest) _then) = _$RegisterFcmTokenRequestCopyWithImpl;
@useResult
$Res call({
 String fcmToken
});




}
/// @nodoc
class _$RegisterFcmTokenRequestCopyWithImpl<$Res>
    implements $RegisterFcmTokenRequestCopyWith<$Res> {
  _$RegisterFcmTokenRequestCopyWithImpl(this._self, this._then);

  final RegisterFcmTokenRequest _self;
  final $Res Function(RegisterFcmTokenRequest) _then;

/// Create a copy of RegisterFcmTokenRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fcmToken = null,}) {
  return _then(_self.copyWith(
fcmToken: null == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterFcmTokenRequest].
extension RegisterFcmTokenRequestPatterns on RegisterFcmTokenRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterFcmTokenRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterFcmTokenRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterFcmTokenRequest value)  $default,){
final _that = this;
switch (_that) {
case _RegisterFcmTokenRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterFcmTokenRequest value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterFcmTokenRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fcmToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterFcmTokenRequest() when $default != null:
return $default(_that.fcmToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fcmToken)  $default,) {final _that = this;
switch (_that) {
case _RegisterFcmTokenRequest():
return $default(_that.fcmToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fcmToken)?  $default,) {final _that = this;
switch (_that) {
case _RegisterFcmTokenRequest() when $default != null:
return $default(_that.fcmToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegisterFcmTokenRequest implements RegisterFcmTokenRequest {
  const _RegisterFcmTokenRequest({required this.fcmToken});
  factory _RegisterFcmTokenRequest.fromJson(Map<String, dynamic> json) => _$RegisterFcmTokenRequestFromJson(json);

@override final  String fcmToken;

/// Create a copy of RegisterFcmTokenRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterFcmTokenRequestCopyWith<_RegisterFcmTokenRequest> get copyWith => __$RegisterFcmTokenRequestCopyWithImpl<_RegisterFcmTokenRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterFcmTokenRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterFcmTokenRequest&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fcmToken);

@override
String toString() {
  return 'RegisterFcmTokenRequest(fcmToken: $fcmToken)';
}


}

/// @nodoc
abstract mixin class _$RegisterFcmTokenRequestCopyWith<$Res> implements $RegisterFcmTokenRequestCopyWith<$Res> {
  factory _$RegisterFcmTokenRequestCopyWith(_RegisterFcmTokenRequest value, $Res Function(_RegisterFcmTokenRequest) _then) = __$RegisterFcmTokenRequestCopyWithImpl;
@override @useResult
$Res call({
 String fcmToken
});




}
/// @nodoc
class __$RegisterFcmTokenRequestCopyWithImpl<$Res>
    implements _$RegisterFcmTokenRequestCopyWith<$Res> {
  __$RegisterFcmTokenRequestCopyWithImpl(this._self, this._then);

  final _RegisterFcmTokenRequest _self;
  final $Res Function(_RegisterFcmTokenRequest) _then;

/// Create a copy of RegisterFcmTokenRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fcmToken = null,}) {
  return _then(_RegisterFcmTokenRequest(
fcmToken: null == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
