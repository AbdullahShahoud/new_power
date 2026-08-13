// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_stage_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChangeStageRequest {

 ProjectStage get stage; String? get note; int? get expectedVersion;
/// Create a copy of ChangeStageRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeStageRequestCopyWith<ChangeStageRequest> get copyWith => _$ChangeStageRequestCopyWithImpl<ChangeStageRequest>(this as ChangeStageRequest, _$identity);

  /// Serializes this ChangeStageRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeStageRequest&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.note, note) || other.note == note)&&(identical(other.expectedVersion, expectedVersion) || other.expectedVersion == expectedVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stage,note,expectedVersion);

@override
String toString() {
  return 'ChangeStageRequest(stage: $stage, note: $note, expectedVersion: $expectedVersion)';
}


}

/// @nodoc
abstract mixin class $ChangeStageRequestCopyWith<$Res>  {
  factory $ChangeStageRequestCopyWith(ChangeStageRequest value, $Res Function(ChangeStageRequest) _then) = _$ChangeStageRequestCopyWithImpl;
@useResult
$Res call({
 ProjectStage stage, String? note, int? expectedVersion
});




}
/// @nodoc
class _$ChangeStageRequestCopyWithImpl<$Res>
    implements $ChangeStageRequestCopyWith<$Res> {
  _$ChangeStageRequestCopyWithImpl(this._self, this._then);

  final ChangeStageRequest _self;
  final $Res Function(ChangeStageRequest) _then;

/// Create a copy of ChangeStageRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stage = null,Object? note = freezed,Object? expectedVersion = freezed,}) {
  return _then(_self.copyWith(
stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as ProjectStage,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,expectedVersion: freezed == expectedVersion ? _self.expectedVersion : expectedVersion // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChangeStageRequest].
extension ChangeStageRequestPatterns on ChangeStageRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChangeStageRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChangeStageRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChangeStageRequest value)  $default,){
final _that = this;
switch (_that) {
case _ChangeStageRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChangeStageRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ChangeStageRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProjectStage stage,  String? note,  int? expectedVersion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChangeStageRequest() when $default != null:
return $default(_that.stage,_that.note,_that.expectedVersion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProjectStage stage,  String? note,  int? expectedVersion)  $default,) {final _that = this;
switch (_that) {
case _ChangeStageRequest():
return $default(_that.stage,_that.note,_that.expectedVersion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProjectStage stage,  String? note,  int? expectedVersion)?  $default,) {final _that = this;
switch (_that) {
case _ChangeStageRequest() when $default != null:
return $default(_that.stage,_that.note,_that.expectedVersion);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _ChangeStageRequest implements ChangeStageRequest {
  const _ChangeStageRequest({required this.stage, this.note, this.expectedVersion});
  factory _ChangeStageRequest.fromJson(Map<String, dynamic> json) => _$ChangeStageRequestFromJson(json);

@override final  ProjectStage stage;
@override final  String? note;
@override final  int? expectedVersion;

/// Create a copy of ChangeStageRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeStageRequestCopyWith<_ChangeStageRequest> get copyWith => __$ChangeStageRequestCopyWithImpl<_ChangeStageRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChangeStageRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeStageRequest&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.note, note) || other.note == note)&&(identical(other.expectedVersion, expectedVersion) || other.expectedVersion == expectedVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stage,note,expectedVersion);

@override
String toString() {
  return 'ChangeStageRequest(stage: $stage, note: $note, expectedVersion: $expectedVersion)';
}


}

/// @nodoc
abstract mixin class _$ChangeStageRequestCopyWith<$Res> implements $ChangeStageRequestCopyWith<$Res> {
  factory _$ChangeStageRequestCopyWith(_ChangeStageRequest value, $Res Function(_ChangeStageRequest) _then) = __$ChangeStageRequestCopyWithImpl;
@override @useResult
$Res call({
 ProjectStage stage, String? note, int? expectedVersion
});




}
/// @nodoc
class __$ChangeStageRequestCopyWithImpl<$Res>
    implements _$ChangeStageRequestCopyWith<$Res> {
  __$ChangeStageRequestCopyWithImpl(this._self, this._then);

  final _ChangeStageRequest _self;
  final $Res Function(_ChangeStageRequest) _then;

/// Create a copy of ChangeStageRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stage = null,Object? note = freezed,Object? expectedVersion = freezed,}) {
  return _then(_ChangeStageRequest(
stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as ProjectStage,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,expectedVersion: freezed == expectedVersion ? _self.expectedVersion : expectedVersion // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
