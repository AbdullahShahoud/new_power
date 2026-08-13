// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_status_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChangeStatusRequest {

 ProjectStatus get status; String get reason; int? get expectedVersion;
/// Create a copy of ChangeStatusRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeStatusRequestCopyWith<ChangeStatusRequest> get copyWith => _$ChangeStatusRequestCopyWithImpl<ChangeStatusRequest>(this as ChangeStatusRequest, _$identity);

  /// Serializes this ChangeStatusRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeStatusRequest&&(identical(other.status, status) || other.status == status)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.expectedVersion, expectedVersion) || other.expectedVersion == expectedVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,reason,expectedVersion);

@override
String toString() {
  return 'ChangeStatusRequest(status: $status, reason: $reason, expectedVersion: $expectedVersion)';
}


}

/// @nodoc
abstract mixin class $ChangeStatusRequestCopyWith<$Res>  {
  factory $ChangeStatusRequestCopyWith(ChangeStatusRequest value, $Res Function(ChangeStatusRequest) _then) = _$ChangeStatusRequestCopyWithImpl;
@useResult
$Res call({
 ProjectStatus status, String reason, int? expectedVersion
});




}
/// @nodoc
class _$ChangeStatusRequestCopyWithImpl<$Res>
    implements $ChangeStatusRequestCopyWith<$Res> {
  _$ChangeStatusRequestCopyWithImpl(this._self, this._then);

  final ChangeStatusRequest _self;
  final $Res Function(ChangeStatusRequest) _then;

/// Create a copy of ChangeStatusRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? reason = null,Object? expectedVersion = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,expectedVersion: freezed == expectedVersion ? _self.expectedVersion : expectedVersion // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChangeStatusRequest].
extension ChangeStatusRequestPatterns on ChangeStatusRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChangeStatusRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChangeStatusRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChangeStatusRequest value)  $default,){
final _that = this;
switch (_that) {
case _ChangeStatusRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChangeStatusRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ChangeStatusRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProjectStatus status,  String reason,  int? expectedVersion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChangeStatusRequest() when $default != null:
return $default(_that.status,_that.reason,_that.expectedVersion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProjectStatus status,  String reason,  int? expectedVersion)  $default,) {final _that = this;
switch (_that) {
case _ChangeStatusRequest():
return $default(_that.status,_that.reason,_that.expectedVersion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProjectStatus status,  String reason,  int? expectedVersion)?  $default,) {final _that = this;
switch (_that) {
case _ChangeStatusRequest() when $default != null:
return $default(_that.status,_that.reason,_that.expectedVersion);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _ChangeStatusRequest implements ChangeStatusRequest {
  const _ChangeStatusRequest({required this.status, required this.reason, this.expectedVersion});
  factory _ChangeStatusRequest.fromJson(Map<String, dynamic> json) => _$ChangeStatusRequestFromJson(json);

@override final  ProjectStatus status;
@override final  String reason;
@override final  int? expectedVersion;

/// Create a copy of ChangeStatusRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeStatusRequestCopyWith<_ChangeStatusRequest> get copyWith => __$ChangeStatusRequestCopyWithImpl<_ChangeStatusRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChangeStatusRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeStatusRequest&&(identical(other.status, status) || other.status == status)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.expectedVersion, expectedVersion) || other.expectedVersion == expectedVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,reason,expectedVersion);

@override
String toString() {
  return 'ChangeStatusRequest(status: $status, reason: $reason, expectedVersion: $expectedVersion)';
}


}

/// @nodoc
abstract mixin class _$ChangeStatusRequestCopyWith<$Res> implements $ChangeStatusRequestCopyWith<$Res> {
  factory _$ChangeStatusRequestCopyWith(_ChangeStatusRequest value, $Res Function(_ChangeStatusRequest) _then) = __$ChangeStatusRequestCopyWithImpl;
@override @useResult
$Res call({
 ProjectStatus status, String reason, int? expectedVersion
});




}
/// @nodoc
class __$ChangeStatusRequestCopyWithImpl<$Res>
    implements _$ChangeStatusRequestCopyWith<$Res> {
  __$ChangeStatusRequestCopyWithImpl(this._self, this._then);

  final _ChangeStatusRequest _self;
  final $Res Function(_ChangeStatusRequest) _then;

/// Create a copy of ChangeStatusRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? reason = null,Object? expectedVersion = freezed,}) {
  return _then(_ChangeStatusRequest(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,expectedVersion: freezed == expectedVersion ? _self.expectedVersion : expectedVersion // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
