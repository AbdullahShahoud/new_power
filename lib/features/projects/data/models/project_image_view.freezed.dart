// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_image_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectImageView {

 String get key; String get name; String get contentType; int get byteSize; String? get url; DateTime? get urlExpiresAt; String get id; String? get caption; double? get exifLatitude; double? get exifLongitude; double? get exifDistanceM; int get sortOrder; DateTime get uploadedAt; String? get uploadedBy; ActorView? get uploadedByUser;
/// Create a copy of ProjectImageView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectImageViewCopyWith<ProjectImageView> get copyWith => _$ProjectImageViewCopyWithImpl<ProjectImageView>(this as ProjectImageView, _$identity);

  /// Serializes this ProjectImageView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectImageView&&(identical(other.key, key) || other.key == key)&&(identical(other.name, name) || other.name == name)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.byteSize, byteSize) || other.byteSize == byteSize)&&(identical(other.url, url) || other.url == url)&&(identical(other.urlExpiresAt, urlExpiresAt) || other.urlExpiresAt == urlExpiresAt)&&(identical(other.id, id) || other.id == id)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.exifLatitude, exifLatitude) || other.exifLatitude == exifLatitude)&&(identical(other.exifLongitude, exifLongitude) || other.exifLongitude == exifLongitude)&&(identical(other.exifDistanceM, exifDistanceM) || other.exifDistanceM == exifDistanceM)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.uploadedAt, uploadedAt) || other.uploadedAt == uploadedAt)&&(identical(other.uploadedBy, uploadedBy) || other.uploadedBy == uploadedBy)&&(identical(other.uploadedByUser, uploadedByUser) || other.uploadedByUser == uploadedByUser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,name,contentType,byteSize,url,urlExpiresAt,id,caption,exifLatitude,exifLongitude,exifDistanceM,sortOrder,uploadedAt,uploadedBy,uploadedByUser);



}

/// @nodoc
abstract mixin class $ProjectImageViewCopyWith<$Res>  {
  factory $ProjectImageViewCopyWith(ProjectImageView value, $Res Function(ProjectImageView) _then) = _$ProjectImageViewCopyWithImpl;
@useResult
$Res call({
 String key, String name, String contentType, int byteSize, String? url, DateTime? urlExpiresAt, String id, String? caption, double? exifLatitude, double? exifLongitude, double? exifDistanceM, int sortOrder, DateTime uploadedAt, String? uploadedBy, ActorView? uploadedByUser
});


$ActorViewCopyWith<$Res>? get uploadedByUser;

}
/// @nodoc
class _$ProjectImageViewCopyWithImpl<$Res>
    implements $ProjectImageViewCopyWith<$Res> {
  _$ProjectImageViewCopyWithImpl(this._self, this._then);

  final ProjectImageView _self;
  final $Res Function(ProjectImageView) _then;

/// Create a copy of ProjectImageView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? name = null,Object? contentType = null,Object? byteSize = null,Object? url = freezed,Object? urlExpiresAt = freezed,Object? id = null,Object? caption = freezed,Object? exifLatitude = freezed,Object? exifLongitude = freezed,Object? exifDistanceM = freezed,Object? sortOrder = null,Object? uploadedAt = null,Object? uploadedBy = freezed,Object? uploadedByUser = freezed,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String,byteSize: null == byteSize ? _self.byteSize : byteSize // ignore: cast_nullable_to_non_nullable
as int,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,urlExpiresAt: freezed == urlExpiresAt ? _self.urlExpiresAt : urlExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,exifLatitude: freezed == exifLatitude ? _self.exifLatitude : exifLatitude // ignore: cast_nullable_to_non_nullable
as double?,exifLongitude: freezed == exifLongitude ? _self.exifLongitude : exifLongitude // ignore: cast_nullable_to_non_nullable
as double?,exifDistanceM: freezed == exifDistanceM ? _self.exifDistanceM : exifDistanceM // ignore: cast_nullable_to_non_nullable
as double?,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,uploadedAt: null == uploadedAt ? _self.uploadedAt : uploadedAt // ignore: cast_nullable_to_non_nullable
as DateTime,uploadedBy: freezed == uploadedBy ? _self.uploadedBy : uploadedBy // ignore: cast_nullable_to_non_nullable
as String?,uploadedByUser: freezed == uploadedByUser ? _self.uploadedByUser : uploadedByUser // ignore: cast_nullable_to_non_nullable
as ActorView?,
  ));
}
/// Create a copy of ProjectImageView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActorViewCopyWith<$Res>? get uploadedByUser {
    if (_self.uploadedByUser == null) {
    return null;
  }

  return $ActorViewCopyWith<$Res>(_self.uploadedByUser!, (value) {
    return _then(_self.copyWith(uploadedByUser: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProjectImageView].
extension ProjectImageViewPatterns on ProjectImageView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectImageView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectImageView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectImageView value)  $default,){
final _that = this;
switch (_that) {
case _ProjectImageView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectImageView value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectImageView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  String name,  String contentType,  int byteSize,  String? url,  DateTime? urlExpiresAt,  String id,  String? caption,  double? exifLatitude,  double? exifLongitude,  double? exifDistanceM,  int sortOrder,  DateTime uploadedAt,  String? uploadedBy,  ActorView? uploadedByUser)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectImageView() when $default != null:
return $default(_that.key,_that.name,_that.contentType,_that.byteSize,_that.url,_that.urlExpiresAt,_that.id,_that.caption,_that.exifLatitude,_that.exifLongitude,_that.exifDistanceM,_that.sortOrder,_that.uploadedAt,_that.uploadedBy,_that.uploadedByUser);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  String name,  String contentType,  int byteSize,  String? url,  DateTime? urlExpiresAt,  String id,  String? caption,  double? exifLatitude,  double? exifLongitude,  double? exifDistanceM,  int sortOrder,  DateTime uploadedAt,  String? uploadedBy,  ActorView? uploadedByUser)  $default,) {final _that = this;
switch (_that) {
case _ProjectImageView():
return $default(_that.key,_that.name,_that.contentType,_that.byteSize,_that.url,_that.urlExpiresAt,_that.id,_that.caption,_that.exifLatitude,_that.exifLongitude,_that.exifDistanceM,_that.sortOrder,_that.uploadedAt,_that.uploadedBy,_that.uploadedByUser);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  String name,  String contentType,  int byteSize,  String? url,  DateTime? urlExpiresAt,  String id,  String? caption,  double? exifLatitude,  double? exifLongitude,  double? exifDistanceM,  int sortOrder,  DateTime uploadedAt,  String? uploadedBy,  ActorView? uploadedByUser)?  $default,) {final _that = this;
switch (_that) {
case _ProjectImageView() when $default != null:
return $default(_that.key,_that.name,_that.contentType,_that.byteSize,_that.url,_that.urlExpiresAt,_that.id,_that.caption,_that.exifLatitude,_that.exifLongitude,_that.exifDistanceM,_that.sortOrder,_that.uploadedAt,_that.uploadedBy,_that.uploadedByUser);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectImageView implements ProjectImageView {
  const _ProjectImageView({required this.key, required this.name, required this.contentType, required this.byteSize, this.url, this.urlExpiresAt, required this.id, this.caption, this.exifLatitude, this.exifLongitude, this.exifDistanceM, required this.sortOrder, required this.uploadedAt, this.uploadedBy, this.uploadedByUser});
  factory _ProjectImageView.fromJson(Map<String, dynamic> json) => _$ProjectImageViewFromJson(json);

@override final  String key;
@override final  String name;
@override final  String contentType;
@override final  int byteSize;
@override final  String? url;
@override final  DateTime? urlExpiresAt;
@override final  String id;
@override final  String? caption;
@override final  double? exifLatitude;
@override final  double? exifLongitude;
@override final  double? exifDistanceM;
@override final  int sortOrder;
@override final  DateTime uploadedAt;
@override final  String? uploadedBy;
@override final  ActorView? uploadedByUser;

/// Create a copy of ProjectImageView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectImageViewCopyWith<_ProjectImageView> get copyWith => __$ProjectImageViewCopyWithImpl<_ProjectImageView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectImageViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectImageView&&(identical(other.key, key) || other.key == key)&&(identical(other.name, name) || other.name == name)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.byteSize, byteSize) || other.byteSize == byteSize)&&(identical(other.url, url) || other.url == url)&&(identical(other.urlExpiresAt, urlExpiresAt) || other.urlExpiresAt == urlExpiresAt)&&(identical(other.id, id) || other.id == id)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.exifLatitude, exifLatitude) || other.exifLatitude == exifLatitude)&&(identical(other.exifLongitude, exifLongitude) || other.exifLongitude == exifLongitude)&&(identical(other.exifDistanceM, exifDistanceM) || other.exifDistanceM == exifDistanceM)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.uploadedAt, uploadedAt) || other.uploadedAt == uploadedAt)&&(identical(other.uploadedBy, uploadedBy) || other.uploadedBy == uploadedBy)&&(identical(other.uploadedByUser, uploadedByUser) || other.uploadedByUser == uploadedByUser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,name,contentType,byteSize,url,urlExpiresAt,id,caption,exifLatitude,exifLongitude,exifDistanceM,sortOrder,uploadedAt,uploadedBy,uploadedByUser);



}

/// @nodoc
abstract mixin class _$ProjectImageViewCopyWith<$Res> implements $ProjectImageViewCopyWith<$Res> {
  factory _$ProjectImageViewCopyWith(_ProjectImageView value, $Res Function(_ProjectImageView) _then) = __$ProjectImageViewCopyWithImpl;
@override @useResult
$Res call({
 String key, String name, String contentType, int byteSize, String? url, DateTime? urlExpiresAt, String id, String? caption, double? exifLatitude, double? exifLongitude, double? exifDistanceM, int sortOrder, DateTime uploadedAt, String? uploadedBy, ActorView? uploadedByUser
});


@override $ActorViewCopyWith<$Res>? get uploadedByUser;

}
/// @nodoc
class __$ProjectImageViewCopyWithImpl<$Res>
    implements _$ProjectImageViewCopyWith<$Res> {
  __$ProjectImageViewCopyWithImpl(this._self, this._then);

  final _ProjectImageView _self;
  final $Res Function(_ProjectImageView) _then;

/// Create a copy of ProjectImageView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? name = null,Object? contentType = null,Object? byteSize = null,Object? url = freezed,Object? urlExpiresAt = freezed,Object? id = null,Object? caption = freezed,Object? exifLatitude = freezed,Object? exifLongitude = freezed,Object? exifDistanceM = freezed,Object? sortOrder = null,Object? uploadedAt = null,Object? uploadedBy = freezed,Object? uploadedByUser = freezed,}) {
  return _then(_ProjectImageView(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String,byteSize: null == byteSize ? _self.byteSize : byteSize // ignore: cast_nullable_to_non_nullable
as int,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,urlExpiresAt: freezed == urlExpiresAt ? _self.urlExpiresAt : urlExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,exifLatitude: freezed == exifLatitude ? _self.exifLatitude : exifLatitude // ignore: cast_nullable_to_non_nullable
as double?,exifLongitude: freezed == exifLongitude ? _self.exifLongitude : exifLongitude // ignore: cast_nullable_to_non_nullable
as double?,exifDistanceM: freezed == exifDistanceM ? _self.exifDistanceM : exifDistanceM // ignore: cast_nullable_to_non_nullable
as double?,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,uploadedAt: null == uploadedAt ? _self.uploadedAt : uploadedAt // ignore: cast_nullable_to_non_nullable
as DateTime,uploadedBy: freezed == uploadedBy ? _self.uploadedBy : uploadedBy // ignore: cast_nullable_to_non_nullable
as String?,uploadedByUser: freezed == uploadedByUser ? _self.uploadedByUser : uploadedByUser // ignore: cast_nullable_to_non_nullable
as ActorView?,
  ));
}

/// Create a copy of ProjectImageView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActorViewCopyWith<$Res>? get uploadedByUser {
    if (_self.uploadedByUser == null) {
    return null;
  }

  return $ActorViewCopyWith<$Res>(_self.uploadedByUser!, (value) {
    return _then(_self.copyWith(uploadedByUser: value));
  });
}
}

// dart format on
