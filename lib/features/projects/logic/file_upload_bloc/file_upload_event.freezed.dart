// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_upload_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FileUploadEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileUploadEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FileUploadEvent()';
}


}

/// @nodoc
class $FileUploadEventCopyWith<$Res>  {
$FileUploadEventCopyWith(FileUploadEvent _, $Res Function(FileUploadEvent) __);
}


/// Adds pattern-matching-related methods to [FileUploadEvent].
extension FileUploadEventPatterns on FileUploadEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FileUploadRequested value)?  uploadRequested,TResult Function( FileUploadCancelled value)?  uploadCancelled,TResult Function( FileResolveRequested value)?  resolveRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FileUploadRequested() when uploadRequested != null:
return uploadRequested(_that);case FileUploadCancelled() when uploadCancelled != null:
return uploadCancelled(_that);case FileResolveRequested() when resolveRequested != null:
return resolveRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FileUploadRequested value)  uploadRequested,required TResult Function( FileUploadCancelled value)  uploadCancelled,required TResult Function( FileResolveRequested value)  resolveRequested,}){
final _that = this;
switch (_that) {
case FileUploadRequested():
return uploadRequested(_that);case FileUploadCancelled():
return uploadCancelled(_that);case FileResolveRequested():
return resolveRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FileUploadRequested value)?  uploadRequested,TResult? Function( FileUploadCancelled value)?  uploadCancelled,TResult? Function( FileResolveRequested value)?  resolveRequested,}){
final _that = this;
switch (_that) {
case FileUploadRequested() when uploadRequested != null:
return uploadRequested(_that);case FileUploadCancelled() when uploadCancelled != null:
return uploadCancelled(_that);case FileResolveRequested() when resolveRequested != null:
return resolveRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String localId,  File file)?  uploadRequested,TResult Function( String localId)?  uploadCancelled,TResult Function( String key)?  resolveRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FileUploadRequested() when uploadRequested != null:
return uploadRequested(_that.localId,_that.file);case FileUploadCancelled() when uploadCancelled != null:
return uploadCancelled(_that.localId);case FileResolveRequested() when resolveRequested != null:
return resolveRequested(_that.key);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String localId,  File file)  uploadRequested,required TResult Function( String localId)  uploadCancelled,required TResult Function( String key)  resolveRequested,}) {final _that = this;
switch (_that) {
case FileUploadRequested():
return uploadRequested(_that.localId,_that.file);case FileUploadCancelled():
return uploadCancelled(_that.localId);case FileResolveRequested():
return resolveRequested(_that.key);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String localId,  File file)?  uploadRequested,TResult? Function( String localId)?  uploadCancelled,TResult? Function( String key)?  resolveRequested,}) {final _that = this;
switch (_that) {
case FileUploadRequested() when uploadRequested != null:
return uploadRequested(_that.localId,_that.file);case FileUploadCancelled() when uploadCancelled != null:
return uploadCancelled(_that.localId);case FileResolveRequested() when resolveRequested != null:
return resolveRequested(_that.key);case _:
  return null;

}
}

}

/// @nodoc


class FileUploadRequested implements FileUploadEvent {
  const FileUploadRequested({required this.localId, required this.file});
  

 final  String localId;
 final  File file;

/// Create a copy of FileUploadEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileUploadRequestedCopyWith<FileUploadRequested> get copyWith => _$FileUploadRequestedCopyWithImpl<FileUploadRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileUploadRequested&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.file, file) || other.file == file));
}


@override
int get hashCode => Object.hash(runtimeType,localId,file);

@override
String toString() {
  return 'FileUploadEvent.uploadRequested(localId: $localId, file: $file)';
}


}

/// @nodoc
abstract mixin class $FileUploadRequestedCopyWith<$Res> implements $FileUploadEventCopyWith<$Res> {
  factory $FileUploadRequestedCopyWith(FileUploadRequested value, $Res Function(FileUploadRequested) _then) = _$FileUploadRequestedCopyWithImpl;
@useResult
$Res call({
 String localId, File file
});




}
/// @nodoc
class _$FileUploadRequestedCopyWithImpl<$Res>
    implements $FileUploadRequestedCopyWith<$Res> {
  _$FileUploadRequestedCopyWithImpl(this._self, this._then);

  final FileUploadRequested _self;
  final $Res Function(FileUploadRequested) _then;

/// Create a copy of FileUploadEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? localId = null,Object? file = null,}) {
  return _then(FileUploadRequested(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as String,file: null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as File,
  ));
}


}

/// @nodoc


class FileUploadCancelled implements FileUploadEvent {
  const FileUploadCancelled({required this.localId});
  

 final  String localId;

/// Create a copy of FileUploadEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileUploadCancelledCopyWith<FileUploadCancelled> get copyWith => _$FileUploadCancelledCopyWithImpl<FileUploadCancelled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileUploadCancelled&&(identical(other.localId, localId) || other.localId == localId));
}


@override
int get hashCode => Object.hash(runtimeType,localId);

@override
String toString() {
  return 'FileUploadEvent.uploadCancelled(localId: $localId)';
}


}

/// @nodoc
abstract mixin class $FileUploadCancelledCopyWith<$Res> implements $FileUploadEventCopyWith<$Res> {
  factory $FileUploadCancelledCopyWith(FileUploadCancelled value, $Res Function(FileUploadCancelled) _then) = _$FileUploadCancelledCopyWithImpl;
@useResult
$Res call({
 String localId
});




}
/// @nodoc
class _$FileUploadCancelledCopyWithImpl<$Res>
    implements $FileUploadCancelledCopyWith<$Res> {
  _$FileUploadCancelledCopyWithImpl(this._self, this._then);

  final FileUploadCancelled _self;
  final $Res Function(FileUploadCancelled) _then;

/// Create a copy of FileUploadEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? localId = null,}) {
  return _then(FileUploadCancelled(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class FileResolveRequested implements FileUploadEvent {
  const FileResolveRequested({required this.key});
  

 final  String key;

/// Create a copy of FileUploadEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileResolveRequestedCopyWith<FileResolveRequested> get copyWith => _$FileResolveRequestedCopyWithImpl<FileResolveRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileResolveRequested&&(identical(other.key, key) || other.key == key));
}


@override
int get hashCode => Object.hash(runtimeType,key);

@override
String toString() {
  return 'FileUploadEvent.resolveRequested(key: $key)';
}


}

/// @nodoc
abstract mixin class $FileResolveRequestedCopyWith<$Res> implements $FileUploadEventCopyWith<$Res> {
  factory $FileResolveRequestedCopyWith(FileResolveRequested value, $Res Function(FileResolveRequested) _then) = _$FileResolveRequestedCopyWithImpl;
@useResult
$Res call({
 String key
});




}
/// @nodoc
class _$FileResolveRequestedCopyWithImpl<$Res>
    implements $FileResolveRequestedCopyWith<$Res> {
  _$FileResolveRequestedCopyWithImpl(this._self, this._then);

  final FileResolveRequested _self;
  final $Res Function(FileResolveRequested) _then;

/// Create a copy of FileUploadEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? key = null,}) {
  return _then(FileResolveRequested(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
