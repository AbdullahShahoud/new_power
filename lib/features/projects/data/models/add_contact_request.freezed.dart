// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_contact_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddContactRequest {

 String get firstName; String get lastName; String? get accountId; String? get company; String? get position; String? get phone; String? get email; String? get notes; bool get isPrimary;
/// Create a copy of AddContactRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddContactRequestCopyWith<AddContactRequest> get copyWith => _$AddContactRequestCopyWithImpl<AddContactRequest>(this as AddContactRequest, _$identity);

  /// Serializes this AddContactRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddContactRequest&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.company, company) || other.company == company)&&(identical(other.position, position) || other.position == position)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isPrimary, isPrimary) || other.isPrimary == isPrimary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,accountId,company,position,phone,email,notes,isPrimary);

@override
String toString() {
  return 'AddContactRequest(firstName: $firstName, lastName: $lastName, accountId: $accountId, company: $company, position: $position, phone: $phone, email: $email, notes: $notes, isPrimary: $isPrimary)';
}


}

/// @nodoc
abstract mixin class $AddContactRequestCopyWith<$Res>  {
  factory $AddContactRequestCopyWith(AddContactRequest value, $Res Function(AddContactRequest) _then) = _$AddContactRequestCopyWithImpl;
@useResult
$Res call({
 String firstName, String lastName, String? accountId, String? company, String? position, String? phone, String? email, String? notes, bool isPrimary
});




}
/// @nodoc
class _$AddContactRequestCopyWithImpl<$Res>
    implements $AddContactRequestCopyWith<$Res> {
  _$AddContactRequestCopyWithImpl(this._self, this._then);

  final AddContactRequest _self;
  final $Res Function(AddContactRequest) _then;

/// Create a copy of AddContactRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = null,Object? lastName = null,Object? accountId = freezed,Object? company = freezed,Object? position = freezed,Object? phone = freezed,Object? email = freezed,Object? notes = freezed,Object? isPrimary = null,}) {
  return _then(_self.copyWith(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isPrimary: null == isPrimary ? _self.isPrimary : isPrimary // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AddContactRequest].
extension AddContactRequestPatterns on AddContactRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddContactRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddContactRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddContactRequest value)  $default,){
final _that = this;
switch (_that) {
case _AddContactRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddContactRequest value)?  $default,){
final _that = this;
switch (_that) {
case _AddContactRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String firstName,  String lastName,  String? accountId,  String? company,  String? position,  String? phone,  String? email,  String? notes,  bool isPrimary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddContactRequest() when $default != null:
return $default(_that.firstName,_that.lastName,_that.accountId,_that.company,_that.position,_that.phone,_that.email,_that.notes,_that.isPrimary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String firstName,  String lastName,  String? accountId,  String? company,  String? position,  String? phone,  String? email,  String? notes,  bool isPrimary)  $default,) {final _that = this;
switch (_that) {
case _AddContactRequest():
return $default(_that.firstName,_that.lastName,_that.accountId,_that.company,_that.position,_that.phone,_that.email,_that.notes,_that.isPrimary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String firstName,  String lastName,  String? accountId,  String? company,  String? position,  String? phone,  String? email,  String? notes,  bool isPrimary)?  $default,) {final _that = this;
switch (_that) {
case _AddContactRequest() when $default != null:
return $default(_that.firstName,_that.lastName,_that.accountId,_that.company,_that.position,_that.phone,_that.email,_that.notes,_that.isPrimary);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _AddContactRequest implements AddContactRequest {
  const _AddContactRequest({required this.firstName, required this.lastName, this.accountId, this.company, this.position, this.phone, this.email, this.notes, this.isPrimary = false});
  factory _AddContactRequest.fromJson(Map<String, dynamic> json) => _$AddContactRequestFromJson(json);

@override final  String firstName;
@override final  String lastName;
@override final  String? accountId;
@override final  String? company;
@override final  String? position;
@override final  String? phone;
@override final  String? email;
@override final  String? notes;
@override@JsonKey() final  bool isPrimary;

/// Create a copy of AddContactRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddContactRequestCopyWith<_AddContactRequest> get copyWith => __$AddContactRequestCopyWithImpl<_AddContactRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddContactRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddContactRequest&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.company, company) || other.company == company)&&(identical(other.position, position) || other.position == position)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isPrimary, isPrimary) || other.isPrimary == isPrimary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,accountId,company,position,phone,email,notes,isPrimary);

@override
String toString() {
  return 'AddContactRequest(firstName: $firstName, lastName: $lastName, accountId: $accountId, company: $company, position: $position, phone: $phone, email: $email, notes: $notes, isPrimary: $isPrimary)';
}


}

/// @nodoc
abstract mixin class _$AddContactRequestCopyWith<$Res> implements $AddContactRequestCopyWith<$Res> {
  factory _$AddContactRequestCopyWith(_AddContactRequest value, $Res Function(_AddContactRequest) _then) = __$AddContactRequestCopyWithImpl;
@override @useResult
$Res call({
 String firstName, String lastName, String? accountId, String? company, String? position, String? phone, String? email, String? notes, bool isPrimary
});




}
/// @nodoc
class __$AddContactRequestCopyWithImpl<$Res>
    implements _$AddContactRequestCopyWith<$Res> {
  __$AddContactRequestCopyWithImpl(this._self, this._then);

  final _AddContactRequest _self;
  final $Res Function(_AddContactRequest) _then;

/// Create a copy of AddContactRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = null,Object? lastName = null,Object? accountId = freezed,Object? company = freezed,Object? position = freezed,Object? phone = freezed,Object? email = freezed,Object? notes = freezed,Object? isPrimary = null,}) {
  return _then(_AddContactRequest(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isPrimary: null == isPrimary ? _self.isPrimary : isPrimary // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$ClassifyAccountRequest {

 String get classification;
/// Create a copy of ClassifyAccountRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClassifyAccountRequestCopyWith<ClassifyAccountRequest> get copyWith => _$ClassifyAccountRequestCopyWithImpl<ClassifyAccountRequest>(this as ClassifyAccountRequest, _$identity);

  /// Serializes this ClassifyAccountRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClassifyAccountRequest&&(identical(other.classification, classification) || other.classification == classification));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,classification);

@override
String toString() {
  return 'ClassifyAccountRequest(classification: $classification)';
}


}

/// @nodoc
abstract mixin class $ClassifyAccountRequestCopyWith<$Res>  {
  factory $ClassifyAccountRequestCopyWith(ClassifyAccountRequest value, $Res Function(ClassifyAccountRequest) _then) = _$ClassifyAccountRequestCopyWithImpl;
@useResult
$Res call({
 String classification
});




}
/// @nodoc
class _$ClassifyAccountRequestCopyWithImpl<$Res>
    implements $ClassifyAccountRequestCopyWith<$Res> {
  _$ClassifyAccountRequestCopyWithImpl(this._self, this._then);

  final ClassifyAccountRequest _self;
  final $Res Function(ClassifyAccountRequest) _then;

/// Create a copy of ClassifyAccountRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? classification = null,}) {
  return _then(_self.copyWith(
classification: null == classification ? _self.classification : classification // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ClassifyAccountRequest].
extension ClassifyAccountRequestPatterns on ClassifyAccountRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClassifyAccountRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClassifyAccountRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClassifyAccountRequest value)  $default,){
final _that = this;
switch (_that) {
case _ClassifyAccountRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClassifyAccountRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ClassifyAccountRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String classification)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClassifyAccountRequest() when $default != null:
return $default(_that.classification);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String classification)  $default,) {final _that = this;
switch (_that) {
case _ClassifyAccountRequest():
return $default(_that.classification);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String classification)?  $default,) {final _that = this;
switch (_that) {
case _ClassifyAccountRequest() when $default != null:
return $default(_that.classification);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClassifyAccountRequest implements ClassifyAccountRequest {
  const _ClassifyAccountRequest({required this.classification});
  factory _ClassifyAccountRequest.fromJson(Map<String, dynamic> json) => _$ClassifyAccountRequestFromJson(json);

@override final  String classification;

/// Create a copy of ClassifyAccountRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClassifyAccountRequestCopyWith<_ClassifyAccountRequest> get copyWith => __$ClassifyAccountRequestCopyWithImpl<_ClassifyAccountRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClassifyAccountRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClassifyAccountRequest&&(identical(other.classification, classification) || other.classification == classification));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,classification);

@override
String toString() {
  return 'ClassifyAccountRequest(classification: $classification)';
}


}

/// @nodoc
abstract mixin class _$ClassifyAccountRequestCopyWith<$Res> implements $ClassifyAccountRequestCopyWith<$Res> {
  factory _$ClassifyAccountRequestCopyWith(_ClassifyAccountRequest value, $Res Function(_ClassifyAccountRequest) _then) = __$ClassifyAccountRequestCopyWithImpl;
@override @useResult
$Res call({
 String classification
});




}
/// @nodoc
class __$ClassifyAccountRequestCopyWithImpl<$Res>
    implements _$ClassifyAccountRequestCopyWith<$Res> {
  __$ClassifyAccountRequestCopyWithImpl(this._self, this._then);

  final _ClassifyAccountRequest _self;
  final $Res Function(_ClassifyAccountRequest) _then;

/// Create a copy of ClassifyAccountRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? classification = null,}) {
  return _then(_ClassifyAccountRequest(
classification: null == classification ? _self.classification : classification // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
