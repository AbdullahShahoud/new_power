// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_project_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectStakeholderRefDto {

/// An account already in the directory.
 String? get accountId;/// A company or person to create as part of this registration.
 String? get accountName;/// Only meaningful with [accountName]. Defaults to `COMPANY`
/// server-side; sent explicitly so an individual owner is unambiguous.
 AccountType? get accountType; StakeholderRole get role;/// A contact to create and attach. Valid with either account form.
 NewStakeholderContact? get contact;/// An existing contact. ⚠️ Never sent without [accountId].
 String? get primaryContactId; String? get note;
/// Create a copy of ProjectStakeholderRefDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectStakeholderRefDtoCopyWith<ProjectStakeholderRefDto> get copyWith => _$ProjectStakeholderRefDtoCopyWithImpl<ProjectStakeholderRefDto>(this as ProjectStakeholderRefDto, _$identity);

  /// Serializes this ProjectStakeholderRefDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectStakeholderRefDto&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.accountName, accountName) || other.accountName == accountName)&&(identical(other.accountType, accountType) || other.accountType == accountType)&&(identical(other.role, role) || other.role == role)&&(identical(other.contact, contact) || other.contact == contact)&&(identical(other.primaryContactId, primaryContactId) || other.primaryContactId == primaryContactId)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,accountName,accountType,role,contact,primaryContactId,note);

@override
String toString() {
  return 'ProjectStakeholderRefDto(accountId: $accountId, accountName: $accountName, accountType: $accountType, role: $role, contact: $contact, primaryContactId: $primaryContactId, note: $note)';
}


}

/// @nodoc
abstract mixin class $ProjectStakeholderRefDtoCopyWith<$Res>  {
  factory $ProjectStakeholderRefDtoCopyWith(ProjectStakeholderRefDto value, $Res Function(ProjectStakeholderRefDto) _then) = _$ProjectStakeholderRefDtoCopyWithImpl;
@useResult
$Res call({
 String? accountId, String? accountName, AccountType? accountType, StakeholderRole role, NewStakeholderContact? contact, String? primaryContactId, String? note
});


$NewStakeholderContactCopyWith<$Res>? get contact;

}
/// @nodoc
class _$ProjectStakeholderRefDtoCopyWithImpl<$Res>
    implements $ProjectStakeholderRefDtoCopyWith<$Res> {
  _$ProjectStakeholderRefDtoCopyWithImpl(this._self, this._then);

  final ProjectStakeholderRefDto _self;
  final $Res Function(ProjectStakeholderRefDto) _then;

/// Create a copy of ProjectStakeholderRefDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountId = freezed,Object? accountName = freezed,Object? accountType = freezed,Object? role = null,Object? contact = freezed,Object? primaryContactId = freezed,Object? note = freezed,}) {
  return _then(_self.copyWith(
accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String?,accountName: freezed == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String?,accountType: freezed == accountType ? _self.accountType : accountType // ignore: cast_nullable_to_non_nullable
as AccountType?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as StakeholderRole,contact: freezed == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as NewStakeholderContact?,primaryContactId: freezed == primaryContactId ? _self.primaryContactId : primaryContactId // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ProjectStakeholderRefDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NewStakeholderContactCopyWith<$Res>? get contact {
    if (_self.contact == null) {
    return null;
  }

  return $NewStakeholderContactCopyWith<$Res>(_self.contact!, (value) {
    return _then(_self.copyWith(contact: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProjectStakeholderRefDto].
extension ProjectStakeholderRefDtoPatterns on ProjectStakeholderRefDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectStakeholderRefDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectStakeholderRefDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectStakeholderRefDto value)  $default,){
final _that = this;
switch (_that) {
case _ProjectStakeholderRefDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectStakeholderRefDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectStakeholderRefDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? accountId,  String? accountName,  AccountType? accountType,  StakeholderRole role,  NewStakeholderContact? contact,  String? primaryContactId,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectStakeholderRefDto() when $default != null:
return $default(_that.accountId,_that.accountName,_that.accountType,_that.role,_that.contact,_that.primaryContactId,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? accountId,  String? accountName,  AccountType? accountType,  StakeholderRole role,  NewStakeholderContact? contact,  String? primaryContactId,  String? note)  $default,) {final _that = this;
switch (_that) {
case _ProjectStakeholderRefDto():
return $default(_that.accountId,_that.accountName,_that.accountType,_that.role,_that.contact,_that.primaryContactId,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? accountId,  String? accountName,  AccountType? accountType,  StakeholderRole role,  NewStakeholderContact? contact,  String? primaryContactId,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _ProjectStakeholderRefDto() when $default != null:
return $default(_that.accountId,_that.accountName,_that.accountType,_that.role,_that.contact,_that.primaryContactId,_that.note);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _ProjectStakeholderRefDto implements ProjectStakeholderRefDto {
  const _ProjectStakeholderRefDto({this.accountId, this.accountName, this.accountType, required this.role, this.contact, this.primaryContactId, this.note});
  factory _ProjectStakeholderRefDto.fromJson(Map<String, dynamic> json) => _$ProjectStakeholderRefDtoFromJson(json);

/// An account already in the directory.
@override final  String? accountId;
/// A company or person to create as part of this registration.
@override final  String? accountName;
/// Only meaningful with [accountName]. Defaults to `COMPANY`
/// server-side; sent explicitly so an individual owner is unambiguous.
@override final  AccountType? accountType;
@override final  StakeholderRole role;
/// A contact to create and attach. Valid with either account form.
@override final  NewStakeholderContact? contact;
/// An existing contact. ⚠️ Never sent without [accountId].
@override final  String? primaryContactId;
@override final  String? note;

/// Create a copy of ProjectStakeholderRefDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectStakeholderRefDtoCopyWith<_ProjectStakeholderRefDto> get copyWith => __$ProjectStakeholderRefDtoCopyWithImpl<_ProjectStakeholderRefDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectStakeholderRefDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectStakeholderRefDto&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.accountName, accountName) || other.accountName == accountName)&&(identical(other.accountType, accountType) || other.accountType == accountType)&&(identical(other.role, role) || other.role == role)&&(identical(other.contact, contact) || other.contact == contact)&&(identical(other.primaryContactId, primaryContactId) || other.primaryContactId == primaryContactId)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,accountName,accountType,role,contact,primaryContactId,note);

@override
String toString() {
  return 'ProjectStakeholderRefDto(accountId: $accountId, accountName: $accountName, accountType: $accountType, role: $role, contact: $contact, primaryContactId: $primaryContactId, note: $note)';
}


}

/// @nodoc
abstract mixin class _$ProjectStakeholderRefDtoCopyWith<$Res> implements $ProjectStakeholderRefDtoCopyWith<$Res> {
  factory _$ProjectStakeholderRefDtoCopyWith(_ProjectStakeholderRefDto value, $Res Function(_ProjectStakeholderRefDto) _then) = __$ProjectStakeholderRefDtoCopyWithImpl;
@override @useResult
$Res call({
 String? accountId, String? accountName, AccountType? accountType, StakeholderRole role, NewStakeholderContact? contact, String? primaryContactId, String? note
});


@override $NewStakeholderContactCopyWith<$Res>? get contact;

}
/// @nodoc
class __$ProjectStakeholderRefDtoCopyWithImpl<$Res>
    implements _$ProjectStakeholderRefDtoCopyWith<$Res> {
  __$ProjectStakeholderRefDtoCopyWithImpl(this._self, this._then);

  final _ProjectStakeholderRefDto _self;
  final $Res Function(_ProjectStakeholderRefDto) _then;

/// Create a copy of ProjectStakeholderRefDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountId = freezed,Object? accountName = freezed,Object? accountType = freezed,Object? role = null,Object? contact = freezed,Object? primaryContactId = freezed,Object? note = freezed,}) {
  return _then(_ProjectStakeholderRefDto(
accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String?,accountName: freezed == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String?,accountType: freezed == accountType ? _self.accountType : accountType // ignore: cast_nullable_to_non_nullable
as AccountType?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as StakeholderRole,contact: freezed == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as NewStakeholderContact?,primaryContactId: freezed == primaryContactId ? _self.primaryContactId : primaryContactId // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ProjectStakeholderRefDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NewStakeholderContactCopyWith<$Res>? get contact {
    if (_self.contact == null) {
    return null;
  }

  return $NewStakeholderContactCopyWith<$Res>(_self.contact!, (value) {
    return _then(_self.copyWith(contact: value));
  });
}
}


/// @nodoc
mixin _$NewStakeholderContact {

 String get firstName; String get lastName; String? get phone; String? get email; String? get position;
/// Create a copy of NewStakeholderContact
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewStakeholderContactCopyWith<NewStakeholderContact> get copyWith => _$NewStakeholderContactCopyWithImpl<NewStakeholderContact>(this as NewStakeholderContact, _$identity);

  /// Serializes this NewStakeholderContact to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewStakeholderContact&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.position, position) || other.position == position));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,phone,email,position);

@override
String toString() {
  return 'NewStakeholderContact(firstName: $firstName, lastName: $lastName, phone: $phone, email: $email, position: $position)';
}


}

/// @nodoc
abstract mixin class $NewStakeholderContactCopyWith<$Res>  {
  factory $NewStakeholderContactCopyWith(NewStakeholderContact value, $Res Function(NewStakeholderContact) _then) = _$NewStakeholderContactCopyWithImpl;
@useResult
$Res call({
 String firstName, String lastName, String? phone, String? email, String? position
});




}
/// @nodoc
class _$NewStakeholderContactCopyWithImpl<$Res>
    implements $NewStakeholderContactCopyWith<$Res> {
  _$NewStakeholderContactCopyWithImpl(this._self, this._then);

  final NewStakeholderContact _self;
  final $Res Function(NewStakeholderContact) _then;

/// Create a copy of NewStakeholderContact
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = null,Object? lastName = null,Object? phone = freezed,Object? email = freezed,Object? position = freezed,}) {
  return _then(_self.copyWith(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NewStakeholderContact].
extension NewStakeholderContactPatterns on NewStakeholderContact {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewStakeholderContact value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewStakeholderContact() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewStakeholderContact value)  $default,){
final _that = this;
switch (_that) {
case _NewStakeholderContact():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewStakeholderContact value)?  $default,){
final _that = this;
switch (_that) {
case _NewStakeholderContact() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String firstName,  String lastName,  String? phone,  String? email,  String? position)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewStakeholderContact() when $default != null:
return $default(_that.firstName,_that.lastName,_that.phone,_that.email,_that.position);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String firstName,  String lastName,  String? phone,  String? email,  String? position)  $default,) {final _that = this;
switch (_that) {
case _NewStakeholderContact():
return $default(_that.firstName,_that.lastName,_that.phone,_that.email,_that.position);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String firstName,  String lastName,  String? phone,  String? email,  String? position)?  $default,) {final _that = this;
switch (_that) {
case _NewStakeholderContact() when $default != null:
return $default(_that.firstName,_that.lastName,_that.phone,_that.email,_that.position);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _NewStakeholderContact implements NewStakeholderContact {
  const _NewStakeholderContact({required this.firstName, required this.lastName, this.phone, this.email, this.position});
  factory _NewStakeholderContact.fromJson(Map<String, dynamic> json) => _$NewStakeholderContactFromJson(json);

@override final  String firstName;
@override final  String lastName;
@override final  String? phone;
@override final  String? email;
@override final  String? position;

/// Create a copy of NewStakeholderContact
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewStakeholderContactCopyWith<_NewStakeholderContact> get copyWith => __$NewStakeholderContactCopyWithImpl<_NewStakeholderContact>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NewStakeholderContactToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewStakeholderContact&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.position, position) || other.position == position));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,phone,email,position);

@override
String toString() {
  return 'NewStakeholderContact(firstName: $firstName, lastName: $lastName, phone: $phone, email: $email, position: $position)';
}


}

/// @nodoc
abstract mixin class _$NewStakeholderContactCopyWith<$Res> implements $NewStakeholderContactCopyWith<$Res> {
  factory _$NewStakeholderContactCopyWith(_NewStakeholderContact value, $Res Function(_NewStakeholderContact) _then) = __$NewStakeholderContactCopyWithImpl;
@override @useResult
$Res call({
 String firstName, String lastName, String? phone, String? email, String? position
});




}
/// @nodoc
class __$NewStakeholderContactCopyWithImpl<$Res>
    implements _$NewStakeholderContactCopyWith<$Res> {
  __$NewStakeholderContactCopyWithImpl(this._self, this._then);

  final _NewStakeholderContact _self;
  final $Res Function(_NewStakeholderContact) _then;

/// Create a copy of NewStakeholderContact
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = null,Object? lastName = null,Object? phone = freezed,Object? email = freezed,Object? position = freezed,}) {
  return _then(_NewStakeholderContact(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RegisterProjectRequest {

 String get name; BuildingType get buildingType; String get description; LocationDto get location; ConstructionPhase get constructionPhase; List<ProjectFileRefDto> get files; String? get addressLine; int? get unitCount; double? get estimatedValue; String? get currency; List<ProjectStakeholderRefDto> get stakeholders; String? get decisionMakerContactId; String? get notes;
/// Create a copy of RegisterProjectRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterProjectRequestCopyWith<RegisterProjectRequest> get copyWith => _$RegisterProjectRequestCopyWithImpl<RegisterProjectRequest>(this as RegisterProjectRequest, _$identity);

  /// Serializes this RegisterProjectRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterProjectRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.buildingType, buildingType) || other.buildingType == buildingType)&&(identical(other.description, description) || other.description == description)&&(identical(other.location, location) || other.location == location)&&(identical(other.constructionPhase, constructionPhase) || other.constructionPhase == constructionPhase)&&const DeepCollectionEquality().equals(other.files, files)&&(identical(other.addressLine, addressLine) || other.addressLine == addressLine)&&(identical(other.unitCount, unitCount) || other.unitCount == unitCount)&&(identical(other.estimatedValue, estimatedValue) || other.estimatedValue == estimatedValue)&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other.stakeholders, stakeholders)&&(identical(other.decisionMakerContactId, decisionMakerContactId) || other.decisionMakerContactId == decisionMakerContactId)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,buildingType,description,location,constructionPhase,const DeepCollectionEquality().hash(files),addressLine,unitCount,estimatedValue,currency,const DeepCollectionEquality().hash(stakeholders),decisionMakerContactId,notes);

@override
String toString() {
  return 'RegisterProjectRequest(name: $name, buildingType: $buildingType, description: $description, location: $location, constructionPhase: $constructionPhase, files: $files, addressLine: $addressLine, unitCount: $unitCount, estimatedValue: $estimatedValue, currency: $currency, stakeholders: $stakeholders, decisionMakerContactId: $decisionMakerContactId, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $RegisterProjectRequestCopyWith<$Res>  {
  factory $RegisterProjectRequestCopyWith(RegisterProjectRequest value, $Res Function(RegisterProjectRequest) _then) = _$RegisterProjectRequestCopyWithImpl;
@useResult
$Res call({
 String name, BuildingType buildingType, String description, LocationDto location, ConstructionPhase constructionPhase, List<ProjectFileRefDto> files, String? addressLine, int? unitCount, double? estimatedValue, String? currency, List<ProjectStakeholderRefDto> stakeholders, String? decisionMakerContactId, String? notes
});


$LocationDtoCopyWith<$Res> get location;

}
/// @nodoc
class _$RegisterProjectRequestCopyWithImpl<$Res>
    implements $RegisterProjectRequestCopyWith<$Res> {
  _$RegisterProjectRequestCopyWithImpl(this._self, this._then);

  final RegisterProjectRequest _self;
  final $Res Function(RegisterProjectRequest) _then;

/// Create a copy of RegisterProjectRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? buildingType = null,Object? description = null,Object? location = null,Object? constructionPhase = null,Object? files = null,Object? addressLine = freezed,Object? unitCount = freezed,Object? estimatedValue = freezed,Object? currency = freezed,Object? stakeholders = null,Object? decisionMakerContactId = freezed,Object? notes = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,buildingType: null == buildingType ? _self.buildingType : buildingType // ignore: cast_nullable_to_non_nullable
as BuildingType,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LocationDto,constructionPhase: null == constructionPhase ? _self.constructionPhase : constructionPhase // ignore: cast_nullable_to_non_nullable
as ConstructionPhase,files: null == files ? _self.files : files // ignore: cast_nullable_to_non_nullable
as List<ProjectFileRefDto>,addressLine: freezed == addressLine ? _self.addressLine : addressLine // ignore: cast_nullable_to_non_nullable
as String?,unitCount: freezed == unitCount ? _self.unitCount : unitCount // ignore: cast_nullable_to_non_nullable
as int?,estimatedValue: freezed == estimatedValue ? _self.estimatedValue : estimatedValue // ignore: cast_nullable_to_non_nullable
as double?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,stakeholders: null == stakeholders ? _self.stakeholders : stakeholders // ignore: cast_nullable_to_non_nullable
as List<ProjectStakeholderRefDto>,decisionMakerContactId: freezed == decisionMakerContactId ? _self.decisionMakerContactId : decisionMakerContactId // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of RegisterProjectRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationDtoCopyWith<$Res> get location {
  
  return $LocationDtoCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// Adds pattern-matching-related methods to [RegisterProjectRequest].
extension RegisterProjectRequestPatterns on RegisterProjectRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterProjectRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterProjectRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterProjectRequest value)  $default,){
final _that = this;
switch (_that) {
case _RegisterProjectRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterProjectRequest value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterProjectRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  BuildingType buildingType,  String description,  LocationDto location,  ConstructionPhase constructionPhase,  List<ProjectFileRefDto> files,  String? addressLine,  int? unitCount,  double? estimatedValue,  String? currency,  List<ProjectStakeholderRefDto> stakeholders,  String? decisionMakerContactId,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterProjectRequest() when $default != null:
return $default(_that.name,_that.buildingType,_that.description,_that.location,_that.constructionPhase,_that.files,_that.addressLine,_that.unitCount,_that.estimatedValue,_that.currency,_that.stakeholders,_that.decisionMakerContactId,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  BuildingType buildingType,  String description,  LocationDto location,  ConstructionPhase constructionPhase,  List<ProjectFileRefDto> files,  String? addressLine,  int? unitCount,  double? estimatedValue,  String? currency,  List<ProjectStakeholderRefDto> stakeholders,  String? decisionMakerContactId,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _RegisterProjectRequest():
return $default(_that.name,_that.buildingType,_that.description,_that.location,_that.constructionPhase,_that.files,_that.addressLine,_that.unitCount,_that.estimatedValue,_that.currency,_that.stakeholders,_that.decisionMakerContactId,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  BuildingType buildingType,  String description,  LocationDto location,  ConstructionPhase constructionPhase,  List<ProjectFileRefDto> files,  String? addressLine,  int? unitCount,  double? estimatedValue,  String? currency,  List<ProjectStakeholderRefDto> stakeholders,  String? decisionMakerContactId,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _RegisterProjectRequest() when $default != null:
return $default(_that.name,_that.buildingType,_that.description,_that.location,_that.constructionPhase,_that.files,_that.addressLine,_that.unitCount,_that.estimatedValue,_that.currency,_that.stakeholders,_that.decisionMakerContactId,_that.notes);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _RegisterProjectRequest implements RegisterProjectRequest {
  const _RegisterProjectRequest({required this.name, required this.buildingType, required this.description, required this.location, required this.constructionPhase, required final  List<ProjectFileRefDto> files, this.addressLine, this.unitCount, this.estimatedValue, this.currency, final  List<ProjectStakeholderRefDto> stakeholders = const <ProjectStakeholderRefDto>[], this.decisionMakerContactId, this.notes}): _files = files,_stakeholders = stakeholders;
  factory _RegisterProjectRequest.fromJson(Map<String, dynamic> json) => _$RegisterProjectRequestFromJson(json);

@override final  String name;
@override final  BuildingType buildingType;
@override final  String description;
@override final  LocationDto location;
@override final  ConstructionPhase constructionPhase;
 final  List<ProjectFileRefDto> _files;
@override List<ProjectFileRefDto> get files {
  if (_files is EqualUnmodifiableListView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_files);
}

@override final  String? addressLine;
@override final  int? unitCount;
@override final  double? estimatedValue;
@override final  String? currency;
 final  List<ProjectStakeholderRefDto> _stakeholders;
@override@JsonKey() List<ProjectStakeholderRefDto> get stakeholders {
  if (_stakeholders is EqualUnmodifiableListView) return _stakeholders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stakeholders);
}

@override final  String? decisionMakerContactId;
@override final  String? notes;

/// Create a copy of RegisterProjectRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterProjectRequestCopyWith<_RegisterProjectRequest> get copyWith => __$RegisterProjectRequestCopyWithImpl<_RegisterProjectRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterProjectRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterProjectRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.buildingType, buildingType) || other.buildingType == buildingType)&&(identical(other.description, description) || other.description == description)&&(identical(other.location, location) || other.location == location)&&(identical(other.constructionPhase, constructionPhase) || other.constructionPhase == constructionPhase)&&const DeepCollectionEquality().equals(other._files, _files)&&(identical(other.addressLine, addressLine) || other.addressLine == addressLine)&&(identical(other.unitCount, unitCount) || other.unitCount == unitCount)&&(identical(other.estimatedValue, estimatedValue) || other.estimatedValue == estimatedValue)&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other._stakeholders, _stakeholders)&&(identical(other.decisionMakerContactId, decisionMakerContactId) || other.decisionMakerContactId == decisionMakerContactId)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,buildingType,description,location,constructionPhase,const DeepCollectionEquality().hash(_files),addressLine,unitCount,estimatedValue,currency,const DeepCollectionEquality().hash(_stakeholders),decisionMakerContactId,notes);

@override
String toString() {
  return 'RegisterProjectRequest(name: $name, buildingType: $buildingType, description: $description, location: $location, constructionPhase: $constructionPhase, files: $files, addressLine: $addressLine, unitCount: $unitCount, estimatedValue: $estimatedValue, currency: $currency, stakeholders: $stakeholders, decisionMakerContactId: $decisionMakerContactId, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$RegisterProjectRequestCopyWith<$Res> implements $RegisterProjectRequestCopyWith<$Res> {
  factory _$RegisterProjectRequestCopyWith(_RegisterProjectRequest value, $Res Function(_RegisterProjectRequest) _then) = __$RegisterProjectRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, BuildingType buildingType, String description, LocationDto location, ConstructionPhase constructionPhase, List<ProjectFileRefDto> files, String? addressLine, int? unitCount, double? estimatedValue, String? currency, List<ProjectStakeholderRefDto> stakeholders, String? decisionMakerContactId, String? notes
});


@override $LocationDtoCopyWith<$Res> get location;

}
/// @nodoc
class __$RegisterProjectRequestCopyWithImpl<$Res>
    implements _$RegisterProjectRequestCopyWith<$Res> {
  __$RegisterProjectRequestCopyWithImpl(this._self, this._then);

  final _RegisterProjectRequest _self;
  final $Res Function(_RegisterProjectRequest) _then;

/// Create a copy of RegisterProjectRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? buildingType = null,Object? description = null,Object? location = null,Object? constructionPhase = null,Object? files = null,Object? addressLine = freezed,Object? unitCount = freezed,Object? estimatedValue = freezed,Object? currency = freezed,Object? stakeholders = null,Object? decisionMakerContactId = freezed,Object? notes = freezed,}) {
  return _then(_RegisterProjectRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,buildingType: null == buildingType ? _self.buildingType : buildingType // ignore: cast_nullable_to_non_nullable
as BuildingType,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LocationDto,constructionPhase: null == constructionPhase ? _self.constructionPhase : constructionPhase // ignore: cast_nullable_to_non_nullable
as ConstructionPhase,files: null == files ? _self._files : files // ignore: cast_nullable_to_non_nullable
as List<ProjectFileRefDto>,addressLine: freezed == addressLine ? _self.addressLine : addressLine // ignore: cast_nullable_to_non_nullable
as String?,unitCount: freezed == unitCount ? _self.unitCount : unitCount // ignore: cast_nullable_to_non_nullable
as int?,estimatedValue: freezed == estimatedValue ? _self.estimatedValue : estimatedValue // ignore: cast_nullable_to_non_nullable
as double?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,stakeholders: null == stakeholders ? _self._stakeholders : stakeholders // ignore: cast_nullable_to_non_nullable
as List<ProjectStakeholderRefDto>,decisionMakerContactId: freezed == decisionMakerContactId ? _self.decisionMakerContactId : decisionMakerContactId // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of RegisterProjectRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationDtoCopyWith<$Res> get location {
  
  return $LocationDtoCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}

// dart format on
