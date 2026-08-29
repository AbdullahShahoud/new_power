// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_detail_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PrimaryContactRefView {

 String get contactId; String get accountId; String get firstName; String get lastName; String? get position; String? get phone; String? get email;
/// Create a copy of PrimaryContactRefView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrimaryContactRefViewCopyWith<PrimaryContactRefView> get copyWith => _$PrimaryContactRefViewCopyWithImpl<PrimaryContactRefView>(this as PrimaryContactRefView, _$identity);

  /// Serializes this PrimaryContactRefView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrimaryContactRefView&&(identical(other.contactId, contactId) || other.contactId == contactId)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.position, position) || other.position == position)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contactId,accountId,firstName,lastName,position,phone,email);

@override
String toString() {
  return 'PrimaryContactRefView(contactId: $contactId, accountId: $accountId, firstName: $firstName, lastName: $lastName, position: $position, phone: $phone, email: $email)';
}


}

/// @nodoc
abstract mixin class $PrimaryContactRefViewCopyWith<$Res>  {
  factory $PrimaryContactRefViewCopyWith(PrimaryContactRefView value, $Res Function(PrimaryContactRefView) _then) = _$PrimaryContactRefViewCopyWithImpl;
@useResult
$Res call({
 String contactId, String accountId, String firstName, String lastName, String? position, String? phone, String? email
});




}
/// @nodoc
class _$PrimaryContactRefViewCopyWithImpl<$Res>
    implements $PrimaryContactRefViewCopyWith<$Res> {
  _$PrimaryContactRefViewCopyWithImpl(this._self, this._then);

  final PrimaryContactRefView _self;
  final $Res Function(PrimaryContactRefView) _then;

/// Create a copy of PrimaryContactRefView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contactId = null,Object? accountId = null,Object? firstName = null,Object? lastName = null,Object? position = freezed,Object? phone = freezed,Object? email = freezed,}) {
  return _then(_self.copyWith(
contactId: null == contactId ? _self.contactId : contactId // ignore: cast_nullable_to_non_nullable
as String,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PrimaryContactRefView].
extension PrimaryContactRefViewPatterns on PrimaryContactRefView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrimaryContactRefView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrimaryContactRefView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrimaryContactRefView value)  $default,){
final _that = this;
switch (_that) {
case _PrimaryContactRefView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrimaryContactRefView value)?  $default,){
final _that = this;
switch (_that) {
case _PrimaryContactRefView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String contactId,  String accountId,  String firstName,  String lastName,  String? position,  String? phone,  String? email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrimaryContactRefView() when $default != null:
return $default(_that.contactId,_that.accountId,_that.firstName,_that.lastName,_that.position,_that.phone,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String contactId,  String accountId,  String firstName,  String lastName,  String? position,  String? phone,  String? email)  $default,) {final _that = this;
switch (_that) {
case _PrimaryContactRefView():
return $default(_that.contactId,_that.accountId,_that.firstName,_that.lastName,_that.position,_that.phone,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String contactId,  String accountId,  String firstName,  String lastName,  String? position,  String? phone,  String? email)?  $default,) {final _that = this;
switch (_that) {
case _PrimaryContactRefView() when $default != null:
return $default(_that.contactId,_that.accountId,_that.firstName,_that.lastName,_that.position,_that.phone,_that.email);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(converters: [UtcDateTimeConverter()])
class _PrimaryContactRefView implements PrimaryContactRefView {
  const _PrimaryContactRefView({required this.contactId, required this.accountId, required this.firstName, required this.lastName, this.position, this.phone, this.email});
  factory _PrimaryContactRefView.fromJson(Map<String, dynamic> json) => _$PrimaryContactRefViewFromJson(json);

@override final  String contactId;
@override final  String accountId;
@override final  String firstName;
@override final  String lastName;
@override final  String? position;
@override final  String? phone;
@override final  String? email;

/// Create a copy of PrimaryContactRefView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrimaryContactRefViewCopyWith<_PrimaryContactRefView> get copyWith => __$PrimaryContactRefViewCopyWithImpl<_PrimaryContactRefView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrimaryContactRefViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrimaryContactRefView&&(identical(other.contactId, contactId) || other.contactId == contactId)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.position, position) || other.position == position)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contactId,accountId,firstName,lastName,position,phone,email);

@override
String toString() {
  return 'PrimaryContactRefView(contactId: $contactId, accountId: $accountId, firstName: $firstName, lastName: $lastName, position: $position, phone: $phone, email: $email)';
}


}

/// @nodoc
abstract mixin class _$PrimaryContactRefViewCopyWith<$Res> implements $PrimaryContactRefViewCopyWith<$Res> {
  factory _$PrimaryContactRefViewCopyWith(_PrimaryContactRefView value, $Res Function(_PrimaryContactRefView) _then) = __$PrimaryContactRefViewCopyWithImpl;
@override @useResult
$Res call({
 String contactId, String accountId, String firstName, String lastName, String? position, String? phone, String? email
});




}
/// @nodoc
class __$PrimaryContactRefViewCopyWithImpl<$Res>
    implements _$PrimaryContactRefViewCopyWith<$Res> {
  __$PrimaryContactRefViewCopyWithImpl(this._self, this._then);

  final _PrimaryContactRefView _self;
  final $Res Function(_PrimaryContactRefView) _then;

/// Create a copy of PrimaryContactRefView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contactId = null,Object? accountId = null,Object? firstName = null,Object? lastName = null,Object? position = freezed,Object? phone = freezed,Object? email = freezed,}) {
  return _then(_PrimaryContactRefView(
contactId: null == contactId ? _self.contactId : contactId // ignore: cast_nullable_to_non_nullable
as String,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$StakeholderRefView {

 String get linkId; String get accountId; String get accountName; String get accountType; StakeholderRole get role; PrimaryContactRefView? get primaryContact; String? get note; DateTime get startedAt; DateTime? get endedAt; bool get isActive; String? get replacedByLinkId; String? get linkedBy; ActorView? get linkedByUser;
/// Create a copy of StakeholderRefView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StakeholderRefViewCopyWith<StakeholderRefView> get copyWith => _$StakeholderRefViewCopyWithImpl<StakeholderRefView>(this as StakeholderRefView, _$identity);

  /// Serializes this StakeholderRefView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StakeholderRefView&&(identical(other.linkId, linkId) || other.linkId == linkId)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.accountName, accountName) || other.accountName == accountName)&&(identical(other.accountType, accountType) || other.accountType == accountType)&&(identical(other.role, role) || other.role == role)&&(identical(other.primaryContact, primaryContact) || other.primaryContact == primaryContact)&&(identical(other.note, note) || other.note == note)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.replacedByLinkId, replacedByLinkId) || other.replacedByLinkId == replacedByLinkId)&&(identical(other.linkedBy, linkedBy) || other.linkedBy == linkedBy)&&(identical(other.linkedByUser, linkedByUser) || other.linkedByUser == linkedByUser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,linkId,accountId,accountName,accountType,role,primaryContact,note,startedAt,endedAt,isActive,replacedByLinkId,linkedBy,linkedByUser);

@override
String toString() {
  return 'StakeholderRefView(linkId: $linkId, accountId: $accountId, accountName: $accountName, accountType: $accountType, role: $role, primaryContact: $primaryContact, note: $note, startedAt: $startedAt, endedAt: $endedAt, isActive: $isActive, replacedByLinkId: $replacedByLinkId, linkedBy: $linkedBy, linkedByUser: $linkedByUser)';
}


}

/// @nodoc
abstract mixin class $StakeholderRefViewCopyWith<$Res>  {
  factory $StakeholderRefViewCopyWith(StakeholderRefView value, $Res Function(StakeholderRefView) _then) = _$StakeholderRefViewCopyWithImpl;
@useResult
$Res call({
 String linkId, String accountId, String accountName, String accountType, StakeholderRole role, PrimaryContactRefView? primaryContact, String? note, DateTime startedAt, DateTime? endedAt, bool isActive, String? replacedByLinkId, String? linkedBy, ActorView? linkedByUser
});


$PrimaryContactRefViewCopyWith<$Res>? get primaryContact;$ActorViewCopyWith<$Res>? get linkedByUser;

}
/// @nodoc
class _$StakeholderRefViewCopyWithImpl<$Res>
    implements $StakeholderRefViewCopyWith<$Res> {
  _$StakeholderRefViewCopyWithImpl(this._self, this._then);

  final StakeholderRefView _self;
  final $Res Function(StakeholderRefView) _then;

/// Create a copy of StakeholderRefView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? linkId = null,Object? accountId = null,Object? accountName = null,Object? accountType = null,Object? role = null,Object? primaryContact = freezed,Object? note = freezed,Object? startedAt = null,Object? endedAt = freezed,Object? isActive = null,Object? replacedByLinkId = freezed,Object? linkedBy = freezed,Object? linkedByUser = freezed,}) {
  return _then(_self.copyWith(
linkId: null == linkId ? _self.linkId : linkId // ignore: cast_nullable_to_non_nullable
as String,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,accountName: null == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String,accountType: null == accountType ? _self.accountType : accountType // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as StakeholderRole,primaryContact: freezed == primaryContact ? _self.primaryContact : primaryContact // ignore: cast_nullable_to_non_nullable
as PrimaryContactRefView?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,replacedByLinkId: freezed == replacedByLinkId ? _self.replacedByLinkId : replacedByLinkId // ignore: cast_nullable_to_non_nullable
as String?,linkedBy: freezed == linkedBy ? _self.linkedBy : linkedBy // ignore: cast_nullable_to_non_nullable
as String?,linkedByUser: freezed == linkedByUser ? _self.linkedByUser : linkedByUser // ignore: cast_nullable_to_non_nullable
as ActorView?,
  ));
}
/// Create a copy of StakeholderRefView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PrimaryContactRefViewCopyWith<$Res>? get primaryContact {
    if (_self.primaryContact == null) {
    return null;
  }

  return $PrimaryContactRefViewCopyWith<$Res>(_self.primaryContact!, (value) {
    return _then(_self.copyWith(primaryContact: value));
  });
}/// Create a copy of StakeholderRefView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActorViewCopyWith<$Res>? get linkedByUser {
    if (_self.linkedByUser == null) {
    return null;
  }

  return $ActorViewCopyWith<$Res>(_self.linkedByUser!, (value) {
    return _then(_self.copyWith(linkedByUser: value));
  });
}
}


/// Adds pattern-matching-related methods to [StakeholderRefView].
extension StakeholderRefViewPatterns on StakeholderRefView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StakeholderRefView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StakeholderRefView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StakeholderRefView value)  $default,){
final _that = this;
switch (_that) {
case _StakeholderRefView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StakeholderRefView value)?  $default,){
final _that = this;
switch (_that) {
case _StakeholderRefView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String linkId,  String accountId,  String accountName,  String accountType,  StakeholderRole role,  PrimaryContactRefView? primaryContact,  String? note,  DateTime startedAt,  DateTime? endedAt,  bool isActive,  String? replacedByLinkId,  String? linkedBy,  ActorView? linkedByUser)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StakeholderRefView() when $default != null:
return $default(_that.linkId,_that.accountId,_that.accountName,_that.accountType,_that.role,_that.primaryContact,_that.note,_that.startedAt,_that.endedAt,_that.isActive,_that.replacedByLinkId,_that.linkedBy,_that.linkedByUser);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String linkId,  String accountId,  String accountName,  String accountType,  StakeholderRole role,  PrimaryContactRefView? primaryContact,  String? note,  DateTime startedAt,  DateTime? endedAt,  bool isActive,  String? replacedByLinkId,  String? linkedBy,  ActorView? linkedByUser)  $default,) {final _that = this;
switch (_that) {
case _StakeholderRefView():
return $default(_that.linkId,_that.accountId,_that.accountName,_that.accountType,_that.role,_that.primaryContact,_that.note,_that.startedAt,_that.endedAt,_that.isActive,_that.replacedByLinkId,_that.linkedBy,_that.linkedByUser);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String linkId,  String accountId,  String accountName,  String accountType,  StakeholderRole role,  PrimaryContactRefView? primaryContact,  String? note,  DateTime startedAt,  DateTime? endedAt,  bool isActive,  String? replacedByLinkId,  String? linkedBy,  ActorView? linkedByUser)?  $default,) {final _that = this;
switch (_that) {
case _StakeholderRefView() when $default != null:
return $default(_that.linkId,_that.accountId,_that.accountName,_that.accountType,_that.role,_that.primaryContact,_that.note,_that.startedAt,_that.endedAt,_that.isActive,_that.replacedByLinkId,_that.linkedBy,_that.linkedByUser);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(converters: [UtcDateTimeConverter()])
class _StakeholderRefView implements StakeholderRefView {
  const _StakeholderRefView({required this.linkId, required this.accountId, required this.accountName, required this.accountType, required this.role, this.primaryContact, this.note, required this.startedAt, this.endedAt, this.isActive = true, this.replacedByLinkId, this.linkedBy, this.linkedByUser});
  factory _StakeholderRefView.fromJson(Map<String, dynamic> json) => _$StakeholderRefViewFromJson(json);

@override final  String linkId;
@override final  String accountId;
@override final  String accountName;
@override final  String accountType;
@override final  StakeholderRole role;
@override final  PrimaryContactRefView? primaryContact;
@override final  String? note;
@override final  DateTime startedAt;
@override final  DateTime? endedAt;
@override@JsonKey() final  bool isActive;
@override final  String? replacedByLinkId;
@override final  String? linkedBy;
@override final  ActorView? linkedByUser;

/// Create a copy of StakeholderRefView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StakeholderRefViewCopyWith<_StakeholderRefView> get copyWith => __$StakeholderRefViewCopyWithImpl<_StakeholderRefView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StakeholderRefViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StakeholderRefView&&(identical(other.linkId, linkId) || other.linkId == linkId)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.accountName, accountName) || other.accountName == accountName)&&(identical(other.accountType, accountType) || other.accountType == accountType)&&(identical(other.role, role) || other.role == role)&&(identical(other.primaryContact, primaryContact) || other.primaryContact == primaryContact)&&(identical(other.note, note) || other.note == note)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.replacedByLinkId, replacedByLinkId) || other.replacedByLinkId == replacedByLinkId)&&(identical(other.linkedBy, linkedBy) || other.linkedBy == linkedBy)&&(identical(other.linkedByUser, linkedByUser) || other.linkedByUser == linkedByUser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,linkId,accountId,accountName,accountType,role,primaryContact,note,startedAt,endedAt,isActive,replacedByLinkId,linkedBy,linkedByUser);

@override
String toString() {
  return 'StakeholderRefView(linkId: $linkId, accountId: $accountId, accountName: $accountName, accountType: $accountType, role: $role, primaryContact: $primaryContact, note: $note, startedAt: $startedAt, endedAt: $endedAt, isActive: $isActive, replacedByLinkId: $replacedByLinkId, linkedBy: $linkedBy, linkedByUser: $linkedByUser)';
}


}

/// @nodoc
abstract mixin class _$StakeholderRefViewCopyWith<$Res> implements $StakeholderRefViewCopyWith<$Res> {
  factory _$StakeholderRefViewCopyWith(_StakeholderRefView value, $Res Function(_StakeholderRefView) _then) = __$StakeholderRefViewCopyWithImpl;
@override @useResult
$Res call({
 String linkId, String accountId, String accountName, String accountType, StakeholderRole role, PrimaryContactRefView? primaryContact, String? note, DateTime startedAt, DateTime? endedAt, bool isActive, String? replacedByLinkId, String? linkedBy, ActorView? linkedByUser
});


@override $PrimaryContactRefViewCopyWith<$Res>? get primaryContact;@override $ActorViewCopyWith<$Res>? get linkedByUser;

}
/// @nodoc
class __$StakeholderRefViewCopyWithImpl<$Res>
    implements _$StakeholderRefViewCopyWith<$Res> {
  __$StakeholderRefViewCopyWithImpl(this._self, this._then);

  final _StakeholderRefView _self;
  final $Res Function(_StakeholderRefView) _then;

/// Create a copy of StakeholderRefView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? linkId = null,Object? accountId = null,Object? accountName = null,Object? accountType = null,Object? role = null,Object? primaryContact = freezed,Object? note = freezed,Object? startedAt = null,Object? endedAt = freezed,Object? isActive = null,Object? replacedByLinkId = freezed,Object? linkedBy = freezed,Object? linkedByUser = freezed,}) {
  return _then(_StakeholderRefView(
linkId: null == linkId ? _self.linkId : linkId // ignore: cast_nullable_to_non_nullable
as String,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,accountName: null == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String,accountType: null == accountType ? _self.accountType : accountType // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as StakeholderRole,primaryContact: freezed == primaryContact ? _self.primaryContact : primaryContact // ignore: cast_nullable_to_non_nullable
as PrimaryContactRefView?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,replacedByLinkId: freezed == replacedByLinkId ? _self.replacedByLinkId : replacedByLinkId // ignore: cast_nullable_to_non_nullable
as String?,linkedBy: freezed == linkedBy ? _self.linkedBy : linkedBy // ignore: cast_nullable_to_non_nullable
as String?,linkedByUser: freezed == linkedByUser ? _self.linkedByUser : linkedByUser // ignore: cast_nullable_to_non_nullable
as ActorView?,
  ));
}

/// Create a copy of StakeholderRefView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PrimaryContactRefViewCopyWith<$Res>? get primaryContact {
    if (_self.primaryContact == null) {
    return null;
  }

  return $PrimaryContactRefViewCopyWith<$Res>(_self.primaryContact!, (value) {
    return _then(_self.copyWith(primaryContact: value));
  });
}/// Create a copy of StakeholderRefView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActorViewCopyWith<$Res>? get linkedByUser {
    if (_self.linkedByUser == null) {
    return null;
  }

  return $ActorViewCopyWith<$Res>(_self.linkedByUser!, (value) {
    return _then(_self.copyWith(linkedByUser: value));
  });
}
}


/// @nodoc
mixin _$DecisionMakerRefView {

 String get contactId; String get contactName; String get accountId; String get accountName;
/// Create a copy of DecisionMakerRefView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DecisionMakerRefViewCopyWith<DecisionMakerRefView> get copyWith => _$DecisionMakerRefViewCopyWithImpl<DecisionMakerRefView>(this as DecisionMakerRefView, _$identity);

  /// Serializes this DecisionMakerRefView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DecisionMakerRefView&&(identical(other.contactId, contactId) || other.contactId == contactId)&&(identical(other.contactName, contactName) || other.contactName == contactName)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.accountName, accountName) || other.accountName == accountName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contactId,contactName,accountId,accountName);

@override
String toString() {
  return 'DecisionMakerRefView(contactId: $contactId, contactName: $contactName, accountId: $accountId, accountName: $accountName)';
}


}

/// @nodoc
abstract mixin class $DecisionMakerRefViewCopyWith<$Res>  {
  factory $DecisionMakerRefViewCopyWith(DecisionMakerRefView value, $Res Function(DecisionMakerRefView) _then) = _$DecisionMakerRefViewCopyWithImpl;
@useResult
$Res call({
 String contactId, String contactName, String accountId, String accountName
});




}
/// @nodoc
class _$DecisionMakerRefViewCopyWithImpl<$Res>
    implements $DecisionMakerRefViewCopyWith<$Res> {
  _$DecisionMakerRefViewCopyWithImpl(this._self, this._then);

  final DecisionMakerRefView _self;
  final $Res Function(DecisionMakerRefView) _then;

/// Create a copy of DecisionMakerRefView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contactId = null,Object? contactName = null,Object? accountId = null,Object? accountName = null,}) {
  return _then(_self.copyWith(
contactId: null == contactId ? _self.contactId : contactId // ignore: cast_nullable_to_non_nullable
as String,contactName: null == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,accountName: null == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DecisionMakerRefView].
extension DecisionMakerRefViewPatterns on DecisionMakerRefView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DecisionMakerRefView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DecisionMakerRefView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DecisionMakerRefView value)  $default,){
final _that = this;
switch (_that) {
case _DecisionMakerRefView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DecisionMakerRefView value)?  $default,){
final _that = this;
switch (_that) {
case _DecisionMakerRefView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String contactId,  String contactName,  String accountId,  String accountName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DecisionMakerRefView() when $default != null:
return $default(_that.contactId,_that.contactName,_that.accountId,_that.accountName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String contactId,  String contactName,  String accountId,  String accountName)  $default,) {final _that = this;
switch (_that) {
case _DecisionMakerRefView():
return $default(_that.contactId,_that.contactName,_that.accountId,_that.accountName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String contactId,  String contactName,  String accountId,  String accountName)?  $default,) {final _that = this;
switch (_that) {
case _DecisionMakerRefView() when $default != null:
return $default(_that.contactId,_that.contactName,_that.accountId,_that.accountName);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(converters: [UtcDateTimeConverter()])
class _DecisionMakerRefView implements DecisionMakerRefView {
  const _DecisionMakerRefView({required this.contactId, required this.contactName, required this.accountId, required this.accountName});
  factory _DecisionMakerRefView.fromJson(Map<String, dynamic> json) => _$DecisionMakerRefViewFromJson(json);

@override final  String contactId;
@override final  String contactName;
@override final  String accountId;
@override final  String accountName;

/// Create a copy of DecisionMakerRefView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DecisionMakerRefViewCopyWith<_DecisionMakerRefView> get copyWith => __$DecisionMakerRefViewCopyWithImpl<_DecisionMakerRefView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DecisionMakerRefViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DecisionMakerRefView&&(identical(other.contactId, contactId) || other.contactId == contactId)&&(identical(other.contactName, contactName) || other.contactName == contactName)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.accountName, accountName) || other.accountName == accountName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contactId,contactName,accountId,accountName);

@override
String toString() {
  return 'DecisionMakerRefView(contactId: $contactId, contactName: $contactName, accountId: $accountId, accountName: $accountName)';
}


}

/// @nodoc
abstract mixin class _$DecisionMakerRefViewCopyWith<$Res> implements $DecisionMakerRefViewCopyWith<$Res> {
  factory _$DecisionMakerRefViewCopyWith(_DecisionMakerRefView value, $Res Function(_DecisionMakerRefView) _then) = __$DecisionMakerRefViewCopyWithImpl;
@override @useResult
$Res call({
 String contactId, String contactName, String accountId, String accountName
});




}
/// @nodoc
class __$DecisionMakerRefViewCopyWithImpl<$Res>
    implements _$DecisionMakerRefViewCopyWith<$Res> {
  __$DecisionMakerRefViewCopyWithImpl(this._self, this._then);

  final _DecisionMakerRefView _self;
  final $Res Function(_DecisionMakerRefView) _then;

/// Create a copy of DecisionMakerRefView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contactId = null,Object? contactName = null,Object? accountId = null,Object? accountName = null,}) {
  return _then(_DecisionMakerRefView(
contactId: null == contactId ? _self.contactId : contactId // ignore: cast_nullable_to_non_nullable
as String,contactName: null == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,accountName: null == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ProjectDetailView {

 String get id; String get name; BuildingType get buildingType; String get description; double get latitude; double get longitude; String? get addressLine; String? get territoryId; TerritoryRefView? get territory; bool get outsideTerritory; ConstructionPhase get constructionPhase; ProjectStage get stage; ProjectStatus get status; String get ownerId; ActorView? get owner; int? get unitCount; double? get estimatedValue; String? get currency; String? get notes; DateTime? get lastActivityAt; DateTime? get nextActionAt; DateTime? get closedAt; String? get closedBy; int get version; String? get createdBy; ActorView? get createdByUser; DateTime get createdAt; DateTime get updatedAt; int get imageCount; List<ProjectImageView> get images; List<ActivityView> get activities; List<StakeholderRefView> get stakeholders; DecisionMakerRefView? get decisionMaker;/// The outcome already submitted on this project and still awaiting a
/// manager's decision (`status: "PENDING"`), or `null` when there is
/// none.
///
/// Load-bearing for the UI, not decoration: while this is present the
/// rep must not be able to submit another won/lost claim. The server
/// refuses a second one anyway (`OUTCOME_ALREADY_OPEN`), but a rep who
/// only learns that after filling the whole form has been made to do
/// the work twice — and cannot see what the first claim said.
 OutcomeView? get pendingOutcome;
/// Create a copy of ProjectDetailView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectDetailViewCopyWith<ProjectDetailView> get copyWith => _$ProjectDetailViewCopyWithImpl<ProjectDetailView>(this as ProjectDetailView, _$identity);

  /// Serializes this ProjectDetailView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectDetailView&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.buildingType, buildingType) || other.buildingType == buildingType)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.addressLine, addressLine) || other.addressLine == addressLine)&&(identical(other.territoryId, territoryId) || other.territoryId == territoryId)&&(identical(other.territory, territory) || other.territory == territory)&&(identical(other.outsideTerritory, outsideTerritory) || other.outsideTerritory == outsideTerritory)&&(identical(other.constructionPhase, constructionPhase) || other.constructionPhase == constructionPhase)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.status, status) || other.status == status)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.unitCount, unitCount) || other.unitCount == unitCount)&&(identical(other.estimatedValue, estimatedValue) || other.estimatedValue == estimatedValue)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.lastActivityAt, lastActivityAt) || other.lastActivityAt == lastActivityAt)&&(identical(other.nextActionAt, nextActionAt) || other.nextActionAt == nextActionAt)&&(identical(other.closedAt, closedAt) || other.closedAt == closedAt)&&(identical(other.closedBy, closedBy) || other.closedBy == closedBy)&&(identical(other.version, version) || other.version == version)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdByUser, createdByUser) || other.createdByUser == createdByUser)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.imageCount, imageCount) || other.imageCount == imageCount)&&const DeepCollectionEquality().equals(other.images, images)&&const DeepCollectionEquality().equals(other.activities, activities)&&const DeepCollectionEquality().equals(other.stakeholders, stakeholders)&&(identical(other.decisionMaker, decisionMaker) || other.decisionMaker == decisionMaker)&&(identical(other.pendingOutcome, pendingOutcome) || other.pendingOutcome == pendingOutcome));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,buildingType,description,latitude,longitude,addressLine,territoryId,territory,outsideTerritory,constructionPhase,stage,status,ownerId,owner,unitCount,estimatedValue,currency,notes,lastActivityAt,nextActionAt,closedAt,closedBy,version,createdBy,createdByUser,createdAt,updatedAt,imageCount,const DeepCollectionEquality().hash(images),const DeepCollectionEquality().hash(activities),const DeepCollectionEquality().hash(stakeholders),decisionMaker,pendingOutcome]);

@override
String toString() {
  return 'ProjectDetailView(id: $id, name: $name, buildingType: $buildingType, description: $description, latitude: $latitude, longitude: $longitude, addressLine: $addressLine, territoryId: $territoryId, territory: $territory, outsideTerritory: $outsideTerritory, constructionPhase: $constructionPhase, stage: $stage, status: $status, ownerId: $ownerId, owner: $owner, unitCount: $unitCount, estimatedValue: $estimatedValue, currency: $currency, notes: $notes, lastActivityAt: $lastActivityAt, nextActionAt: $nextActionAt, closedAt: $closedAt, closedBy: $closedBy, version: $version, createdBy: $createdBy, createdByUser: $createdByUser, createdAt: $createdAt, updatedAt: $updatedAt, imageCount: $imageCount, images: $images, activities: $activities, stakeholders: $stakeholders, decisionMaker: $decisionMaker, pendingOutcome: $pendingOutcome)';
}


}

/// @nodoc
abstract mixin class $ProjectDetailViewCopyWith<$Res>  {
  factory $ProjectDetailViewCopyWith(ProjectDetailView value, $Res Function(ProjectDetailView) _then) = _$ProjectDetailViewCopyWithImpl;
@useResult
$Res call({
 String id, String name, BuildingType buildingType, String description, double latitude, double longitude, String? addressLine, String? territoryId, TerritoryRefView? territory, bool outsideTerritory, ConstructionPhase constructionPhase, ProjectStage stage, ProjectStatus status, String ownerId, ActorView? owner, int? unitCount, double? estimatedValue, String? currency, String? notes, DateTime? lastActivityAt, DateTime? nextActionAt, DateTime? closedAt, String? closedBy, int version, String? createdBy, ActorView? createdByUser, DateTime createdAt, DateTime updatedAt, int imageCount, List<ProjectImageView> images, List<ActivityView> activities, List<StakeholderRefView> stakeholders, DecisionMakerRefView? decisionMaker, OutcomeView? pendingOutcome
});


$TerritoryRefViewCopyWith<$Res>? get territory;$ActorViewCopyWith<$Res>? get owner;$ActorViewCopyWith<$Res>? get createdByUser;$DecisionMakerRefViewCopyWith<$Res>? get decisionMaker;$OutcomeViewCopyWith<$Res>? get pendingOutcome;

}
/// @nodoc
class _$ProjectDetailViewCopyWithImpl<$Res>
    implements $ProjectDetailViewCopyWith<$Res> {
  _$ProjectDetailViewCopyWithImpl(this._self, this._then);

  final ProjectDetailView _self;
  final $Res Function(ProjectDetailView) _then;

/// Create a copy of ProjectDetailView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? buildingType = null,Object? description = null,Object? latitude = null,Object? longitude = null,Object? addressLine = freezed,Object? territoryId = freezed,Object? territory = freezed,Object? outsideTerritory = null,Object? constructionPhase = null,Object? stage = null,Object? status = null,Object? ownerId = null,Object? owner = freezed,Object? unitCount = freezed,Object? estimatedValue = freezed,Object? currency = freezed,Object? notes = freezed,Object? lastActivityAt = freezed,Object? nextActionAt = freezed,Object? closedAt = freezed,Object? closedBy = freezed,Object? version = null,Object? createdBy = freezed,Object? createdByUser = freezed,Object? createdAt = null,Object? updatedAt = null,Object? imageCount = null,Object? images = null,Object? activities = null,Object? stakeholders = null,Object? decisionMaker = freezed,Object? pendingOutcome = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,buildingType: null == buildingType ? _self.buildingType : buildingType // ignore: cast_nullable_to_non_nullable
as BuildingType,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,addressLine: freezed == addressLine ? _self.addressLine : addressLine // ignore: cast_nullable_to_non_nullable
as String?,territoryId: freezed == territoryId ? _self.territoryId : territoryId // ignore: cast_nullable_to_non_nullable
as String?,territory: freezed == territory ? _self.territory : territory // ignore: cast_nullable_to_non_nullable
as TerritoryRefView?,outsideTerritory: null == outsideTerritory ? _self.outsideTerritory : outsideTerritory // ignore: cast_nullable_to_non_nullable
as bool,constructionPhase: null == constructionPhase ? _self.constructionPhase : constructionPhase // ignore: cast_nullable_to_non_nullable
as ConstructionPhase,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as ProjectStage,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,owner: freezed == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as ActorView?,unitCount: freezed == unitCount ? _self.unitCount : unitCount // ignore: cast_nullable_to_non_nullable
as int?,estimatedValue: freezed == estimatedValue ? _self.estimatedValue : estimatedValue // ignore: cast_nullable_to_non_nullable
as double?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,lastActivityAt: freezed == lastActivityAt ? _self.lastActivityAt : lastActivityAt // ignore: cast_nullable_to_non_nullable
as DateTime?,nextActionAt: freezed == nextActionAt ? _self.nextActionAt : nextActionAt // ignore: cast_nullable_to_non_nullable
as DateTime?,closedAt: freezed == closedAt ? _self.closedAt : closedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,closedBy: freezed == closedBy ? _self.closedBy : closedBy // ignore: cast_nullable_to_non_nullable
as String?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,createdByUser: freezed == createdByUser ? _self.createdByUser : createdByUser // ignore: cast_nullable_to_non_nullable
as ActorView?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,imageCount: null == imageCount ? _self.imageCount : imageCount // ignore: cast_nullable_to_non_nullable
as int,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<ProjectImageView>,activities: null == activities ? _self.activities : activities // ignore: cast_nullable_to_non_nullable
as List<ActivityView>,stakeholders: null == stakeholders ? _self.stakeholders : stakeholders // ignore: cast_nullable_to_non_nullable
as List<StakeholderRefView>,decisionMaker: freezed == decisionMaker ? _self.decisionMaker : decisionMaker // ignore: cast_nullable_to_non_nullable
as DecisionMakerRefView?,pendingOutcome: freezed == pendingOutcome ? _self.pendingOutcome : pendingOutcome // ignore: cast_nullable_to_non_nullable
as OutcomeView?,
  ));
}
/// Create a copy of ProjectDetailView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TerritoryRefViewCopyWith<$Res>? get territory {
    if (_self.territory == null) {
    return null;
  }

  return $TerritoryRefViewCopyWith<$Res>(_self.territory!, (value) {
    return _then(_self.copyWith(territory: value));
  });
}/// Create a copy of ProjectDetailView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActorViewCopyWith<$Res>? get owner {
    if (_self.owner == null) {
    return null;
  }

  return $ActorViewCopyWith<$Res>(_self.owner!, (value) {
    return _then(_self.copyWith(owner: value));
  });
}/// Create a copy of ProjectDetailView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActorViewCopyWith<$Res>? get createdByUser {
    if (_self.createdByUser == null) {
    return null;
  }

  return $ActorViewCopyWith<$Res>(_self.createdByUser!, (value) {
    return _then(_self.copyWith(createdByUser: value));
  });
}/// Create a copy of ProjectDetailView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DecisionMakerRefViewCopyWith<$Res>? get decisionMaker {
    if (_self.decisionMaker == null) {
    return null;
  }

  return $DecisionMakerRefViewCopyWith<$Res>(_self.decisionMaker!, (value) {
    return _then(_self.copyWith(decisionMaker: value));
  });
}/// Create a copy of ProjectDetailView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OutcomeViewCopyWith<$Res>? get pendingOutcome {
    if (_self.pendingOutcome == null) {
    return null;
  }

  return $OutcomeViewCopyWith<$Res>(_self.pendingOutcome!, (value) {
    return _then(_self.copyWith(pendingOutcome: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProjectDetailView].
extension ProjectDetailViewPatterns on ProjectDetailView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectDetailView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectDetailView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectDetailView value)  $default,){
final _that = this;
switch (_that) {
case _ProjectDetailView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectDetailView value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectDetailView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  BuildingType buildingType,  String description,  double latitude,  double longitude,  String? addressLine,  String? territoryId,  TerritoryRefView? territory,  bool outsideTerritory,  ConstructionPhase constructionPhase,  ProjectStage stage,  ProjectStatus status,  String ownerId,  ActorView? owner,  int? unitCount,  double? estimatedValue,  String? currency,  String? notes,  DateTime? lastActivityAt,  DateTime? nextActionAt,  DateTime? closedAt,  String? closedBy,  int version,  String? createdBy,  ActorView? createdByUser,  DateTime createdAt,  DateTime updatedAt,  int imageCount,  List<ProjectImageView> images,  List<ActivityView> activities,  List<StakeholderRefView> stakeholders,  DecisionMakerRefView? decisionMaker,  OutcomeView? pendingOutcome)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectDetailView() when $default != null:
return $default(_that.id,_that.name,_that.buildingType,_that.description,_that.latitude,_that.longitude,_that.addressLine,_that.territoryId,_that.territory,_that.outsideTerritory,_that.constructionPhase,_that.stage,_that.status,_that.ownerId,_that.owner,_that.unitCount,_that.estimatedValue,_that.currency,_that.notes,_that.lastActivityAt,_that.nextActionAt,_that.closedAt,_that.closedBy,_that.version,_that.createdBy,_that.createdByUser,_that.createdAt,_that.updatedAt,_that.imageCount,_that.images,_that.activities,_that.stakeholders,_that.decisionMaker,_that.pendingOutcome);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  BuildingType buildingType,  String description,  double latitude,  double longitude,  String? addressLine,  String? territoryId,  TerritoryRefView? territory,  bool outsideTerritory,  ConstructionPhase constructionPhase,  ProjectStage stage,  ProjectStatus status,  String ownerId,  ActorView? owner,  int? unitCount,  double? estimatedValue,  String? currency,  String? notes,  DateTime? lastActivityAt,  DateTime? nextActionAt,  DateTime? closedAt,  String? closedBy,  int version,  String? createdBy,  ActorView? createdByUser,  DateTime createdAt,  DateTime updatedAt,  int imageCount,  List<ProjectImageView> images,  List<ActivityView> activities,  List<StakeholderRefView> stakeholders,  DecisionMakerRefView? decisionMaker,  OutcomeView? pendingOutcome)  $default,) {final _that = this;
switch (_that) {
case _ProjectDetailView():
return $default(_that.id,_that.name,_that.buildingType,_that.description,_that.latitude,_that.longitude,_that.addressLine,_that.territoryId,_that.territory,_that.outsideTerritory,_that.constructionPhase,_that.stage,_that.status,_that.ownerId,_that.owner,_that.unitCount,_that.estimatedValue,_that.currency,_that.notes,_that.lastActivityAt,_that.nextActionAt,_that.closedAt,_that.closedBy,_that.version,_that.createdBy,_that.createdByUser,_that.createdAt,_that.updatedAt,_that.imageCount,_that.images,_that.activities,_that.stakeholders,_that.decisionMaker,_that.pendingOutcome);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  BuildingType buildingType,  String description,  double latitude,  double longitude,  String? addressLine,  String? territoryId,  TerritoryRefView? territory,  bool outsideTerritory,  ConstructionPhase constructionPhase,  ProjectStage stage,  ProjectStatus status,  String ownerId,  ActorView? owner,  int? unitCount,  double? estimatedValue,  String? currency,  String? notes,  DateTime? lastActivityAt,  DateTime? nextActionAt,  DateTime? closedAt,  String? closedBy,  int version,  String? createdBy,  ActorView? createdByUser,  DateTime createdAt,  DateTime updatedAt,  int imageCount,  List<ProjectImageView> images,  List<ActivityView> activities,  List<StakeholderRefView> stakeholders,  DecisionMakerRefView? decisionMaker,  OutcomeView? pendingOutcome)?  $default,) {final _that = this;
switch (_that) {
case _ProjectDetailView() when $default != null:
return $default(_that.id,_that.name,_that.buildingType,_that.description,_that.latitude,_that.longitude,_that.addressLine,_that.territoryId,_that.territory,_that.outsideTerritory,_that.constructionPhase,_that.stage,_that.status,_that.ownerId,_that.owner,_that.unitCount,_that.estimatedValue,_that.currency,_that.notes,_that.lastActivityAt,_that.nextActionAt,_that.closedAt,_that.closedBy,_that.version,_that.createdBy,_that.createdByUser,_that.createdAt,_that.updatedAt,_that.imageCount,_that.images,_that.activities,_that.stakeholders,_that.decisionMaker,_that.pendingOutcome);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(converters: [UtcDateTimeConverter()])
class _ProjectDetailView implements ProjectDetailView {
  const _ProjectDetailView({required this.id, required this.name, required this.buildingType, required this.description, required this.latitude, required this.longitude, this.addressLine, this.territoryId, this.territory, this.outsideTerritory = false, required this.constructionPhase, required this.stage, required this.status, required this.ownerId, this.owner, this.unitCount, this.estimatedValue, this.currency, this.notes, this.lastActivityAt, this.nextActionAt, this.closedAt, this.closedBy, required this.version, this.createdBy, this.createdByUser, required this.createdAt, required this.updatedAt, required this.imageCount, final  List<ProjectImageView> images = const <ProjectImageView>[], final  List<ActivityView> activities = const <ActivityView>[], final  List<StakeholderRefView> stakeholders = const <StakeholderRefView>[], this.decisionMaker, this.pendingOutcome}): _images = images,_activities = activities,_stakeholders = stakeholders;
  factory _ProjectDetailView.fromJson(Map<String, dynamic> json) => _$ProjectDetailViewFromJson(json);

@override final  String id;
@override final  String name;
@override final  BuildingType buildingType;
@override final  String description;
@override final  double latitude;
@override final  double longitude;
@override final  String? addressLine;
@override final  String? territoryId;
@override final  TerritoryRefView? territory;
@override@JsonKey() final  bool outsideTerritory;
@override final  ConstructionPhase constructionPhase;
@override final  ProjectStage stage;
@override final  ProjectStatus status;
@override final  String ownerId;
@override final  ActorView? owner;
@override final  int? unitCount;
@override final  double? estimatedValue;
@override final  String? currency;
@override final  String? notes;
@override final  DateTime? lastActivityAt;
@override final  DateTime? nextActionAt;
@override final  DateTime? closedAt;
@override final  String? closedBy;
@override final  int version;
@override final  String? createdBy;
@override final  ActorView? createdByUser;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  int imageCount;
 final  List<ProjectImageView> _images;
@override@JsonKey() List<ProjectImageView> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

 final  List<ActivityView> _activities;
@override@JsonKey() List<ActivityView> get activities {
  if (_activities is EqualUnmodifiableListView) return _activities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_activities);
}

 final  List<StakeholderRefView> _stakeholders;
@override@JsonKey() List<StakeholderRefView> get stakeholders {
  if (_stakeholders is EqualUnmodifiableListView) return _stakeholders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stakeholders);
}

@override final  DecisionMakerRefView? decisionMaker;
/// The outcome already submitted on this project and still awaiting a
/// manager's decision (`status: "PENDING"`), or `null` when there is
/// none.
///
/// Load-bearing for the UI, not decoration: while this is present the
/// rep must not be able to submit another won/lost claim. The server
/// refuses a second one anyway (`OUTCOME_ALREADY_OPEN`), but a rep who
/// only learns that after filling the whole form has been made to do
/// the work twice — and cannot see what the first claim said.
@override final  OutcomeView? pendingOutcome;

/// Create a copy of ProjectDetailView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectDetailViewCopyWith<_ProjectDetailView> get copyWith => __$ProjectDetailViewCopyWithImpl<_ProjectDetailView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectDetailViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectDetailView&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.buildingType, buildingType) || other.buildingType == buildingType)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.addressLine, addressLine) || other.addressLine == addressLine)&&(identical(other.territoryId, territoryId) || other.territoryId == territoryId)&&(identical(other.territory, territory) || other.territory == territory)&&(identical(other.outsideTerritory, outsideTerritory) || other.outsideTerritory == outsideTerritory)&&(identical(other.constructionPhase, constructionPhase) || other.constructionPhase == constructionPhase)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.status, status) || other.status == status)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.unitCount, unitCount) || other.unitCount == unitCount)&&(identical(other.estimatedValue, estimatedValue) || other.estimatedValue == estimatedValue)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.lastActivityAt, lastActivityAt) || other.lastActivityAt == lastActivityAt)&&(identical(other.nextActionAt, nextActionAt) || other.nextActionAt == nextActionAt)&&(identical(other.closedAt, closedAt) || other.closedAt == closedAt)&&(identical(other.closedBy, closedBy) || other.closedBy == closedBy)&&(identical(other.version, version) || other.version == version)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdByUser, createdByUser) || other.createdByUser == createdByUser)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.imageCount, imageCount) || other.imageCount == imageCount)&&const DeepCollectionEquality().equals(other._images, _images)&&const DeepCollectionEquality().equals(other._activities, _activities)&&const DeepCollectionEquality().equals(other._stakeholders, _stakeholders)&&(identical(other.decisionMaker, decisionMaker) || other.decisionMaker == decisionMaker)&&(identical(other.pendingOutcome, pendingOutcome) || other.pendingOutcome == pendingOutcome));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,buildingType,description,latitude,longitude,addressLine,territoryId,territory,outsideTerritory,constructionPhase,stage,status,ownerId,owner,unitCount,estimatedValue,currency,notes,lastActivityAt,nextActionAt,closedAt,closedBy,version,createdBy,createdByUser,createdAt,updatedAt,imageCount,const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_activities),const DeepCollectionEquality().hash(_stakeholders),decisionMaker,pendingOutcome]);

@override
String toString() {
  return 'ProjectDetailView(id: $id, name: $name, buildingType: $buildingType, description: $description, latitude: $latitude, longitude: $longitude, addressLine: $addressLine, territoryId: $territoryId, territory: $territory, outsideTerritory: $outsideTerritory, constructionPhase: $constructionPhase, stage: $stage, status: $status, ownerId: $ownerId, owner: $owner, unitCount: $unitCount, estimatedValue: $estimatedValue, currency: $currency, notes: $notes, lastActivityAt: $lastActivityAt, nextActionAt: $nextActionAt, closedAt: $closedAt, closedBy: $closedBy, version: $version, createdBy: $createdBy, createdByUser: $createdByUser, createdAt: $createdAt, updatedAt: $updatedAt, imageCount: $imageCount, images: $images, activities: $activities, stakeholders: $stakeholders, decisionMaker: $decisionMaker, pendingOutcome: $pendingOutcome)';
}


}

/// @nodoc
abstract mixin class _$ProjectDetailViewCopyWith<$Res> implements $ProjectDetailViewCopyWith<$Res> {
  factory _$ProjectDetailViewCopyWith(_ProjectDetailView value, $Res Function(_ProjectDetailView) _then) = __$ProjectDetailViewCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, BuildingType buildingType, String description, double latitude, double longitude, String? addressLine, String? territoryId, TerritoryRefView? territory, bool outsideTerritory, ConstructionPhase constructionPhase, ProjectStage stage, ProjectStatus status, String ownerId, ActorView? owner, int? unitCount, double? estimatedValue, String? currency, String? notes, DateTime? lastActivityAt, DateTime? nextActionAt, DateTime? closedAt, String? closedBy, int version, String? createdBy, ActorView? createdByUser, DateTime createdAt, DateTime updatedAt, int imageCount, List<ProjectImageView> images, List<ActivityView> activities, List<StakeholderRefView> stakeholders, DecisionMakerRefView? decisionMaker, OutcomeView? pendingOutcome
});


@override $TerritoryRefViewCopyWith<$Res>? get territory;@override $ActorViewCopyWith<$Res>? get owner;@override $ActorViewCopyWith<$Res>? get createdByUser;@override $DecisionMakerRefViewCopyWith<$Res>? get decisionMaker;@override $OutcomeViewCopyWith<$Res>? get pendingOutcome;

}
/// @nodoc
class __$ProjectDetailViewCopyWithImpl<$Res>
    implements _$ProjectDetailViewCopyWith<$Res> {
  __$ProjectDetailViewCopyWithImpl(this._self, this._then);

  final _ProjectDetailView _self;
  final $Res Function(_ProjectDetailView) _then;

/// Create a copy of ProjectDetailView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? buildingType = null,Object? description = null,Object? latitude = null,Object? longitude = null,Object? addressLine = freezed,Object? territoryId = freezed,Object? territory = freezed,Object? outsideTerritory = null,Object? constructionPhase = null,Object? stage = null,Object? status = null,Object? ownerId = null,Object? owner = freezed,Object? unitCount = freezed,Object? estimatedValue = freezed,Object? currency = freezed,Object? notes = freezed,Object? lastActivityAt = freezed,Object? nextActionAt = freezed,Object? closedAt = freezed,Object? closedBy = freezed,Object? version = null,Object? createdBy = freezed,Object? createdByUser = freezed,Object? createdAt = null,Object? updatedAt = null,Object? imageCount = null,Object? images = null,Object? activities = null,Object? stakeholders = null,Object? decisionMaker = freezed,Object? pendingOutcome = freezed,}) {
  return _then(_ProjectDetailView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,buildingType: null == buildingType ? _self.buildingType : buildingType // ignore: cast_nullable_to_non_nullable
as BuildingType,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,addressLine: freezed == addressLine ? _self.addressLine : addressLine // ignore: cast_nullable_to_non_nullable
as String?,territoryId: freezed == territoryId ? _self.territoryId : territoryId // ignore: cast_nullable_to_non_nullable
as String?,territory: freezed == territory ? _self.territory : territory // ignore: cast_nullable_to_non_nullable
as TerritoryRefView?,outsideTerritory: null == outsideTerritory ? _self.outsideTerritory : outsideTerritory // ignore: cast_nullable_to_non_nullable
as bool,constructionPhase: null == constructionPhase ? _self.constructionPhase : constructionPhase // ignore: cast_nullable_to_non_nullable
as ConstructionPhase,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as ProjectStage,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,owner: freezed == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as ActorView?,unitCount: freezed == unitCount ? _self.unitCount : unitCount // ignore: cast_nullable_to_non_nullable
as int?,estimatedValue: freezed == estimatedValue ? _self.estimatedValue : estimatedValue // ignore: cast_nullable_to_non_nullable
as double?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,lastActivityAt: freezed == lastActivityAt ? _self.lastActivityAt : lastActivityAt // ignore: cast_nullable_to_non_nullable
as DateTime?,nextActionAt: freezed == nextActionAt ? _self.nextActionAt : nextActionAt // ignore: cast_nullable_to_non_nullable
as DateTime?,closedAt: freezed == closedAt ? _self.closedAt : closedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,closedBy: freezed == closedBy ? _self.closedBy : closedBy // ignore: cast_nullable_to_non_nullable
as String?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,createdByUser: freezed == createdByUser ? _self.createdByUser : createdByUser // ignore: cast_nullable_to_non_nullable
as ActorView?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,imageCount: null == imageCount ? _self.imageCount : imageCount // ignore: cast_nullable_to_non_nullable
as int,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<ProjectImageView>,activities: null == activities ? _self._activities : activities // ignore: cast_nullable_to_non_nullable
as List<ActivityView>,stakeholders: null == stakeholders ? _self._stakeholders : stakeholders // ignore: cast_nullable_to_non_nullable
as List<StakeholderRefView>,decisionMaker: freezed == decisionMaker ? _self.decisionMaker : decisionMaker // ignore: cast_nullable_to_non_nullable
as DecisionMakerRefView?,pendingOutcome: freezed == pendingOutcome ? _self.pendingOutcome : pendingOutcome // ignore: cast_nullable_to_non_nullable
as OutcomeView?,
  ));
}

/// Create a copy of ProjectDetailView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TerritoryRefViewCopyWith<$Res>? get territory {
    if (_self.territory == null) {
    return null;
  }

  return $TerritoryRefViewCopyWith<$Res>(_self.territory!, (value) {
    return _then(_self.copyWith(territory: value));
  });
}/// Create a copy of ProjectDetailView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActorViewCopyWith<$Res>? get owner {
    if (_self.owner == null) {
    return null;
  }

  return $ActorViewCopyWith<$Res>(_self.owner!, (value) {
    return _then(_self.copyWith(owner: value));
  });
}/// Create a copy of ProjectDetailView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActorViewCopyWith<$Res>? get createdByUser {
    if (_self.createdByUser == null) {
    return null;
  }

  return $ActorViewCopyWith<$Res>(_self.createdByUser!, (value) {
    return _then(_self.copyWith(createdByUser: value));
  });
}/// Create a copy of ProjectDetailView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DecisionMakerRefViewCopyWith<$Res>? get decisionMaker {
    if (_self.decisionMaker == null) {
    return null;
  }

  return $DecisionMakerRefViewCopyWith<$Res>(_self.decisionMaker!, (value) {
    return _then(_self.copyWith(decisionMaker: value));
  });
}/// Create a copy of ProjectDetailView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OutcomeViewCopyWith<$Res>? get pendingOutcome {
    if (_self.pendingOutcome == null) {
    return null;
  }

  return $OutcomeViewCopyWith<$Res>(_self.pendingOutcome!, (value) {
    return _then(_self.copyWith(pendingOutcome: value));
  });
}
}

// dart format on
