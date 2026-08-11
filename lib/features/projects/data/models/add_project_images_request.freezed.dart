// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_project_images_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddProjectImagesRequest {

 List<ProjectFileRefDto> get files;
/// Create a copy of AddProjectImagesRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddProjectImagesRequestCopyWith<AddProjectImagesRequest> get copyWith => _$AddProjectImagesRequestCopyWithImpl<AddProjectImagesRequest>(this as AddProjectImagesRequest, _$identity);

  /// Serializes this AddProjectImagesRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddProjectImagesRequest&&const DeepCollectionEquality().equals(other.files, files));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(files));

@override
String toString() {
  return 'AddProjectImagesRequest(files: $files)';
}


}

/// @nodoc
abstract mixin class $AddProjectImagesRequestCopyWith<$Res>  {
  factory $AddProjectImagesRequestCopyWith(AddProjectImagesRequest value, $Res Function(AddProjectImagesRequest) _then) = _$AddProjectImagesRequestCopyWithImpl;
@useResult
$Res call({
 List<ProjectFileRefDto> files
});




}
/// @nodoc
class _$AddProjectImagesRequestCopyWithImpl<$Res>
    implements $AddProjectImagesRequestCopyWith<$Res> {
  _$AddProjectImagesRequestCopyWithImpl(this._self, this._then);

  final AddProjectImagesRequest _self;
  final $Res Function(AddProjectImagesRequest) _then;

/// Create a copy of AddProjectImagesRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? files = null,}) {
  return _then(_self.copyWith(
files: null == files ? _self.files : files // ignore: cast_nullable_to_non_nullable
as List<ProjectFileRefDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [AddProjectImagesRequest].
extension AddProjectImagesRequestPatterns on AddProjectImagesRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddProjectImagesRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddProjectImagesRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddProjectImagesRequest value)  $default,){
final _that = this;
switch (_that) {
case _AddProjectImagesRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddProjectImagesRequest value)?  $default,){
final _that = this;
switch (_that) {
case _AddProjectImagesRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProjectFileRefDto> files)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddProjectImagesRequest() when $default != null:
return $default(_that.files);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProjectFileRefDto> files)  $default,) {final _that = this;
switch (_that) {
case _AddProjectImagesRequest():
return $default(_that.files);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProjectFileRefDto> files)?  $default,) {final _that = this;
switch (_that) {
case _AddProjectImagesRequest() when $default != null:
return $default(_that.files);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddProjectImagesRequest implements AddProjectImagesRequest {
  const _AddProjectImagesRequest({required final  List<ProjectFileRefDto> files}): _files = files;
  factory _AddProjectImagesRequest.fromJson(Map<String, dynamic> json) => _$AddProjectImagesRequestFromJson(json);

 final  List<ProjectFileRefDto> _files;
@override List<ProjectFileRefDto> get files {
  if (_files is EqualUnmodifiableListView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_files);
}


/// Create a copy of AddProjectImagesRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddProjectImagesRequestCopyWith<_AddProjectImagesRequest> get copyWith => __$AddProjectImagesRequestCopyWithImpl<_AddProjectImagesRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddProjectImagesRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddProjectImagesRequest&&const DeepCollectionEquality().equals(other._files, _files));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_files));

@override
String toString() {
  return 'AddProjectImagesRequest(files: $files)';
}


}

/// @nodoc
abstract mixin class _$AddProjectImagesRequestCopyWith<$Res> implements $AddProjectImagesRequestCopyWith<$Res> {
  factory _$AddProjectImagesRequestCopyWith(_AddProjectImagesRequest value, $Res Function(_AddProjectImagesRequest) _then) = __$AddProjectImagesRequestCopyWithImpl;
@override @useResult
$Res call({
 List<ProjectFileRefDto> files
});




}
/// @nodoc
class __$AddProjectImagesRequestCopyWithImpl<$Res>
    implements _$AddProjectImagesRequestCopyWith<$Res> {
  __$AddProjectImagesRequestCopyWithImpl(this._self, this._then);

  final _AddProjectImagesRequest _self;
  final $Res Function(_AddProjectImagesRequest) _then;

/// Create a copy of AddProjectImagesRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? files = null,}) {
  return _then(_AddProjectImagesRequest(
files: null == files ? _self._files : files // ignore: cast_nullable_to_non_nullable
as List<ProjectFileRefDto>,
  ));
}


}

// dart format on
