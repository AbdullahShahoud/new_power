// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_upload_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FileUploadItem {

 String get localId; FileUploadItemStatus get status; double get progress; StoredFileView? get file; FileUploadFailureReason? get failureReason; String? get errorMessage;
/// Create a copy of FileUploadItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileUploadItemCopyWith<FileUploadItem> get copyWith => _$FileUploadItemCopyWithImpl<FileUploadItem>(this as FileUploadItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileUploadItem&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.status, status) || other.status == status)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.file, file) || other.file == file)&&(identical(other.failureReason, failureReason) || other.failureReason == failureReason)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,localId,status,progress,file,failureReason,errorMessage);

@override
String toString() {
  return 'FileUploadItem(localId: $localId, status: $status, progress: $progress, file: $file, failureReason: $failureReason, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $FileUploadItemCopyWith<$Res>  {
  factory $FileUploadItemCopyWith(FileUploadItem value, $Res Function(FileUploadItem) _then) = _$FileUploadItemCopyWithImpl;
@useResult
$Res call({
 String localId, FileUploadItemStatus status, double progress, StoredFileView? file, FileUploadFailureReason? failureReason, String? errorMessage
});


$StoredFileViewCopyWith<$Res>? get file;

}
/// @nodoc
class _$FileUploadItemCopyWithImpl<$Res>
    implements $FileUploadItemCopyWith<$Res> {
  _$FileUploadItemCopyWithImpl(this._self, this._then);

  final FileUploadItem _self;
  final $Res Function(FileUploadItem) _then;

/// Create a copy of FileUploadItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = null,Object? status = null,Object? progress = null,Object? file = freezed,Object? failureReason = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FileUploadItemStatus,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,file: freezed == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as StoredFileView?,failureReason: freezed == failureReason ? _self.failureReason : failureReason // ignore: cast_nullable_to_non_nullable
as FileUploadFailureReason?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of FileUploadItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoredFileViewCopyWith<$Res>? get file {
    if (_self.file == null) {
    return null;
  }

  return $StoredFileViewCopyWith<$Res>(_self.file!, (value) {
    return _then(_self.copyWith(file: value));
  });
}
}


/// Adds pattern-matching-related methods to [FileUploadItem].
extension FileUploadItemPatterns on FileUploadItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FileUploadItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FileUploadItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FileUploadItem value)  $default,){
final _that = this;
switch (_that) {
case _FileUploadItem():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FileUploadItem value)?  $default,){
final _that = this;
switch (_that) {
case _FileUploadItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String localId,  FileUploadItemStatus status,  double progress,  StoredFileView? file,  FileUploadFailureReason? failureReason,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FileUploadItem() when $default != null:
return $default(_that.localId,_that.status,_that.progress,_that.file,_that.failureReason,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String localId,  FileUploadItemStatus status,  double progress,  StoredFileView? file,  FileUploadFailureReason? failureReason,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _FileUploadItem():
return $default(_that.localId,_that.status,_that.progress,_that.file,_that.failureReason,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String localId,  FileUploadItemStatus status,  double progress,  StoredFileView? file,  FileUploadFailureReason? failureReason,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _FileUploadItem() when $default != null:
return $default(_that.localId,_that.status,_that.progress,_that.file,_that.failureReason,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _FileUploadItem implements FileUploadItem {
  const _FileUploadItem({required this.localId, required this.status, this.progress = 0.0, this.file, this.failureReason, this.errorMessage});
  

@override final  String localId;
@override final  FileUploadItemStatus status;
@override@JsonKey() final  double progress;
@override final  StoredFileView? file;
@override final  FileUploadFailureReason? failureReason;
@override final  String? errorMessage;

/// Create a copy of FileUploadItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FileUploadItemCopyWith<_FileUploadItem> get copyWith => __$FileUploadItemCopyWithImpl<_FileUploadItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FileUploadItem&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.status, status) || other.status == status)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.file, file) || other.file == file)&&(identical(other.failureReason, failureReason) || other.failureReason == failureReason)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,localId,status,progress,file,failureReason,errorMessage);

@override
String toString() {
  return 'FileUploadItem(localId: $localId, status: $status, progress: $progress, file: $file, failureReason: $failureReason, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$FileUploadItemCopyWith<$Res> implements $FileUploadItemCopyWith<$Res> {
  factory _$FileUploadItemCopyWith(_FileUploadItem value, $Res Function(_FileUploadItem) _then) = __$FileUploadItemCopyWithImpl;
@override @useResult
$Res call({
 String localId, FileUploadItemStatus status, double progress, StoredFileView? file, FileUploadFailureReason? failureReason, String? errorMessage
});


@override $StoredFileViewCopyWith<$Res>? get file;

}
/// @nodoc
class __$FileUploadItemCopyWithImpl<$Res>
    implements _$FileUploadItemCopyWith<$Res> {
  __$FileUploadItemCopyWithImpl(this._self, this._then);

  final _FileUploadItem _self;
  final $Res Function(_FileUploadItem) _then;

/// Create a copy of FileUploadItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = null,Object? status = null,Object? progress = null,Object? file = freezed,Object? failureReason = freezed,Object? errorMessage = freezed,}) {
  return _then(_FileUploadItem(
localId: null == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FileUploadItemStatus,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,file: freezed == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as StoredFileView?,failureReason: freezed == failureReason ? _self.failureReason : failureReason // ignore: cast_nullable_to_non_nullable
as FileUploadFailureReason?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of FileUploadItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoredFileViewCopyWith<$Res>? get file {
    if (_self.file == null) {
    return null;
  }

  return $StoredFileViewCopyWith<$Res>(_self.file!, (value) {
    return _then(_self.copyWith(file: value));
  });
}
}

/// @nodoc
mixin _$FileResolveItem {

 String get key; FileResolveStatus get status; StoredFileView? get file; String? get errorMessage;
/// Create a copy of FileResolveItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileResolveItemCopyWith<FileResolveItem> get copyWith => _$FileResolveItemCopyWithImpl<FileResolveItem>(this as FileResolveItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileResolveItem&&(identical(other.key, key) || other.key == key)&&(identical(other.status, status) || other.status == status)&&(identical(other.file, file) || other.file == file)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,key,status,file,errorMessage);

@override
String toString() {
  return 'FileResolveItem(key: $key, status: $status, file: $file, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $FileResolveItemCopyWith<$Res>  {
  factory $FileResolveItemCopyWith(FileResolveItem value, $Res Function(FileResolveItem) _then) = _$FileResolveItemCopyWithImpl;
@useResult
$Res call({
 String key, FileResolveStatus status, StoredFileView? file, String? errorMessage
});


$StoredFileViewCopyWith<$Res>? get file;

}
/// @nodoc
class _$FileResolveItemCopyWithImpl<$Res>
    implements $FileResolveItemCopyWith<$Res> {
  _$FileResolveItemCopyWithImpl(this._self, this._then);

  final FileResolveItem _self;
  final $Res Function(FileResolveItem) _then;

/// Create a copy of FileResolveItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? status = null,Object? file = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FileResolveStatus,file: freezed == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as StoredFileView?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of FileResolveItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoredFileViewCopyWith<$Res>? get file {
    if (_self.file == null) {
    return null;
  }

  return $StoredFileViewCopyWith<$Res>(_self.file!, (value) {
    return _then(_self.copyWith(file: value));
  });
}
}


/// Adds pattern-matching-related methods to [FileResolveItem].
extension FileResolveItemPatterns on FileResolveItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FileResolveItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FileResolveItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FileResolveItem value)  $default,){
final _that = this;
switch (_that) {
case _FileResolveItem():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FileResolveItem value)?  $default,){
final _that = this;
switch (_that) {
case _FileResolveItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  FileResolveStatus status,  StoredFileView? file,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FileResolveItem() when $default != null:
return $default(_that.key,_that.status,_that.file,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  FileResolveStatus status,  StoredFileView? file,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _FileResolveItem():
return $default(_that.key,_that.status,_that.file,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  FileResolveStatus status,  StoredFileView? file,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _FileResolveItem() when $default != null:
return $default(_that.key,_that.status,_that.file,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _FileResolveItem implements FileResolveItem {
  const _FileResolveItem({required this.key, required this.status, this.file, this.errorMessage});
  

@override final  String key;
@override final  FileResolveStatus status;
@override final  StoredFileView? file;
@override final  String? errorMessage;

/// Create a copy of FileResolveItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FileResolveItemCopyWith<_FileResolveItem> get copyWith => __$FileResolveItemCopyWithImpl<_FileResolveItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FileResolveItem&&(identical(other.key, key) || other.key == key)&&(identical(other.status, status) || other.status == status)&&(identical(other.file, file) || other.file == file)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,key,status,file,errorMessage);

@override
String toString() {
  return 'FileResolveItem(key: $key, status: $status, file: $file, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$FileResolveItemCopyWith<$Res> implements $FileResolveItemCopyWith<$Res> {
  factory _$FileResolveItemCopyWith(_FileResolveItem value, $Res Function(_FileResolveItem) _then) = __$FileResolveItemCopyWithImpl;
@override @useResult
$Res call({
 String key, FileResolveStatus status, StoredFileView? file, String? errorMessage
});


@override $StoredFileViewCopyWith<$Res>? get file;

}
/// @nodoc
class __$FileResolveItemCopyWithImpl<$Res>
    implements _$FileResolveItemCopyWith<$Res> {
  __$FileResolveItemCopyWithImpl(this._self, this._then);

  final _FileResolveItem _self;
  final $Res Function(_FileResolveItem) _then;

/// Create a copy of FileResolveItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? status = null,Object? file = freezed,Object? errorMessage = freezed,}) {
  return _then(_FileResolveItem(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FileResolveStatus,file: freezed == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as StoredFileView?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of FileResolveItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoredFileViewCopyWith<$Res>? get file {
    if (_self.file == null) {
    return null;
  }

  return $StoredFileViewCopyWith<$Res>(_self.file!, (value) {
    return _then(_self.copyWith(file: value));
  });
}
}

/// @nodoc
mixin _$FileUploadState {

 Map<String, FileUploadItem> get uploads; Map<String, FileResolveItem> get resolves;
/// Create a copy of FileUploadState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileUploadStateCopyWith<FileUploadState> get copyWith => _$FileUploadStateCopyWithImpl<FileUploadState>(this as FileUploadState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileUploadState&&const DeepCollectionEquality().equals(other.uploads, uploads)&&const DeepCollectionEquality().equals(other.resolves, resolves));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(uploads),const DeepCollectionEquality().hash(resolves));

@override
String toString() {
  return 'FileUploadState(uploads: $uploads, resolves: $resolves)';
}


}

/// @nodoc
abstract mixin class $FileUploadStateCopyWith<$Res>  {
  factory $FileUploadStateCopyWith(FileUploadState value, $Res Function(FileUploadState) _then) = _$FileUploadStateCopyWithImpl;
@useResult
$Res call({
 Map<String, FileUploadItem> uploads, Map<String, FileResolveItem> resolves
});




}
/// @nodoc
class _$FileUploadStateCopyWithImpl<$Res>
    implements $FileUploadStateCopyWith<$Res> {
  _$FileUploadStateCopyWithImpl(this._self, this._then);

  final FileUploadState _self;
  final $Res Function(FileUploadState) _then;

/// Create a copy of FileUploadState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uploads = null,Object? resolves = null,}) {
  return _then(_self.copyWith(
uploads: null == uploads ? _self.uploads : uploads // ignore: cast_nullable_to_non_nullable
as Map<String, FileUploadItem>,resolves: null == resolves ? _self.resolves : resolves // ignore: cast_nullable_to_non_nullable
as Map<String, FileResolveItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [FileUploadState].
extension FileUploadStatePatterns on FileUploadState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FileUploadState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FileUploadState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FileUploadState value)  $default,){
final _that = this;
switch (_that) {
case _FileUploadState():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FileUploadState value)?  $default,){
final _that = this;
switch (_that) {
case _FileUploadState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, FileUploadItem> uploads,  Map<String, FileResolveItem> resolves)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FileUploadState() when $default != null:
return $default(_that.uploads,_that.resolves);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, FileUploadItem> uploads,  Map<String, FileResolveItem> resolves)  $default,) {final _that = this;
switch (_that) {
case _FileUploadState():
return $default(_that.uploads,_that.resolves);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, FileUploadItem> uploads,  Map<String, FileResolveItem> resolves)?  $default,) {final _that = this;
switch (_that) {
case _FileUploadState() when $default != null:
return $default(_that.uploads,_that.resolves);case _:
  return null;

}
}

}

/// @nodoc


class _FileUploadState implements FileUploadState {
  const _FileUploadState({final  Map<String, FileUploadItem> uploads = const <String, FileUploadItem>{}, final  Map<String, FileResolveItem> resolves = const <String, FileResolveItem>{}}): _uploads = uploads,_resolves = resolves;
  

 final  Map<String, FileUploadItem> _uploads;
@override@JsonKey() Map<String, FileUploadItem> get uploads {
  if (_uploads is EqualUnmodifiableMapView) return _uploads;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_uploads);
}

 final  Map<String, FileResolveItem> _resolves;
@override@JsonKey() Map<String, FileResolveItem> get resolves {
  if (_resolves is EqualUnmodifiableMapView) return _resolves;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_resolves);
}


/// Create a copy of FileUploadState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FileUploadStateCopyWith<_FileUploadState> get copyWith => __$FileUploadStateCopyWithImpl<_FileUploadState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FileUploadState&&const DeepCollectionEquality().equals(other._uploads, _uploads)&&const DeepCollectionEquality().equals(other._resolves, _resolves));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_uploads),const DeepCollectionEquality().hash(_resolves));

@override
String toString() {
  return 'FileUploadState(uploads: $uploads, resolves: $resolves)';
}


}

/// @nodoc
abstract mixin class _$FileUploadStateCopyWith<$Res> implements $FileUploadStateCopyWith<$Res> {
  factory _$FileUploadStateCopyWith(_FileUploadState value, $Res Function(_FileUploadState) _then) = __$FileUploadStateCopyWithImpl;
@override @useResult
$Res call({
 Map<String, FileUploadItem> uploads, Map<String, FileResolveItem> resolves
});




}
/// @nodoc
class __$FileUploadStateCopyWithImpl<$Res>
    implements _$FileUploadStateCopyWith<$Res> {
  __$FileUploadStateCopyWithImpl(this._self, this._then);

  final _FileUploadState _self;
  final $Res Function(_FileUploadState) _then;

/// Create a copy of FileUploadState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uploads = null,Object? resolves = null,}) {
  return _then(_FileUploadState(
uploads: null == uploads ? _self._uploads : uploads // ignore: cast_nullable_to_non_nullable
as Map<String, FileUploadItem>,resolves: null == resolves ? _self._resolves : resolves // ignore: cast_nullable_to_non_nullable
as Map<String, FileResolveItem>,
  ));
}


}

// dart format on
