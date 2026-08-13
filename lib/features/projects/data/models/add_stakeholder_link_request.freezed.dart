// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_stakeholder_link_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddStakeholderLinkRequest {

 String get accountId; StakeholderRole get role; String? get primaryContactId; String? get note; DateTime? get startedAt;
/// Create a copy of AddStakeholderLinkRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddStakeholderLinkRequestCopyWith<AddStakeholderLinkRequest> get copyWith => _$AddStakeholderLinkRequestCopyWithImpl<AddStakeholderLinkRequest>(this as AddStakeholderLinkRequest, _$identity);

  /// Serializes this AddStakeholderLinkRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddStakeholderLinkRequest&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.role, role) || other.role == role)&&(identical(other.primaryContactId, primaryContactId) || other.primaryContactId == primaryContactId)&&(identical(other.note, note) || other.note == note)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,role,primaryContactId,note,startedAt);

@override
String toString() {
  return 'AddStakeholderLinkRequest(accountId: $accountId, role: $role, primaryContactId: $primaryContactId, note: $note, startedAt: $startedAt)';
}


}

/// @nodoc
abstract mixin class $AddStakeholderLinkRequestCopyWith<$Res>  {
  factory $AddStakeholderLinkRequestCopyWith(AddStakeholderLinkRequest value, $Res Function(AddStakeholderLinkRequest) _then) = _$AddStakeholderLinkRequestCopyWithImpl;
@useResult
$Res call({
 String accountId, StakeholderRole role, String? primaryContactId, String? note, DateTime? startedAt
});




}
/// @nodoc
class _$AddStakeholderLinkRequestCopyWithImpl<$Res>
    implements $AddStakeholderLinkRequestCopyWith<$Res> {
  _$AddStakeholderLinkRequestCopyWithImpl(this._self, this._then);

  final AddStakeholderLinkRequest _self;
  final $Res Function(AddStakeholderLinkRequest) _then;

/// Create a copy of AddStakeholderLinkRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountId = null,Object? role = null,Object? primaryContactId = freezed,Object? note = freezed,Object? startedAt = freezed,}) {
  return _then(_self.copyWith(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as StakeholderRole,primaryContactId: freezed == primaryContactId ? _self.primaryContactId : primaryContactId // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AddStakeholderLinkRequest].
extension AddStakeholderLinkRequestPatterns on AddStakeholderLinkRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddStakeholderLinkRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddStakeholderLinkRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddStakeholderLinkRequest value)  $default,){
final _that = this;
switch (_that) {
case _AddStakeholderLinkRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddStakeholderLinkRequest value)?  $default,){
final _that = this;
switch (_that) {
case _AddStakeholderLinkRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accountId,  StakeholderRole role,  String? primaryContactId,  String? note,  DateTime? startedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddStakeholderLinkRequest() when $default != null:
return $default(_that.accountId,_that.role,_that.primaryContactId,_that.note,_that.startedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accountId,  StakeholderRole role,  String? primaryContactId,  String? note,  DateTime? startedAt)  $default,) {final _that = this;
switch (_that) {
case _AddStakeholderLinkRequest():
return $default(_that.accountId,_that.role,_that.primaryContactId,_that.note,_that.startedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accountId,  StakeholderRole role,  String? primaryContactId,  String? note,  DateTime? startedAt)?  $default,) {final _that = this;
switch (_that) {
case _AddStakeholderLinkRequest() when $default != null:
return $default(_that.accountId,_that.role,_that.primaryContactId,_that.note,_that.startedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false, converters: [UtcDateTimeConverter()])
class _AddStakeholderLinkRequest implements AddStakeholderLinkRequest {
  const _AddStakeholderLinkRequest({required this.accountId, required this.role, this.primaryContactId, this.note, this.startedAt});
  factory _AddStakeholderLinkRequest.fromJson(Map<String, dynamic> json) => _$AddStakeholderLinkRequestFromJson(json);

@override final  String accountId;
@override final  StakeholderRole role;
@override final  String? primaryContactId;
@override final  String? note;
@override final  DateTime? startedAt;

/// Create a copy of AddStakeholderLinkRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddStakeholderLinkRequestCopyWith<_AddStakeholderLinkRequest> get copyWith => __$AddStakeholderLinkRequestCopyWithImpl<_AddStakeholderLinkRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddStakeholderLinkRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddStakeholderLinkRequest&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.role, role) || other.role == role)&&(identical(other.primaryContactId, primaryContactId) || other.primaryContactId == primaryContactId)&&(identical(other.note, note) || other.note == note)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,role,primaryContactId,note,startedAt);

@override
String toString() {
  return 'AddStakeholderLinkRequest(accountId: $accountId, role: $role, primaryContactId: $primaryContactId, note: $note, startedAt: $startedAt)';
}


}

/// @nodoc
abstract mixin class _$AddStakeholderLinkRequestCopyWith<$Res> implements $AddStakeholderLinkRequestCopyWith<$Res> {
  factory _$AddStakeholderLinkRequestCopyWith(_AddStakeholderLinkRequest value, $Res Function(_AddStakeholderLinkRequest) _then) = __$AddStakeholderLinkRequestCopyWithImpl;
@override @useResult
$Res call({
 String accountId, StakeholderRole role, String? primaryContactId, String? note, DateTime? startedAt
});




}
/// @nodoc
class __$AddStakeholderLinkRequestCopyWithImpl<$Res>
    implements _$AddStakeholderLinkRequestCopyWith<$Res> {
  __$AddStakeholderLinkRequestCopyWithImpl(this._self, this._then);

  final _AddStakeholderLinkRequest _self;
  final $Res Function(_AddStakeholderLinkRequest) _then;

/// Create a copy of AddStakeholderLinkRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountId = null,Object? role = null,Object? primaryContactId = freezed,Object? note = freezed,Object? startedAt = freezed,}) {
  return _then(_AddStakeholderLinkRequest(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as StakeholderRole,primaryContactId: freezed == primaryContactId ? _self.primaryContactId : primaryContactId // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
