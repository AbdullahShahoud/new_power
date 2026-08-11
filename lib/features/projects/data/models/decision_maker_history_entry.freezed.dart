// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'decision_maker_history_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DecisionMakerHistoryEntry {

 String get periodId; String get projectId; String get linkId; String get accountId; StakeholderLinkAccountView get account; String get contactId; StakeholderLinkContactView get contact; DateTime get setAt; DateTime? get endedAt; String? get endReason;
/// Create a copy of DecisionMakerHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DecisionMakerHistoryEntryCopyWith<DecisionMakerHistoryEntry> get copyWith => _$DecisionMakerHistoryEntryCopyWithImpl<DecisionMakerHistoryEntry>(this as DecisionMakerHistoryEntry, _$identity);

  /// Serializes this DecisionMakerHistoryEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DecisionMakerHistoryEntry&&(identical(other.periodId, periodId) || other.periodId == periodId)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.linkId, linkId) || other.linkId == linkId)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.account, account) || other.account == account)&&(identical(other.contactId, contactId) || other.contactId == contactId)&&(identical(other.contact, contact) || other.contact == contact)&&(identical(other.setAt, setAt) || other.setAt == setAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.endReason, endReason) || other.endReason == endReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,periodId,projectId,linkId,accountId,account,contactId,contact,setAt,endedAt,endReason);

@override
String toString() {
  return 'DecisionMakerHistoryEntry(periodId: $periodId, projectId: $projectId, linkId: $linkId, accountId: $accountId, account: $account, contactId: $contactId, contact: $contact, setAt: $setAt, endedAt: $endedAt, endReason: $endReason)';
}


}

/// @nodoc
abstract mixin class $DecisionMakerHistoryEntryCopyWith<$Res>  {
  factory $DecisionMakerHistoryEntryCopyWith(DecisionMakerHistoryEntry value, $Res Function(DecisionMakerHistoryEntry) _then) = _$DecisionMakerHistoryEntryCopyWithImpl;
@useResult
$Res call({
 String periodId, String projectId, String linkId, String accountId, StakeholderLinkAccountView account, String contactId, StakeholderLinkContactView contact, DateTime setAt, DateTime? endedAt, String? endReason
});


$StakeholderLinkAccountViewCopyWith<$Res> get account;$StakeholderLinkContactViewCopyWith<$Res> get contact;

}
/// @nodoc
class _$DecisionMakerHistoryEntryCopyWithImpl<$Res>
    implements $DecisionMakerHistoryEntryCopyWith<$Res> {
  _$DecisionMakerHistoryEntryCopyWithImpl(this._self, this._then);

  final DecisionMakerHistoryEntry _self;
  final $Res Function(DecisionMakerHistoryEntry) _then;

/// Create a copy of DecisionMakerHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? periodId = null,Object? projectId = null,Object? linkId = null,Object? accountId = null,Object? account = null,Object? contactId = null,Object? contact = null,Object? setAt = null,Object? endedAt = freezed,Object? endReason = freezed,}) {
  return _then(_self.copyWith(
periodId: null == periodId ? _self.periodId : periodId // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,linkId: null == linkId ? _self.linkId : linkId // ignore: cast_nullable_to_non_nullable
as String,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as StakeholderLinkAccountView,contactId: null == contactId ? _self.contactId : contactId // ignore: cast_nullable_to_non_nullable
as String,contact: null == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as StakeholderLinkContactView,setAt: null == setAt ? _self.setAt : setAt // ignore: cast_nullable_to_non_nullable
as DateTime,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endReason: freezed == endReason ? _self.endReason : endReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of DecisionMakerHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StakeholderLinkAccountViewCopyWith<$Res> get account {
  
  return $StakeholderLinkAccountViewCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}/// Create a copy of DecisionMakerHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StakeholderLinkContactViewCopyWith<$Res> get contact {
  
  return $StakeholderLinkContactViewCopyWith<$Res>(_self.contact, (value) {
    return _then(_self.copyWith(contact: value));
  });
}
}


/// Adds pattern-matching-related methods to [DecisionMakerHistoryEntry].
extension DecisionMakerHistoryEntryPatterns on DecisionMakerHistoryEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DecisionMakerHistoryEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DecisionMakerHistoryEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DecisionMakerHistoryEntry value)  $default,){
final _that = this;
switch (_that) {
case _DecisionMakerHistoryEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DecisionMakerHistoryEntry value)?  $default,){
final _that = this;
switch (_that) {
case _DecisionMakerHistoryEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String periodId,  String projectId,  String linkId,  String accountId,  StakeholderLinkAccountView account,  String contactId,  StakeholderLinkContactView contact,  DateTime setAt,  DateTime? endedAt,  String? endReason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DecisionMakerHistoryEntry() when $default != null:
return $default(_that.periodId,_that.projectId,_that.linkId,_that.accountId,_that.account,_that.contactId,_that.contact,_that.setAt,_that.endedAt,_that.endReason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String periodId,  String projectId,  String linkId,  String accountId,  StakeholderLinkAccountView account,  String contactId,  StakeholderLinkContactView contact,  DateTime setAt,  DateTime? endedAt,  String? endReason)  $default,) {final _that = this;
switch (_that) {
case _DecisionMakerHistoryEntry():
return $default(_that.periodId,_that.projectId,_that.linkId,_that.accountId,_that.account,_that.contactId,_that.contact,_that.setAt,_that.endedAt,_that.endReason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String periodId,  String projectId,  String linkId,  String accountId,  StakeholderLinkAccountView account,  String contactId,  StakeholderLinkContactView contact,  DateTime setAt,  DateTime? endedAt,  String? endReason)?  $default,) {final _that = this;
switch (_that) {
case _DecisionMakerHistoryEntry() when $default != null:
return $default(_that.periodId,_that.projectId,_that.linkId,_that.accountId,_that.account,_that.contactId,_that.contact,_that.setAt,_that.endedAt,_that.endReason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DecisionMakerHistoryEntry implements DecisionMakerHistoryEntry {
  const _DecisionMakerHistoryEntry({required this.periodId, required this.projectId, required this.linkId, required this.accountId, required this.account, required this.contactId, required this.contact, required this.setAt, this.endedAt, this.endReason});
  factory _DecisionMakerHistoryEntry.fromJson(Map<String, dynamic> json) => _$DecisionMakerHistoryEntryFromJson(json);

@override final  String periodId;
@override final  String projectId;
@override final  String linkId;
@override final  String accountId;
@override final  StakeholderLinkAccountView account;
@override final  String contactId;
@override final  StakeholderLinkContactView contact;
@override final  DateTime setAt;
@override final  DateTime? endedAt;
@override final  String? endReason;

/// Create a copy of DecisionMakerHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DecisionMakerHistoryEntryCopyWith<_DecisionMakerHistoryEntry> get copyWith => __$DecisionMakerHistoryEntryCopyWithImpl<_DecisionMakerHistoryEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DecisionMakerHistoryEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DecisionMakerHistoryEntry&&(identical(other.periodId, periodId) || other.periodId == periodId)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.linkId, linkId) || other.linkId == linkId)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.account, account) || other.account == account)&&(identical(other.contactId, contactId) || other.contactId == contactId)&&(identical(other.contact, contact) || other.contact == contact)&&(identical(other.setAt, setAt) || other.setAt == setAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.endReason, endReason) || other.endReason == endReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,periodId,projectId,linkId,accountId,account,contactId,contact,setAt,endedAt,endReason);

@override
String toString() {
  return 'DecisionMakerHistoryEntry(periodId: $periodId, projectId: $projectId, linkId: $linkId, accountId: $accountId, account: $account, contactId: $contactId, contact: $contact, setAt: $setAt, endedAt: $endedAt, endReason: $endReason)';
}


}

/// @nodoc
abstract mixin class _$DecisionMakerHistoryEntryCopyWith<$Res> implements $DecisionMakerHistoryEntryCopyWith<$Res> {
  factory _$DecisionMakerHistoryEntryCopyWith(_DecisionMakerHistoryEntry value, $Res Function(_DecisionMakerHistoryEntry) _then) = __$DecisionMakerHistoryEntryCopyWithImpl;
@override @useResult
$Res call({
 String periodId, String projectId, String linkId, String accountId, StakeholderLinkAccountView account, String contactId, StakeholderLinkContactView contact, DateTime setAt, DateTime? endedAt, String? endReason
});


@override $StakeholderLinkAccountViewCopyWith<$Res> get account;@override $StakeholderLinkContactViewCopyWith<$Res> get contact;

}
/// @nodoc
class __$DecisionMakerHistoryEntryCopyWithImpl<$Res>
    implements _$DecisionMakerHistoryEntryCopyWith<$Res> {
  __$DecisionMakerHistoryEntryCopyWithImpl(this._self, this._then);

  final _DecisionMakerHistoryEntry _self;
  final $Res Function(_DecisionMakerHistoryEntry) _then;

/// Create a copy of DecisionMakerHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? periodId = null,Object? projectId = null,Object? linkId = null,Object? accountId = null,Object? account = null,Object? contactId = null,Object? contact = null,Object? setAt = null,Object? endedAt = freezed,Object? endReason = freezed,}) {
  return _then(_DecisionMakerHistoryEntry(
periodId: null == periodId ? _self.periodId : periodId // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,linkId: null == linkId ? _self.linkId : linkId // ignore: cast_nullable_to_non_nullable
as String,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as StakeholderLinkAccountView,contactId: null == contactId ? _self.contactId : contactId // ignore: cast_nullable_to_non_nullable
as String,contact: null == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as StakeholderLinkContactView,setAt: null == setAt ? _self.setAt : setAt // ignore: cast_nullable_to_non_nullable
as DateTime,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endReason: freezed == endReason ? _self.endReason : endReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of DecisionMakerHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StakeholderLinkAccountViewCopyWith<$Res> get account {
  
  return $StakeholderLinkAccountViewCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}/// Create a copy of DecisionMakerHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StakeholderLinkContactViewCopyWith<$Res> get contact {
  
  return $StakeholderLinkContactViewCopyWith<$Res>(_self.contact, (value) {
    return _then(_self.copyWith(contact: value));
  });
}
}

// dart format on
