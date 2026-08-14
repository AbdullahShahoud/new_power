// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_account_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewAccountContact {

 String get firstName; String get lastName; String? get position; String? get phone; String? get email; String? get notes; bool get isPrimary;
/// Create a copy of NewAccountContact
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewAccountContactCopyWith<NewAccountContact> get copyWith => _$NewAccountContactCopyWithImpl<NewAccountContact>(this as NewAccountContact, _$identity);

  /// Serializes this NewAccountContact to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewAccountContact&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.position, position) || other.position == position)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isPrimary, isPrimary) || other.isPrimary == isPrimary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,position,phone,email,notes,isPrimary);

@override
String toString() {
  return 'NewAccountContact(firstName: $firstName, lastName: $lastName, position: $position, phone: $phone, email: $email, notes: $notes, isPrimary: $isPrimary)';
}


}

/// @nodoc
abstract mixin class $NewAccountContactCopyWith<$Res>  {
  factory $NewAccountContactCopyWith(NewAccountContact value, $Res Function(NewAccountContact) _then) = _$NewAccountContactCopyWithImpl;
@useResult
$Res call({
 String firstName, String lastName, String? position, String? phone, String? email, String? notes, bool isPrimary
});




}
/// @nodoc
class _$NewAccountContactCopyWithImpl<$Res>
    implements $NewAccountContactCopyWith<$Res> {
  _$NewAccountContactCopyWithImpl(this._self, this._then);

  final NewAccountContact _self;
  final $Res Function(NewAccountContact) _then;

/// Create a copy of NewAccountContact
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = null,Object? lastName = null,Object? position = freezed,Object? phone = freezed,Object? email = freezed,Object? notes = freezed,Object? isPrimary = null,}) {
  return _then(_self.copyWith(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isPrimary: null == isPrimary ? _self.isPrimary : isPrimary // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [NewAccountContact].
extension NewAccountContactPatterns on NewAccountContact {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewAccountContact value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewAccountContact() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewAccountContact value)  $default,){
final _that = this;
switch (_that) {
case _NewAccountContact():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewAccountContact value)?  $default,){
final _that = this;
switch (_that) {
case _NewAccountContact() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String firstName,  String lastName,  String? position,  String? phone,  String? email,  String? notes,  bool isPrimary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewAccountContact() when $default != null:
return $default(_that.firstName,_that.lastName,_that.position,_that.phone,_that.email,_that.notes,_that.isPrimary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String firstName,  String lastName,  String? position,  String? phone,  String? email,  String? notes,  bool isPrimary)  $default,) {final _that = this;
switch (_that) {
case _NewAccountContact():
return $default(_that.firstName,_that.lastName,_that.position,_that.phone,_that.email,_that.notes,_that.isPrimary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String firstName,  String lastName,  String? position,  String? phone,  String? email,  String? notes,  bool isPrimary)?  $default,) {final _that = this;
switch (_that) {
case _NewAccountContact() when $default != null:
return $default(_that.firstName,_that.lastName,_that.position,_that.phone,_that.email,_that.notes,_that.isPrimary);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _NewAccountContact implements NewAccountContact {
  const _NewAccountContact({required this.firstName, required this.lastName, this.position, this.phone, this.email, this.notes, this.isPrimary = false});
  factory _NewAccountContact.fromJson(Map<String, dynamic> json) => _$NewAccountContactFromJson(json);

@override final  String firstName;
@override final  String lastName;
@override final  String? position;
@override final  String? phone;
@override final  String? email;
@override final  String? notes;
@override@JsonKey() final  bool isPrimary;

/// Create a copy of NewAccountContact
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewAccountContactCopyWith<_NewAccountContact> get copyWith => __$NewAccountContactCopyWithImpl<_NewAccountContact>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NewAccountContactToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewAccountContact&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.position, position) || other.position == position)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isPrimary, isPrimary) || other.isPrimary == isPrimary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,position,phone,email,notes,isPrimary);

@override
String toString() {
  return 'NewAccountContact(firstName: $firstName, lastName: $lastName, position: $position, phone: $phone, email: $email, notes: $notes, isPrimary: $isPrimary)';
}


}

/// @nodoc
abstract mixin class _$NewAccountContactCopyWith<$Res> implements $NewAccountContactCopyWith<$Res> {
  factory _$NewAccountContactCopyWith(_NewAccountContact value, $Res Function(_NewAccountContact) _then) = __$NewAccountContactCopyWithImpl;
@override @useResult
$Res call({
 String firstName, String lastName, String? position, String? phone, String? email, String? notes, bool isPrimary
});




}
/// @nodoc
class __$NewAccountContactCopyWithImpl<$Res>
    implements _$NewAccountContactCopyWith<$Res> {
  __$NewAccountContactCopyWithImpl(this._self, this._then);

  final _NewAccountContact _self;
  final $Res Function(_NewAccountContact) _then;

/// Create a copy of NewAccountContact
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = null,Object? lastName = null,Object? position = freezed,Object? phone = freezed,Object? email = freezed,Object? notes = freezed,Object? isPrimary = null,}) {
  return _then(_NewAccountContact(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isPrimary: null == isPrimary ? _self.isPrimary : isPrimary // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$RegisterAccountRequest {

 String get name; AccountType get type; String? get registrationNumber; String? get phone; String? get email; String? get city; String? get addressLine; String? get notes; AccountClassification? get classification; List<NewAccountContact> get contacts;
/// Create a copy of RegisterAccountRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterAccountRequestCopyWith<RegisterAccountRequest> get copyWith => _$RegisterAccountRequestCopyWithImpl<RegisterAccountRequest>(this as RegisterAccountRequest, _$identity);

  /// Serializes this RegisterAccountRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterAccountRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.registrationNumber, registrationNumber) || other.registrationNumber == registrationNumber)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.city, city) || other.city == city)&&(identical(other.addressLine, addressLine) || other.addressLine == addressLine)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.classification, classification) || other.classification == classification)&&const DeepCollectionEquality().equals(other.contacts, contacts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,type,registrationNumber,phone,email,city,addressLine,notes,classification,const DeepCollectionEquality().hash(contacts));

@override
String toString() {
  return 'RegisterAccountRequest(name: $name, type: $type, registrationNumber: $registrationNumber, phone: $phone, email: $email, city: $city, addressLine: $addressLine, notes: $notes, classification: $classification, contacts: $contacts)';
}


}

/// @nodoc
abstract mixin class $RegisterAccountRequestCopyWith<$Res>  {
  factory $RegisterAccountRequestCopyWith(RegisterAccountRequest value, $Res Function(RegisterAccountRequest) _then) = _$RegisterAccountRequestCopyWithImpl;
@useResult
$Res call({
 String name, AccountType type, String? registrationNumber, String? phone, String? email, String? city, String? addressLine, String? notes, AccountClassification? classification, List<NewAccountContact> contacts
});




}
/// @nodoc
class _$RegisterAccountRequestCopyWithImpl<$Res>
    implements $RegisterAccountRequestCopyWith<$Res> {
  _$RegisterAccountRequestCopyWithImpl(this._self, this._then);

  final RegisterAccountRequest _self;
  final $Res Function(RegisterAccountRequest) _then;

/// Create a copy of RegisterAccountRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? type = null,Object? registrationNumber = freezed,Object? phone = freezed,Object? email = freezed,Object? city = freezed,Object? addressLine = freezed,Object? notes = freezed,Object? classification = freezed,Object? contacts = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AccountType,registrationNumber: freezed == registrationNumber ? _self.registrationNumber : registrationNumber // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,addressLine: freezed == addressLine ? _self.addressLine : addressLine // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,classification: freezed == classification ? _self.classification : classification // ignore: cast_nullable_to_non_nullable
as AccountClassification?,contacts: null == contacts ? _self.contacts : contacts // ignore: cast_nullable_to_non_nullable
as List<NewAccountContact>,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterAccountRequest].
extension RegisterAccountRequestPatterns on RegisterAccountRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterAccountRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterAccountRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterAccountRequest value)  $default,){
final _that = this;
switch (_that) {
case _RegisterAccountRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterAccountRequest value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterAccountRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  AccountType type,  String? registrationNumber,  String? phone,  String? email,  String? city,  String? addressLine,  String? notes,  AccountClassification? classification,  List<NewAccountContact> contacts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterAccountRequest() when $default != null:
return $default(_that.name,_that.type,_that.registrationNumber,_that.phone,_that.email,_that.city,_that.addressLine,_that.notes,_that.classification,_that.contacts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  AccountType type,  String? registrationNumber,  String? phone,  String? email,  String? city,  String? addressLine,  String? notes,  AccountClassification? classification,  List<NewAccountContact> contacts)  $default,) {final _that = this;
switch (_that) {
case _RegisterAccountRequest():
return $default(_that.name,_that.type,_that.registrationNumber,_that.phone,_that.email,_that.city,_that.addressLine,_that.notes,_that.classification,_that.contacts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  AccountType type,  String? registrationNumber,  String? phone,  String? email,  String? city,  String? addressLine,  String? notes,  AccountClassification? classification,  List<NewAccountContact> contacts)?  $default,) {final _that = this;
switch (_that) {
case _RegisterAccountRequest() when $default != null:
return $default(_that.name,_that.type,_that.registrationNumber,_that.phone,_that.email,_that.city,_that.addressLine,_that.notes,_that.classification,_that.contacts);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _RegisterAccountRequest implements RegisterAccountRequest {
  const _RegisterAccountRequest({required this.name, this.type = AccountType.company, this.registrationNumber, this.phone, this.email, this.city, this.addressLine, this.notes, this.classification, final  List<NewAccountContact> contacts = const <NewAccountContact>[]}): _contacts = contacts;
  factory _RegisterAccountRequest.fromJson(Map<String, dynamic> json) => _$RegisterAccountRequestFromJson(json);

@override final  String name;
@override@JsonKey() final  AccountType type;
@override final  String? registrationNumber;
@override final  String? phone;
@override final  String? email;
@override final  String? city;
@override final  String? addressLine;
@override final  String? notes;
@override final  AccountClassification? classification;
 final  List<NewAccountContact> _contacts;
@override@JsonKey() List<NewAccountContact> get contacts {
  if (_contacts is EqualUnmodifiableListView) return _contacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contacts);
}


/// Create a copy of RegisterAccountRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterAccountRequestCopyWith<_RegisterAccountRequest> get copyWith => __$RegisterAccountRequestCopyWithImpl<_RegisterAccountRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterAccountRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterAccountRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.registrationNumber, registrationNumber) || other.registrationNumber == registrationNumber)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.city, city) || other.city == city)&&(identical(other.addressLine, addressLine) || other.addressLine == addressLine)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.classification, classification) || other.classification == classification)&&const DeepCollectionEquality().equals(other._contacts, _contacts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,type,registrationNumber,phone,email,city,addressLine,notes,classification,const DeepCollectionEquality().hash(_contacts));

@override
String toString() {
  return 'RegisterAccountRequest(name: $name, type: $type, registrationNumber: $registrationNumber, phone: $phone, email: $email, city: $city, addressLine: $addressLine, notes: $notes, classification: $classification, contacts: $contacts)';
}


}

/// @nodoc
abstract mixin class _$RegisterAccountRequestCopyWith<$Res> implements $RegisterAccountRequestCopyWith<$Res> {
  factory _$RegisterAccountRequestCopyWith(_RegisterAccountRequest value, $Res Function(_RegisterAccountRequest) _then) = __$RegisterAccountRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, AccountType type, String? registrationNumber, String? phone, String? email, String? city, String? addressLine, String? notes, AccountClassification? classification, List<NewAccountContact> contacts
});




}
/// @nodoc
class __$RegisterAccountRequestCopyWithImpl<$Res>
    implements _$RegisterAccountRequestCopyWith<$Res> {
  __$RegisterAccountRequestCopyWithImpl(this._self, this._then);

  final _RegisterAccountRequest _self;
  final $Res Function(_RegisterAccountRequest) _then;

/// Create a copy of RegisterAccountRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? type = null,Object? registrationNumber = freezed,Object? phone = freezed,Object? email = freezed,Object? city = freezed,Object? addressLine = freezed,Object? notes = freezed,Object? classification = freezed,Object? contacts = null,}) {
  return _then(_RegisterAccountRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AccountType,registrationNumber: freezed == registrationNumber ? _self.registrationNumber : registrationNumber // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,addressLine: freezed == addressLine ? _self.addressLine : addressLine // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,classification: freezed == classification ? _self.classification : classification // ignore: cast_nullable_to_non_nullable
as AccountClassification?,contacts: null == contacts ? _self._contacts : contacts // ignore: cast_nullable_to_non_nullable
as List<NewAccountContact>,
  ));
}


}

// dart format on
