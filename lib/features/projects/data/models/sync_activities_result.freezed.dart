// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_activities_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SyncActivityItemResult {

 String get clientRef; SyncItemStatus get status; String? get activityId; SyncActivityItemError? get error;
/// Create a copy of SyncActivityItemResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncActivityItemResultCopyWith<SyncActivityItemResult> get copyWith => _$SyncActivityItemResultCopyWithImpl<SyncActivityItemResult>(this as SyncActivityItemResult, _$identity);

  /// Serializes this SyncActivityItemResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncActivityItemResult&&(identical(other.clientRef, clientRef) || other.clientRef == clientRef)&&(identical(other.status, status) || other.status == status)&&(identical(other.activityId, activityId) || other.activityId == activityId)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientRef,status,activityId,error);

@override
String toString() {
  return 'SyncActivityItemResult(clientRef: $clientRef, status: $status, activityId: $activityId, error: $error)';
}


}

/// @nodoc
abstract mixin class $SyncActivityItemResultCopyWith<$Res>  {
  factory $SyncActivityItemResultCopyWith(SyncActivityItemResult value, $Res Function(SyncActivityItemResult) _then) = _$SyncActivityItemResultCopyWithImpl;
@useResult
$Res call({
 String clientRef, SyncItemStatus status, String? activityId, SyncActivityItemError? error
});


$SyncActivityItemErrorCopyWith<$Res>? get error;

}
/// @nodoc
class _$SyncActivityItemResultCopyWithImpl<$Res>
    implements $SyncActivityItemResultCopyWith<$Res> {
  _$SyncActivityItemResultCopyWithImpl(this._self, this._then);

  final SyncActivityItemResult _self;
  final $Res Function(SyncActivityItemResult) _then;

/// Create a copy of SyncActivityItemResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clientRef = null,Object? status = null,Object? activityId = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
clientRef: null == clientRef ? _self.clientRef : clientRef // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SyncItemStatus,activityId: freezed == activityId ? _self.activityId : activityId // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as SyncActivityItemError?,
  ));
}
/// Create a copy of SyncActivityItemResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SyncActivityItemErrorCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $SyncActivityItemErrorCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// Adds pattern-matching-related methods to [SyncActivityItemResult].
extension SyncActivityItemResultPatterns on SyncActivityItemResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SyncActivityItemResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SyncActivityItemResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SyncActivityItemResult value)  $default,){
final _that = this;
switch (_that) {
case _SyncActivityItemResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SyncActivityItemResult value)?  $default,){
final _that = this;
switch (_that) {
case _SyncActivityItemResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String clientRef,  SyncItemStatus status,  String? activityId,  SyncActivityItemError? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SyncActivityItemResult() when $default != null:
return $default(_that.clientRef,_that.status,_that.activityId,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String clientRef,  SyncItemStatus status,  String? activityId,  SyncActivityItemError? error)  $default,) {final _that = this;
switch (_that) {
case _SyncActivityItemResult():
return $default(_that.clientRef,_that.status,_that.activityId,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String clientRef,  SyncItemStatus status,  String? activityId,  SyncActivityItemError? error)?  $default,) {final _that = this;
switch (_that) {
case _SyncActivityItemResult() when $default != null:
return $default(_that.clientRef,_that.status,_that.activityId,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SyncActivityItemResult implements SyncActivityItemResult {
  const _SyncActivityItemResult({required this.clientRef, required this.status, this.activityId, this.error});
  factory _SyncActivityItemResult.fromJson(Map<String, dynamic> json) => _$SyncActivityItemResultFromJson(json);

@override final  String clientRef;
@override final  SyncItemStatus status;
@override final  String? activityId;
@override final  SyncActivityItemError? error;

/// Create a copy of SyncActivityItemResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SyncActivityItemResultCopyWith<_SyncActivityItemResult> get copyWith => __$SyncActivityItemResultCopyWithImpl<_SyncActivityItemResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SyncActivityItemResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncActivityItemResult&&(identical(other.clientRef, clientRef) || other.clientRef == clientRef)&&(identical(other.status, status) || other.status == status)&&(identical(other.activityId, activityId) || other.activityId == activityId)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientRef,status,activityId,error);

@override
String toString() {
  return 'SyncActivityItemResult(clientRef: $clientRef, status: $status, activityId: $activityId, error: $error)';
}


}

/// @nodoc
abstract mixin class _$SyncActivityItemResultCopyWith<$Res> implements $SyncActivityItemResultCopyWith<$Res> {
  factory _$SyncActivityItemResultCopyWith(_SyncActivityItemResult value, $Res Function(_SyncActivityItemResult) _then) = __$SyncActivityItemResultCopyWithImpl;
@override @useResult
$Res call({
 String clientRef, SyncItemStatus status, String? activityId, SyncActivityItemError? error
});


@override $SyncActivityItemErrorCopyWith<$Res>? get error;

}
/// @nodoc
class __$SyncActivityItemResultCopyWithImpl<$Res>
    implements _$SyncActivityItemResultCopyWith<$Res> {
  __$SyncActivityItemResultCopyWithImpl(this._self, this._then);

  final _SyncActivityItemResult _self;
  final $Res Function(_SyncActivityItemResult) _then;

/// Create a copy of SyncActivityItemResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clientRef = null,Object? status = null,Object? activityId = freezed,Object? error = freezed,}) {
  return _then(_SyncActivityItemResult(
clientRef: null == clientRef ? _self.clientRef : clientRef // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SyncItemStatus,activityId: freezed == activityId ? _self.activityId : activityId // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as SyncActivityItemError?,
  ));
}

/// Create a copy of SyncActivityItemResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SyncActivityItemErrorCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $SyncActivityItemErrorCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// @nodoc
mixin _$SyncActivityItemError {

 String get code; String get message;
/// Create a copy of SyncActivityItemError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncActivityItemErrorCopyWith<SyncActivityItemError> get copyWith => _$SyncActivityItemErrorCopyWithImpl<SyncActivityItemError>(this as SyncActivityItemError, _$identity);

  /// Serializes this SyncActivityItemError to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncActivityItemError&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message);

@override
String toString() {
  return 'SyncActivityItemError(code: $code, message: $message)';
}


}

/// @nodoc
abstract mixin class $SyncActivityItemErrorCopyWith<$Res>  {
  factory $SyncActivityItemErrorCopyWith(SyncActivityItemError value, $Res Function(SyncActivityItemError) _then) = _$SyncActivityItemErrorCopyWithImpl;
@useResult
$Res call({
 String code, String message
});




}
/// @nodoc
class _$SyncActivityItemErrorCopyWithImpl<$Res>
    implements $SyncActivityItemErrorCopyWith<$Res> {
  _$SyncActivityItemErrorCopyWithImpl(this._self, this._then);

  final SyncActivityItemError _self;
  final $Res Function(SyncActivityItemError) _then;

/// Create a copy of SyncActivityItemError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? message = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SyncActivityItemError].
extension SyncActivityItemErrorPatterns on SyncActivityItemError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SyncActivityItemError value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SyncActivityItemError() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SyncActivityItemError value)  $default,){
final _that = this;
switch (_that) {
case _SyncActivityItemError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SyncActivityItemError value)?  $default,){
final _that = this;
switch (_that) {
case _SyncActivityItemError() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SyncActivityItemError() when $default != null:
return $default(_that.code,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String message)  $default,) {final _that = this;
switch (_that) {
case _SyncActivityItemError():
return $default(_that.code,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String message)?  $default,) {final _that = this;
switch (_that) {
case _SyncActivityItemError() when $default != null:
return $default(_that.code,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SyncActivityItemError implements SyncActivityItemError {
  const _SyncActivityItemError({required this.code, required this.message});
  factory _SyncActivityItemError.fromJson(Map<String, dynamic> json) => _$SyncActivityItemErrorFromJson(json);

@override final  String code;
@override final  String message;

/// Create a copy of SyncActivityItemError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SyncActivityItemErrorCopyWith<_SyncActivityItemError> get copyWith => __$SyncActivityItemErrorCopyWithImpl<_SyncActivityItemError>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SyncActivityItemErrorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncActivityItemError&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message);

@override
String toString() {
  return 'SyncActivityItemError(code: $code, message: $message)';
}


}

/// @nodoc
abstract mixin class _$SyncActivityItemErrorCopyWith<$Res> implements $SyncActivityItemErrorCopyWith<$Res> {
  factory _$SyncActivityItemErrorCopyWith(_SyncActivityItemError value, $Res Function(_SyncActivityItemError) _then) = __$SyncActivityItemErrorCopyWithImpl;
@override @useResult
$Res call({
 String code, String message
});




}
/// @nodoc
class __$SyncActivityItemErrorCopyWithImpl<$Res>
    implements _$SyncActivityItemErrorCopyWith<$Res> {
  __$SyncActivityItemErrorCopyWithImpl(this._self, this._then);

  final _SyncActivityItemError _self;
  final $Res Function(_SyncActivityItemError) _then;

/// Create a copy of SyncActivityItemError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = null,}) {
  return _then(_SyncActivityItemError(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SyncActivitiesResult {

 List<SyncActivityItemResult> get results; int get created; int get duplicates; int get rejected;
/// Create a copy of SyncActivitiesResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncActivitiesResultCopyWith<SyncActivitiesResult> get copyWith => _$SyncActivitiesResultCopyWithImpl<SyncActivitiesResult>(this as SyncActivitiesResult, _$identity);

  /// Serializes this SyncActivitiesResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncActivitiesResult&&const DeepCollectionEquality().equals(other.results, results)&&(identical(other.created, created) || other.created == created)&&(identical(other.duplicates, duplicates) || other.duplicates == duplicates)&&(identical(other.rejected, rejected) || other.rejected == rejected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(results),created,duplicates,rejected);

@override
String toString() {
  return 'SyncActivitiesResult(results: $results, created: $created, duplicates: $duplicates, rejected: $rejected)';
}


}

/// @nodoc
abstract mixin class $SyncActivitiesResultCopyWith<$Res>  {
  factory $SyncActivitiesResultCopyWith(SyncActivitiesResult value, $Res Function(SyncActivitiesResult) _then) = _$SyncActivitiesResultCopyWithImpl;
@useResult
$Res call({
 List<SyncActivityItemResult> results, int created, int duplicates, int rejected
});




}
/// @nodoc
class _$SyncActivitiesResultCopyWithImpl<$Res>
    implements $SyncActivitiesResultCopyWith<$Res> {
  _$SyncActivitiesResultCopyWithImpl(this._self, this._then);

  final SyncActivitiesResult _self;
  final $Res Function(SyncActivitiesResult) _then;

/// Create a copy of SyncActivitiesResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? results = null,Object? created = null,Object? duplicates = null,Object? rejected = null,}) {
  return _then(_self.copyWith(
results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<SyncActivityItemResult>,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as int,duplicates: null == duplicates ? _self.duplicates : duplicates // ignore: cast_nullable_to_non_nullable
as int,rejected: null == rejected ? _self.rejected : rejected // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SyncActivitiesResult].
extension SyncActivitiesResultPatterns on SyncActivitiesResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SyncActivitiesResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SyncActivitiesResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SyncActivitiesResult value)  $default,){
final _that = this;
switch (_that) {
case _SyncActivitiesResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SyncActivitiesResult value)?  $default,){
final _that = this;
switch (_that) {
case _SyncActivitiesResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SyncActivityItemResult> results,  int created,  int duplicates,  int rejected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SyncActivitiesResult() when $default != null:
return $default(_that.results,_that.created,_that.duplicates,_that.rejected);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SyncActivityItemResult> results,  int created,  int duplicates,  int rejected)  $default,) {final _that = this;
switch (_that) {
case _SyncActivitiesResult():
return $default(_that.results,_that.created,_that.duplicates,_that.rejected);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SyncActivityItemResult> results,  int created,  int duplicates,  int rejected)?  $default,) {final _that = this;
switch (_that) {
case _SyncActivitiesResult() when $default != null:
return $default(_that.results,_that.created,_that.duplicates,_that.rejected);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SyncActivitiesResult implements SyncActivitiesResult {
  const _SyncActivitiesResult({final  List<SyncActivityItemResult> results = const <SyncActivityItemResult>[], required this.created, required this.duplicates, required this.rejected}): _results = results;
  factory _SyncActivitiesResult.fromJson(Map<String, dynamic> json) => _$SyncActivitiesResultFromJson(json);

 final  List<SyncActivityItemResult> _results;
@override@JsonKey() List<SyncActivityItemResult> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}

@override final  int created;
@override final  int duplicates;
@override final  int rejected;

/// Create a copy of SyncActivitiesResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SyncActivitiesResultCopyWith<_SyncActivitiesResult> get copyWith => __$SyncActivitiesResultCopyWithImpl<_SyncActivitiesResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SyncActivitiesResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncActivitiesResult&&const DeepCollectionEquality().equals(other._results, _results)&&(identical(other.created, created) || other.created == created)&&(identical(other.duplicates, duplicates) || other.duplicates == duplicates)&&(identical(other.rejected, rejected) || other.rejected == rejected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_results),created,duplicates,rejected);

@override
String toString() {
  return 'SyncActivitiesResult(results: $results, created: $created, duplicates: $duplicates, rejected: $rejected)';
}


}

/// @nodoc
abstract mixin class _$SyncActivitiesResultCopyWith<$Res> implements $SyncActivitiesResultCopyWith<$Res> {
  factory _$SyncActivitiesResultCopyWith(_SyncActivitiesResult value, $Res Function(_SyncActivitiesResult) _then) = __$SyncActivitiesResultCopyWithImpl;
@override @useResult
$Res call({
 List<SyncActivityItemResult> results, int created, int duplicates, int rejected
});




}
/// @nodoc
class __$SyncActivitiesResultCopyWithImpl<$Res>
    implements _$SyncActivitiesResultCopyWith<$Res> {
  __$SyncActivitiesResultCopyWithImpl(this._self, this._then);

  final _SyncActivitiesResult _self;
  final $Res Function(_SyncActivitiesResult) _then;

/// Create a copy of SyncActivitiesResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? results = null,Object? created = null,Object? duplicates = null,Object? rejected = null,}) {
  return _then(_SyncActivitiesResult(
results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<SyncActivityItemResult>,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as int,duplicates: null == duplicates ? _self.duplicates : duplicates // ignore: cast_nullable_to_non_nullable
as int,rejected: null == rejected ? _self.rejected : rejected // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
