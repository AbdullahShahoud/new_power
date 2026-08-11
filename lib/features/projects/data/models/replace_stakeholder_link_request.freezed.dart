// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'replace_stakeholder_link_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReplaceStakeholderLinkRequest {

 String get newAccountId; String? get newPrimaryContactId; String? get note; String get reason;
/// Create a copy of ReplaceStakeholderLinkRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReplaceStakeholderLinkRequestCopyWith<ReplaceStakeholderLinkRequest> get copyWith => _$ReplaceStakeholderLinkRequestCopyWithImpl<ReplaceStakeholderLinkRequest>(this as ReplaceStakeholderLinkRequest, _$identity);

  /// Serializes this ReplaceStakeholderLinkRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReplaceStakeholderLinkRequest&&(identical(other.newAccountId, newAccountId) || other.newAccountId == newAccountId)&&(identical(other.newPrimaryContactId, newPrimaryContactId) || other.newPrimaryContactId == newPrimaryContactId)&&(identical(other.note, note) || other.note == note)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,newAccountId,newPrimaryContactId,note,reason);

@override
String toString() {
  return 'ReplaceStakeholderLinkRequest(newAccountId: $newAccountId, newPrimaryContactId: $newPrimaryContactId, note: $note, reason: $reason)';
}


}

/// @nodoc
abstract mixin class $ReplaceStakeholderLinkRequestCopyWith<$Res>  {
  factory $ReplaceStakeholderLinkRequestCopyWith(ReplaceStakeholderLinkRequest value, $Res Function(ReplaceStakeholderLinkRequest) _then) = _$ReplaceStakeholderLinkRequestCopyWithImpl;
@useResult
$Res call({
 String newAccountId, String? newPrimaryContactId, String? note, String reason
});




}
/// @nodoc
class _$ReplaceStakeholderLinkRequestCopyWithImpl<$Res>
    implements $ReplaceStakeholderLinkRequestCopyWith<$Res> {
  _$ReplaceStakeholderLinkRequestCopyWithImpl(this._self, this._then);

  final ReplaceStakeholderLinkRequest _self;
  final $Res Function(ReplaceStakeholderLinkRequest) _then;

/// Create a copy of ReplaceStakeholderLinkRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? newAccountId = null,Object? newPrimaryContactId = freezed,Object? note = freezed,Object? reason = null,}) {
  return _then(_self.copyWith(
newAccountId: null == newAccountId ? _self.newAccountId : newAccountId // ignore: cast_nullable_to_non_nullable
as String,newPrimaryContactId: freezed == newPrimaryContactId ? _self.newPrimaryContactId : newPrimaryContactId // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ReplaceStakeholderLinkRequest].
extension ReplaceStakeholderLinkRequestPatterns on ReplaceStakeholderLinkRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReplaceStakeholderLinkRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReplaceStakeholderLinkRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReplaceStakeholderLinkRequest value)  $default,){
final _that = this;
switch (_that) {
case _ReplaceStakeholderLinkRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReplaceStakeholderLinkRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ReplaceStakeholderLinkRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String newAccountId,  String? newPrimaryContactId,  String? note,  String reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReplaceStakeholderLinkRequest() when $default != null:
return $default(_that.newAccountId,_that.newPrimaryContactId,_that.note,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String newAccountId,  String? newPrimaryContactId,  String? note,  String reason)  $default,) {final _that = this;
switch (_that) {
case _ReplaceStakeholderLinkRequest():
return $default(_that.newAccountId,_that.newPrimaryContactId,_that.note,_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String newAccountId,  String? newPrimaryContactId,  String? note,  String reason)?  $default,) {final _that = this;
switch (_that) {
case _ReplaceStakeholderLinkRequest() when $default != null:
return $default(_that.newAccountId,_that.newPrimaryContactId,_that.note,_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReplaceStakeholderLinkRequest implements ReplaceStakeholderLinkRequest {
  const _ReplaceStakeholderLinkRequest({required this.newAccountId, this.newPrimaryContactId, this.note, required this.reason});
  factory _ReplaceStakeholderLinkRequest.fromJson(Map<String, dynamic> json) => _$ReplaceStakeholderLinkRequestFromJson(json);

@override final  String newAccountId;
@override final  String? newPrimaryContactId;
@override final  String? note;
@override final  String reason;

/// Create a copy of ReplaceStakeholderLinkRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReplaceStakeholderLinkRequestCopyWith<_ReplaceStakeholderLinkRequest> get copyWith => __$ReplaceStakeholderLinkRequestCopyWithImpl<_ReplaceStakeholderLinkRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReplaceStakeholderLinkRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReplaceStakeholderLinkRequest&&(identical(other.newAccountId, newAccountId) || other.newAccountId == newAccountId)&&(identical(other.newPrimaryContactId, newPrimaryContactId) || other.newPrimaryContactId == newPrimaryContactId)&&(identical(other.note, note) || other.note == note)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,newAccountId,newPrimaryContactId,note,reason);

@override
String toString() {
  return 'ReplaceStakeholderLinkRequest(newAccountId: $newAccountId, newPrimaryContactId: $newPrimaryContactId, note: $note, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$ReplaceStakeholderLinkRequestCopyWith<$Res> implements $ReplaceStakeholderLinkRequestCopyWith<$Res> {
  factory _$ReplaceStakeholderLinkRequestCopyWith(_ReplaceStakeholderLinkRequest value, $Res Function(_ReplaceStakeholderLinkRequest) _then) = __$ReplaceStakeholderLinkRequestCopyWithImpl;
@override @useResult
$Res call({
 String newAccountId, String? newPrimaryContactId, String? note, String reason
});




}
/// @nodoc
class __$ReplaceStakeholderLinkRequestCopyWithImpl<$Res>
    implements _$ReplaceStakeholderLinkRequestCopyWith<$Res> {
  __$ReplaceStakeholderLinkRequestCopyWithImpl(this._self, this._then);

  final _ReplaceStakeholderLinkRequest _self;
  final $Res Function(_ReplaceStakeholderLinkRequest) _then;

/// Create a copy of ReplaceStakeholderLinkRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? newAccountId = null,Object? newPrimaryContactId = freezed,Object? note = freezed,Object? reason = null,}) {
  return _then(_ReplaceStakeholderLinkRequest(
newAccountId: null == newAccountId ? _self.newAccountId : newAccountId // ignore: cast_nullable_to_non_nullable
as String,newPrimaryContactId: freezed == newPrimaryContactId ? _self.newPrimaryContactId : newPrimaryContactId // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
