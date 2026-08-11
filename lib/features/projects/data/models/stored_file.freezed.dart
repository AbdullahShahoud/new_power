// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stored_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StoredFileView {

 String get key; String get name; String get contentType; int get byteSize; String? get url; DateTime? get urlExpiresAt;
/// Create a copy of StoredFileView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoredFileViewCopyWith<StoredFileView> get copyWith => _$StoredFileViewCopyWithImpl<StoredFileView>(this as StoredFileView, _$identity);

  /// Serializes this StoredFileView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoredFileView&&(identical(other.key, key) || other.key == key)&&(identical(other.name, name) || other.name == name)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.byteSize, byteSize) || other.byteSize == byteSize)&&(identical(other.url, url) || other.url == url)&&(identical(other.urlExpiresAt, urlExpiresAt) || other.urlExpiresAt == urlExpiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,name,contentType,byteSize,url,urlExpiresAt);



}

/// @nodoc
abstract mixin class $StoredFileViewCopyWith<$Res>  {
  factory $StoredFileViewCopyWith(StoredFileView value, $Res Function(StoredFileView) _then) = _$StoredFileViewCopyWithImpl;
@useResult
$Res call({
 String key, String name, String contentType, int byteSize, String? url, DateTime? urlExpiresAt
});




}
/// @nodoc
class _$StoredFileViewCopyWithImpl<$Res>
    implements $StoredFileViewCopyWith<$Res> {
  _$StoredFileViewCopyWithImpl(this._self, this._then);

  final StoredFileView _self;
  final $Res Function(StoredFileView) _then;

/// Create a copy of StoredFileView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? name = null,Object? contentType = null,Object? byteSize = null,Object? url = freezed,Object? urlExpiresAt = freezed,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String,byteSize: null == byteSize ? _self.byteSize : byteSize // ignore: cast_nullable_to_non_nullable
as int,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,urlExpiresAt: freezed == urlExpiresAt ? _self.urlExpiresAt : urlExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [StoredFileView].
extension StoredFileViewPatterns on StoredFileView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoredFileView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoredFileView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoredFileView value)  $default,){
final _that = this;
switch (_that) {
case _StoredFileView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoredFileView value)?  $default,){
final _that = this;
switch (_that) {
case _StoredFileView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  String name,  String contentType,  int byteSize,  String? url,  DateTime? urlExpiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoredFileView() when $default != null:
return $default(_that.key,_that.name,_that.contentType,_that.byteSize,_that.url,_that.urlExpiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  String name,  String contentType,  int byteSize,  String? url,  DateTime? urlExpiresAt)  $default,) {final _that = this;
switch (_that) {
case _StoredFileView():
return $default(_that.key,_that.name,_that.contentType,_that.byteSize,_that.url,_that.urlExpiresAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  String name,  String contentType,  int byteSize,  String? url,  DateTime? urlExpiresAt)?  $default,) {final _that = this;
switch (_that) {
case _StoredFileView() when $default != null:
return $default(_that.key,_that.name,_that.contentType,_that.byteSize,_that.url,_that.urlExpiresAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StoredFileView implements StoredFileView {
  const _StoredFileView({required this.key, required this.name, required this.contentType, required this.byteSize, this.url, this.urlExpiresAt});
  factory _StoredFileView.fromJson(Map<String, dynamic> json) => _$StoredFileViewFromJson(json);

@override final  String key;
@override final  String name;
@override final  String contentType;
@override final  int byteSize;
@override final  String? url;
@override final  DateTime? urlExpiresAt;

/// Create a copy of StoredFileView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoredFileViewCopyWith<_StoredFileView> get copyWith => __$StoredFileViewCopyWithImpl<_StoredFileView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoredFileViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoredFileView&&(identical(other.key, key) || other.key == key)&&(identical(other.name, name) || other.name == name)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.byteSize, byteSize) || other.byteSize == byteSize)&&(identical(other.url, url) || other.url == url)&&(identical(other.urlExpiresAt, urlExpiresAt) || other.urlExpiresAt == urlExpiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,name,contentType,byteSize,url,urlExpiresAt);



}

/// @nodoc
abstract mixin class _$StoredFileViewCopyWith<$Res> implements $StoredFileViewCopyWith<$Res> {
  factory _$StoredFileViewCopyWith(_StoredFileView value, $Res Function(_StoredFileView) _then) = __$StoredFileViewCopyWithImpl;
@override @useResult
$Res call({
 String key, String name, String contentType, int byteSize, String? url, DateTime? urlExpiresAt
});




}
/// @nodoc
class __$StoredFileViewCopyWithImpl<$Res>
    implements _$StoredFileViewCopyWith<$Res> {
  __$StoredFileViewCopyWithImpl(this._self, this._then);

  final _StoredFileView _self;
  final $Res Function(_StoredFileView) _then;

/// Create a copy of StoredFileView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? name = null,Object? contentType = null,Object? byteSize = null,Object? url = freezed,Object? urlExpiresAt = freezed,}) {
  return _then(_StoredFileView(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String,byteSize: null == byteSize ? _self.byteSize : byteSize // ignore: cast_nullable_to_non_nullable
as int,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,urlExpiresAt: freezed == urlExpiresAt ? _self.urlExpiresAt : urlExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$ProjectFileRefDto {

 String get key; String get name; String? get caption; double? get exifLatitude; double? get exifLongitude;
/// Create a copy of ProjectFileRefDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectFileRefDtoCopyWith<ProjectFileRefDto> get copyWith => _$ProjectFileRefDtoCopyWithImpl<ProjectFileRefDto>(this as ProjectFileRefDto, _$identity);

  /// Serializes this ProjectFileRefDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectFileRefDto&&(identical(other.key, key) || other.key == key)&&(identical(other.name, name) || other.name == name)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.exifLatitude, exifLatitude) || other.exifLatitude == exifLatitude)&&(identical(other.exifLongitude, exifLongitude) || other.exifLongitude == exifLongitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,name,caption,exifLatitude,exifLongitude);

@override
String toString() {
  return 'ProjectFileRefDto(key: $key, name: $name, caption: $caption, exifLatitude: $exifLatitude, exifLongitude: $exifLongitude)';
}


}

/// @nodoc
abstract mixin class $ProjectFileRefDtoCopyWith<$Res>  {
  factory $ProjectFileRefDtoCopyWith(ProjectFileRefDto value, $Res Function(ProjectFileRefDto) _then) = _$ProjectFileRefDtoCopyWithImpl;
@useResult
$Res call({
 String key, String name, String? caption, double? exifLatitude, double? exifLongitude
});




}
/// @nodoc
class _$ProjectFileRefDtoCopyWithImpl<$Res>
    implements $ProjectFileRefDtoCopyWith<$Res> {
  _$ProjectFileRefDtoCopyWithImpl(this._self, this._then);

  final ProjectFileRefDto _self;
  final $Res Function(ProjectFileRefDto) _then;

/// Create a copy of ProjectFileRefDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? name = null,Object? caption = freezed,Object? exifLatitude = freezed,Object? exifLongitude = freezed,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,exifLatitude: freezed == exifLatitude ? _self.exifLatitude : exifLatitude // ignore: cast_nullable_to_non_nullable
as double?,exifLongitude: freezed == exifLongitude ? _self.exifLongitude : exifLongitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectFileRefDto].
extension ProjectFileRefDtoPatterns on ProjectFileRefDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectFileRefDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectFileRefDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectFileRefDto value)  $default,){
final _that = this;
switch (_that) {
case _ProjectFileRefDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectFileRefDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectFileRefDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  String name,  String? caption,  double? exifLatitude,  double? exifLongitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectFileRefDto() when $default != null:
return $default(_that.key,_that.name,_that.caption,_that.exifLatitude,_that.exifLongitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  String name,  String? caption,  double? exifLatitude,  double? exifLongitude)  $default,) {final _that = this;
switch (_that) {
case _ProjectFileRefDto():
return $default(_that.key,_that.name,_that.caption,_that.exifLatitude,_that.exifLongitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  String name,  String? caption,  double? exifLatitude,  double? exifLongitude)?  $default,) {final _that = this;
switch (_that) {
case _ProjectFileRefDto() when $default != null:
return $default(_that.key,_that.name,_that.caption,_that.exifLatitude,_that.exifLongitude);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectFileRefDto implements ProjectFileRefDto {
  const _ProjectFileRefDto({required this.key, required this.name, this.caption, this.exifLatitude, this.exifLongitude});
  factory _ProjectFileRefDto.fromJson(Map<String, dynamic> json) => _$ProjectFileRefDtoFromJson(json);

@override final  String key;
@override final  String name;
@override final  String? caption;
@override final  double? exifLatitude;
@override final  double? exifLongitude;

/// Create a copy of ProjectFileRefDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectFileRefDtoCopyWith<_ProjectFileRefDto> get copyWith => __$ProjectFileRefDtoCopyWithImpl<_ProjectFileRefDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectFileRefDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectFileRefDto&&(identical(other.key, key) || other.key == key)&&(identical(other.name, name) || other.name == name)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.exifLatitude, exifLatitude) || other.exifLatitude == exifLatitude)&&(identical(other.exifLongitude, exifLongitude) || other.exifLongitude == exifLongitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,name,caption,exifLatitude,exifLongitude);

@override
String toString() {
  return 'ProjectFileRefDto(key: $key, name: $name, caption: $caption, exifLatitude: $exifLatitude, exifLongitude: $exifLongitude)';
}


}

/// @nodoc
abstract mixin class _$ProjectFileRefDtoCopyWith<$Res> implements $ProjectFileRefDtoCopyWith<$Res> {
  factory _$ProjectFileRefDtoCopyWith(_ProjectFileRefDto value, $Res Function(_ProjectFileRefDto) _then) = __$ProjectFileRefDtoCopyWithImpl;
@override @useResult
$Res call({
 String key, String name, String? caption, double? exifLatitude, double? exifLongitude
});




}
/// @nodoc
class __$ProjectFileRefDtoCopyWithImpl<$Res>
    implements _$ProjectFileRefDtoCopyWith<$Res> {
  __$ProjectFileRefDtoCopyWithImpl(this._self, this._then);

  final _ProjectFileRefDto _self;
  final $Res Function(_ProjectFileRefDto) _then;

/// Create a copy of ProjectFileRefDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? name = null,Object? caption = freezed,Object? exifLatitude = freezed,Object? exifLongitude = freezed,}) {
  return _then(_ProjectFileRefDto(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,exifLatitude: freezed == exifLatitude ? _self.exifLatitude : exifLatitude // ignore: cast_nullable_to_non_nullable
as double?,exifLongitude: freezed == exifLongitude ? _self.exifLongitude : exifLongitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
