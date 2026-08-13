// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_lost_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubmitLostRequest {

 bool get someoneElseWon; LossReason get reason; double? get competitorPrice; String? get currency; String? get competitorAccountId; String? get narrative; String? get notes;
/// Create a copy of SubmitLostRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmitLostRequestCopyWith<SubmitLostRequest> get copyWith => _$SubmitLostRequestCopyWithImpl<SubmitLostRequest>(this as SubmitLostRequest, _$identity);

  /// Serializes this SubmitLostRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitLostRequest&&(identical(other.someoneElseWon, someoneElseWon) || other.someoneElseWon == someoneElseWon)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.competitorPrice, competitorPrice) || other.competitorPrice == competitorPrice)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.competitorAccountId, competitorAccountId) || other.competitorAccountId == competitorAccountId)&&(identical(other.narrative, narrative) || other.narrative == narrative)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,someoneElseWon,reason,competitorPrice,currency,competitorAccountId,narrative,notes);

@override
String toString() {
  return 'SubmitLostRequest(someoneElseWon: $someoneElseWon, reason: $reason, competitorPrice: $competitorPrice, currency: $currency, competitorAccountId: $competitorAccountId, narrative: $narrative, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $SubmitLostRequestCopyWith<$Res>  {
  factory $SubmitLostRequestCopyWith(SubmitLostRequest value, $Res Function(SubmitLostRequest) _then) = _$SubmitLostRequestCopyWithImpl;
@useResult
$Res call({
 bool someoneElseWon, LossReason reason, double? competitorPrice, String? currency, String? competitorAccountId, String? narrative, String? notes
});




}
/// @nodoc
class _$SubmitLostRequestCopyWithImpl<$Res>
    implements $SubmitLostRequestCopyWith<$Res> {
  _$SubmitLostRequestCopyWithImpl(this._self, this._then);

  final SubmitLostRequest _self;
  final $Res Function(SubmitLostRequest) _then;

/// Create a copy of SubmitLostRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? someoneElseWon = null,Object? reason = null,Object? competitorPrice = freezed,Object? currency = freezed,Object? competitorAccountId = freezed,Object? narrative = freezed,Object? notes = freezed,}) {
  return _then(_self.copyWith(
someoneElseWon: null == someoneElseWon ? _self.someoneElseWon : someoneElseWon // ignore: cast_nullable_to_non_nullable
as bool,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as LossReason,competitorPrice: freezed == competitorPrice ? _self.competitorPrice : competitorPrice // ignore: cast_nullable_to_non_nullable
as double?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,competitorAccountId: freezed == competitorAccountId ? _self.competitorAccountId : competitorAccountId // ignore: cast_nullable_to_non_nullable
as String?,narrative: freezed == narrative ? _self.narrative : narrative // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubmitLostRequest].
extension SubmitLostRequestPatterns on SubmitLostRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubmitLostRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubmitLostRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubmitLostRequest value)  $default,){
final _that = this;
switch (_that) {
case _SubmitLostRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubmitLostRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SubmitLostRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool someoneElseWon,  LossReason reason,  double? competitorPrice,  String? currency,  String? competitorAccountId,  String? narrative,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubmitLostRequest() when $default != null:
return $default(_that.someoneElseWon,_that.reason,_that.competitorPrice,_that.currency,_that.competitorAccountId,_that.narrative,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool someoneElseWon,  LossReason reason,  double? competitorPrice,  String? currency,  String? competitorAccountId,  String? narrative,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _SubmitLostRequest():
return $default(_that.someoneElseWon,_that.reason,_that.competitorPrice,_that.currency,_that.competitorAccountId,_that.narrative,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool someoneElseWon,  LossReason reason,  double? competitorPrice,  String? currency,  String? competitorAccountId,  String? narrative,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _SubmitLostRequest() when $default != null:
return $default(_that.someoneElseWon,_that.reason,_that.competitorPrice,_that.currency,_that.competitorAccountId,_that.narrative,_that.notes);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _SubmitLostRequest implements SubmitLostRequest {
  const _SubmitLostRequest({this.someoneElseWon = true, required this.reason, this.competitorPrice, this.currency, this.competitorAccountId, this.narrative, this.notes});
  factory _SubmitLostRequest.fromJson(Map<String, dynamic> json) => _$SubmitLostRequestFromJson(json);

@override@JsonKey() final  bool someoneElseWon;
@override final  LossReason reason;
@override final  double? competitorPrice;
@override final  String? currency;
@override final  String? competitorAccountId;
@override final  String? narrative;
@override final  String? notes;

/// Create a copy of SubmitLostRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmitLostRequestCopyWith<_SubmitLostRequest> get copyWith => __$SubmitLostRequestCopyWithImpl<_SubmitLostRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubmitLostRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitLostRequest&&(identical(other.someoneElseWon, someoneElseWon) || other.someoneElseWon == someoneElseWon)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.competitorPrice, competitorPrice) || other.competitorPrice == competitorPrice)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.competitorAccountId, competitorAccountId) || other.competitorAccountId == competitorAccountId)&&(identical(other.narrative, narrative) || other.narrative == narrative)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,someoneElseWon,reason,competitorPrice,currency,competitorAccountId,narrative,notes);

@override
String toString() {
  return 'SubmitLostRequest(someoneElseWon: $someoneElseWon, reason: $reason, competitorPrice: $competitorPrice, currency: $currency, competitorAccountId: $competitorAccountId, narrative: $narrative, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$SubmitLostRequestCopyWith<$Res> implements $SubmitLostRequestCopyWith<$Res> {
  factory _$SubmitLostRequestCopyWith(_SubmitLostRequest value, $Res Function(_SubmitLostRequest) _then) = __$SubmitLostRequestCopyWithImpl;
@override @useResult
$Res call({
 bool someoneElseWon, LossReason reason, double? competitorPrice, String? currency, String? competitorAccountId, String? narrative, String? notes
});




}
/// @nodoc
class __$SubmitLostRequestCopyWithImpl<$Res>
    implements _$SubmitLostRequestCopyWith<$Res> {
  __$SubmitLostRequestCopyWithImpl(this._self, this._then);

  final _SubmitLostRequest _self;
  final $Res Function(_SubmitLostRequest) _then;

/// Create a copy of SubmitLostRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? someoneElseWon = null,Object? reason = null,Object? competitorPrice = freezed,Object? currency = freezed,Object? competitorAccountId = freezed,Object? narrative = freezed,Object? notes = freezed,}) {
  return _then(_SubmitLostRequest(
someoneElseWon: null == someoneElseWon ? _self.someoneElseWon : someoneElseWon // ignore: cast_nullable_to_non_nullable
as bool,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as LossReason,competitorPrice: freezed == competitorPrice ? _self.competitorPrice : competitorPrice // ignore: cast_nullable_to_non_nullable
as double?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,competitorAccountId: freezed == competitorAccountId ? _self.competitorAccountId : competitorAccountId // ignore: cast_nullable_to_non_nullable
as String?,narrative: freezed == narrative ? _self.narrative : narrative // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
