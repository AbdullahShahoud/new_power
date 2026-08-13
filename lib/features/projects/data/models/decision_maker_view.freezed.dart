// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'decision_maker_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DecisionMakerView {

 String get periodId; String get projectId; String get linkId; String get accountId; StakeholderLinkAccountView get account; String get contactId; StakeholderLinkContactView get contact; DateTime get setAt;
/// Create a copy of DecisionMakerView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DecisionMakerViewCopyWith<DecisionMakerView> get copyWith => _$DecisionMakerViewCopyWithImpl<DecisionMakerView>(this as DecisionMakerView, _$identity);

  /// Serializes this DecisionMakerView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DecisionMakerView&&(identical(other.periodId, periodId) || other.periodId == periodId)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.linkId, linkId) || other.linkId == linkId)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.account, account) || other.account == account)&&(identical(other.contactId, contactId) || other.contactId == contactId)&&(identical(other.contact, contact) || other.contact == contact)&&(identical(other.setAt, setAt) || other.setAt == setAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,periodId,projectId,linkId,accountId,account,contactId,contact,setAt);

@override
String toString() {
  return 'DecisionMakerView(periodId: $periodId, projectId: $projectId, linkId: $linkId, accountId: $accountId, account: $account, contactId: $contactId, contact: $contact, setAt: $setAt)';
}


}

/// @nodoc
abstract mixin class $DecisionMakerViewCopyWith<$Res>  {
  factory $DecisionMakerViewCopyWith(DecisionMakerView value, $Res Function(DecisionMakerView) _then) = _$DecisionMakerViewCopyWithImpl;
@useResult
$Res call({
 String periodId, String projectId, String linkId, String accountId, StakeholderLinkAccountView account, String contactId, StakeholderLinkContactView contact, DateTime setAt
});


$StakeholderLinkAccountViewCopyWith<$Res> get account;$StakeholderLinkContactViewCopyWith<$Res> get contact;

}
/// @nodoc
class _$DecisionMakerViewCopyWithImpl<$Res>
    implements $DecisionMakerViewCopyWith<$Res> {
  _$DecisionMakerViewCopyWithImpl(this._self, this._then);

  final DecisionMakerView _self;
  final $Res Function(DecisionMakerView) _then;

/// Create a copy of DecisionMakerView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? periodId = null,Object? projectId = null,Object? linkId = null,Object? accountId = null,Object? account = null,Object? contactId = null,Object? contact = null,Object? setAt = null,}) {
  return _then(_self.copyWith(
periodId: null == periodId ? _self.periodId : periodId // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,linkId: null == linkId ? _self.linkId : linkId // ignore: cast_nullable_to_non_nullable
as String,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as StakeholderLinkAccountView,contactId: null == contactId ? _self.contactId : contactId // ignore: cast_nullable_to_non_nullable
as String,contact: null == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as StakeholderLinkContactView,setAt: null == setAt ? _self.setAt : setAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of DecisionMakerView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StakeholderLinkAccountViewCopyWith<$Res> get account {
  
  return $StakeholderLinkAccountViewCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}/// Create a copy of DecisionMakerView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StakeholderLinkContactViewCopyWith<$Res> get contact {
  
  return $StakeholderLinkContactViewCopyWith<$Res>(_self.contact, (value) {
    return _then(_self.copyWith(contact: value));
  });
}
}


/// Adds pattern-matching-related methods to [DecisionMakerView].
extension DecisionMakerViewPatterns on DecisionMakerView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DecisionMakerView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DecisionMakerView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DecisionMakerView value)  $default,){
final _that = this;
switch (_that) {
case _DecisionMakerView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DecisionMakerView value)?  $default,){
final _that = this;
switch (_that) {
case _DecisionMakerView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String periodId,  String projectId,  String linkId,  String accountId,  StakeholderLinkAccountView account,  String contactId,  StakeholderLinkContactView contact,  DateTime setAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DecisionMakerView() when $default != null:
return $default(_that.periodId,_that.projectId,_that.linkId,_that.accountId,_that.account,_that.contactId,_that.contact,_that.setAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String periodId,  String projectId,  String linkId,  String accountId,  StakeholderLinkAccountView account,  String contactId,  StakeholderLinkContactView contact,  DateTime setAt)  $default,) {final _that = this;
switch (_that) {
case _DecisionMakerView():
return $default(_that.periodId,_that.projectId,_that.linkId,_that.accountId,_that.account,_that.contactId,_that.contact,_that.setAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String periodId,  String projectId,  String linkId,  String accountId,  StakeholderLinkAccountView account,  String contactId,  StakeholderLinkContactView contact,  DateTime setAt)?  $default,) {final _that = this;
switch (_that) {
case _DecisionMakerView() when $default != null:
return $default(_that.periodId,_that.projectId,_that.linkId,_that.accountId,_that.account,_that.contactId,_that.contact,_that.setAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(converters: [UtcDateTimeConverter()])
class _DecisionMakerView implements DecisionMakerView {
  const _DecisionMakerView({required this.periodId, required this.projectId, required this.linkId, required this.accountId, required this.account, required this.contactId, required this.contact, required this.setAt});
  factory _DecisionMakerView.fromJson(Map<String, dynamic> json) => _$DecisionMakerViewFromJson(json);

@override final  String periodId;
@override final  String projectId;
@override final  String linkId;
@override final  String accountId;
@override final  StakeholderLinkAccountView account;
@override final  String contactId;
@override final  StakeholderLinkContactView contact;
@override final  DateTime setAt;

/// Create a copy of DecisionMakerView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DecisionMakerViewCopyWith<_DecisionMakerView> get copyWith => __$DecisionMakerViewCopyWithImpl<_DecisionMakerView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DecisionMakerViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DecisionMakerView&&(identical(other.periodId, periodId) || other.periodId == periodId)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.linkId, linkId) || other.linkId == linkId)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.account, account) || other.account == account)&&(identical(other.contactId, contactId) || other.contactId == contactId)&&(identical(other.contact, contact) || other.contact == contact)&&(identical(other.setAt, setAt) || other.setAt == setAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,periodId,projectId,linkId,accountId,account,contactId,contact,setAt);

@override
String toString() {
  return 'DecisionMakerView(periodId: $periodId, projectId: $projectId, linkId: $linkId, accountId: $accountId, account: $account, contactId: $contactId, contact: $contact, setAt: $setAt)';
}


}

/// @nodoc
abstract mixin class _$DecisionMakerViewCopyWith<$Res> implements $DecisionMakerViewCopyWith<$Res> {
  factory _$DecisionMakerViewCopyWith(_DecisionMakerView value, $Res Function(_DecisionMakerView) _then) = __$DecisionMakerViewCopyWithImpl;
@override @useResult
$Res call({
 String periodId, String projectId, String linkId, String accountId, StakeholderLinkAccountView account, String contactId, StakeholderLinkContactView contact, DateTime setAt
});


@override $StakeholderLinkAccountViewCopyWith<$Res> get account;@override $StakeholderLinkContactViewCopyWith<$Res> get contact;

}
/// @nodoc
class __$DecisionMakerViewCopyWithImpl<$Res>
    implements _$DecisionMakerViewCopyWith<$Res> {
  __$DecisionMakerViewCopyWithImpl(this._self, this._then);

  final _DecisionMakerView _self;
  final $Res Function(_DecisionMakerView) _then;

/// Create a copy of DecisionMakerView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? periodId = null,Object? projectId = null,Object? linkId = null,Object? accountId = null,Object? account = null,Object? contactId = null,Object? contact = null,Object? setAt = null,}) {
  return _then(_DecisionMakerView(
periodId: null == periodId ? _self.periodId : periodId // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,linkId: null == linkId ? _self.linkId : linkId // ignore: cast_nullable_to_non_nullable
as String,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as StakeholderLinkAccountView,contactId: null == contactId ? _self.contactId : contactId // ignore: cast_nullable_to_non_nullable
as String,contact: null == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as StakeholderLinkContactView,setAt: null == setAt ? _self.setAt : setAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of DecisionMakerView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StakeholderLinkAccountViewCopyWith<$Res> get account {
  
  return $StakeholderLinkAccountViewCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}/// Create a copy of DecisionMakerView
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
