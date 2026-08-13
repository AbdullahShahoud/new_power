// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set_decision_maker_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SetDecisionMakerRequest {

 String get contactId; String? get reason;
/// Create a copy of SetDecisionMakerRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetDecisionMakerRequestCopyWith<SetDecisionMakerRequest> get copyWith => _$SetDecisionMakerRequestCopyWithImpl<SetDecisionMakerRequest>(this as SetDecisionMakerRequest, _$identity);

  /// Serializes this SetDecisionMakerRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetDecisionMakerRequest&&(identical(other.contactId, contactId) || other.contactId == contactId)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contactId,reason);

@override
String toString() {
  return 'SetDecisionMakerRequest(contactId: $contactId, reason: $reason)';
}


}

/// @nodoc
abstract mixin class $SetDecisionMakerRequestCopyWith<$Res>  {
  factory $SetDecisionMakerRequestCopyWith(SetDecisionMakerRequest value, $Res Function(SetDecisionMakerRequest) _then) = _$SetDecisionMakerRequestCopyWithImpl;
@useResult
$Res call({
 String contactId, String? reason
});




}
/// @nodoc
class _$SetDecisionMakerRequestCopyWithImpl<$Res>
    implements $SetDecisionMakerRequestCopyWith<$Res> {
  _$SetDecisionMakerRequestCopyWithImpl(this._self, this._then);

  final SetDecisionMakerRequest _self;
  final $Res Function(SetDecisionMakerRequest) _then;

/// Create a copy of SetDecisionMakerRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contactId = null,Object? reason = freezed,}) {
  return _then(_self.copyWith(
contactId: null == contactId ? _self.contactId : contactId // ignore: cast_nullable_to_non_nullable
as String,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SetDecisionMakerRequest].
extension SetDecisionMakerRequestPatterns on SetDecisionMakerRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SetDecisionMakerRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SetDecisionMakerRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SetDecisionMakerRequest value)  $default,){
final _that = this;
switch (_that) {
case _SetDecisionMakerRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SetDecisionMakerRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SetDecisionMakerRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String contactId,  String? reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SetDecisionMakerRequest() when $default != null:
return $default(_that.contactId,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String contactId,  String? reason)  $default,) {final _that = this;
switch (_that) {
case _SetDecisionMakerRequest():
return $default(_that.contactId,_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String contactId,  String? reason)?  $default,) {final _that = this;
switch (_that) {
case _SetDecisionMakerRequest() when $default != null:
return $default(_that.contactId,_that.reason);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _SetDecisionMakerRequest implements SetDecisionMakerRequest {
  const _SetDecisionMakerRequest({required this.contactId, this.reason});
  factory _SetDecisionMakerRequest.fromJson(Map<String, dynamic> json) => _$SetDecisionMakerRequestFromJson(json);

@override final  String contactId;
@override final  String? reason;

/// Create a copy of SetDecisionMakerRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetDecisionMakerRequestCopyWith<_SetDecisionMakerRequest> get copyWith => __$SetDecisionMakerRequestCopyWithImpl<_SetDecisionMakerRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SetDecisionMakerRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetDecisionMakerRequest&&(identical(other.contactId, contactId) || other.contactId == contactId)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contactId,reason);

@override
String toString() {
  return 'SetDecisionMakerRequest(contactId: $contactId, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$SetDecisionMakerRequestCopyWith<$Res> implements $SetDecisionMakerRequestCopyWith<$Res> {
  factory _$SetDecisionMakerRequestCopyWith(_SetDecisionMakerRequest value, $Res Function(_SetDecisionMakerRequest) _then) = __$SetDecisionMakerRequestCopyWithImpl;
@override @useResult
$Res call({
 String contactId, String? reason
});




}
/// @nodoc
class __$SetDecisionMakerRequestCopyWithImpl<$Res>
    implements _$SetDecisionMakerRequestCopyWith<$Res> {
  __$SetDecisionMakerRequestCopyWithImpl(this._self, this._then);

  final _SetDecisionMakerRequest _self;
  final $Res Function(_SetDecisionMakerRequest) _then;

/// Create a copy of SetDecisionMakerRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contactId = null,Object? reason = freezed,}) {
  return _then(_SetDecisionMakerRequest(
contactId: null == contactId ? _self.contactId : contactId // ignore: cast_nullable_to_non_nullable
as String,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
