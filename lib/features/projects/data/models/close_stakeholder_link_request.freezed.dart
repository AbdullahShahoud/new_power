// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'close_stakeholder_link_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CloseStakeholderLinkRequest {

 String get reason; DateTime? get endedAt;
/// Create a copy of CloseStakeholderLinkRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloseStakeholderLinkRequestCopyWith<CloseStakeholderLinkRequest> get copyWith => _$CloseStakeholderLinkRequestCopyWithImpl<CloseStakeholderLinkRequest>(this as CloseStakeholderLinkRequest, _$identity);

  /// Serializes this CloseStakeholderLinkRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloseStakeholderLinkRequest&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reason,endedAt);

@override
String toString() {
  return 'CloseStakeholderLinkRequest(reason: $reason, endedAt: $endedAt)';
}


}

/// @nodoc
abstract mixin class $CloseStakeholderLinkRequestCopyWith<$Res>  {
  factory $CloseStakeholderLinkRequestCopyWith(CloseStakeholderLinkRequest value, $Res Function(CloseStakeholderLinkRequest) _then) = _$CloseStakeholderLinkRequestCopyWithImpl;
@useResult
$Res call({
 String reason, DateTime? endedAt
});




}
/// @nodoc
class _$CloseStakeholderLinkRequestCopyWithImpl<$Res>
    implements $CloseStakeholderLinkRequestCopyWith<$Res> {
  _$CloseStakeholderLinkRequestCopyWithImpl(this._self, this._then);

  final CloseStakeholderLinkRequest _self;
  final $Res Function(CloseStakeholderLinkRequest) _then;

/// Create a copy of CloseStakeholderLinkRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reason = null,Object? endedAt = freezed,}) {
  return _then(_self.copyWith(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CloseStakeholderLinkRequest].
extension CloseStakeholderLinkRequestPatterns on CloseStakeholderLinkRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloseStakeholderLinkRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloseStakeholderLinkRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloseStakeholderLinkRequest value)  $default,){
final _that = this;
switch (_that) {
case _CloseStakeholderLinkRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloseStakeholderLinkRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CloseStakeholderLinkRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String reason,  DateTime? endedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloseStakeholderLinkRequest() when $default != null:
return $default(_that.reason,_that.endedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String reason,  DateTime? endedAt)  $default,) {final _that = this;
switch (_that) {
case _CloseStakeholderLinkRequest():
return $default(_that.reason,_that.endedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String reason,  DateTime? endedAt)?  $default,) {final _that = this;
switch (_that) {
case _CloseStakeholderLinkRequest() when $default != null:
return $default(_that.reason,_that.endedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CloseStakeholderLinkRequest implements CloseStakeholderLinkRequest {
  const _CloseStakeholderLinkRequest({required this.reason, this.endedAt});
  factory _CloseStakeholderLinkRequest.fromJson(Map<String, dynamic> json) => _$CloseStakeholderLinkRequestFromJson(json);

@override final  String reason;
@override final  DateTime? endedAt;

/// Create a copy of CloseStakeholderLinkRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloseStakeholderLinkRequestCopyWith<_CloseStakeholderLinkRequest> get copyWith => __$CloseStakeholderLinkRequestCopyWithImpl<_CloseStakeholderLinkRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CloseStakeholderLinkRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloseStakeholderLinkRequest&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reason,endedAt);

@override
String toString() {
  return 'CloseStakeholderLinkRequest(reason: $reason, endedAt: $endedAt)';
}


}

/// @nodoc
abstract mixin class _$CloseStakeholderLinkRequestCopyWith<$Res> implements $CloseStakeholderLinkRequestCopyWith<$Res> {
  factory _$CloseStakeholderLinkRequestCopyWith(_CloseStakeholderLinkRequest value, $Res Function(_CloseStakeholderLinkRequest) _then) = __$CloseStakeholderLinkRequestCopyWithImpl;
@override @useResult
$Res call({
 String reason, DateTime? endedAt
});




}
/// @nodoc
class __$CloseStakeholderLinkRequestCopyWithImpl<$Res>
    implements _$CloseStakeholderLinkRequestCopyWith<$Res> {
  __$CloseStakeholderLinkRequestCopyWithImpl(this._self, this._then);

  final _CloseStakeholderLinkRequest _self;
  final $Res Function(_CloseStakeholderLinkRequest) _then;

/// Create a copy of CloseStakeholderLinkRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reason = null,Object? endedAt = freezed,}) {
  return _then(_CloseStakeholderLinkRequest(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
