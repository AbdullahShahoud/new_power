// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContactAccountRefView {

 String get id; String get name; AccountType get type;
/// Create a copy of ContactAccountRefView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactAccountRefViewCopyWith<ContactAccountRefView> get copyWith => _$ContactAccountRefViewCopyWithImpl<ContactAccountRefView>(this as ContactAccountRefView, _$identity);

  /// Serializes this ContactAccountRefView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactAccountRefView&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type);

@override
String toString() {
  return 'ContactAccountRefView(id: $id, name: $name, type: $type)';
}


}

/// @nodoc
abstract mixin class $ContactAccountRefViewCopyWith<$Res>  {
  factory $ContactAccountRefViewCopyWith(ContactAccountRefView value, $Res Function(ContactAccountRefView) _then) = _$ContactAccountRefViewCopyWithImpl;
@useResult
$Res call({
 String id, String name, AccountType type
});




}
/// @nodoc
class _$ContactAccountRefViewCopyWithImpl<$Res>
    implements $ContactAccountRefViewCopyWith<$Res> {
  _$ContactAccountRefViewCopyWithImpl(this._self, this._then);

  final ContactAccountRefView _self;
  final $Res Function(ContactAccountRefView) _then;

/// Create a copy of ContactAccountRefView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AccountType,
  ));
}

}


/// Adds pattern-matching-related methods to [ContactAccountRefView].
extension ContactAccountRefViewPatterns on ContactAccountRefView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContactAccountRefView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContactAccountRefView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContactAccountRefView value)  $default,){
final _that = this;
switch (_that) {
case _ContactAccountRefView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContactAccountRefView value)?  $default,){
final _that = this;
switch (_that) {
case _ContactAccountRefView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  AccountType type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContactAccountRefView() when $default != null:
return $default(_that.id,_that.name,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  AccountType type)  $default,) {final _that = this;
switch (_that) {
case _ContactAccountRefView():
return $default(_that.id,_that.name,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  AccountType type)?  $default,) {final _that = this;
switch (_that) {
case _ContactAccountRefView() when $default != null:
return $default(_that.id,_that.name,_that.type);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(converters: [UtcDateTimeConverter()])
class _ContactAccountRefView implements ContactAccountRefView {
  const _ContactAccountRefView({required this.id, required this.name, required this.type});
  factory _ContactAccountRefView.fromJson(Map<String, dynamic> json) => _$ContactAccountRefViewFromJson(json);

@override final  String id;
@override final  String name;
@override final  AccountType type;

/// Create a copy of ContactAccountRefView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactAccountRefViewCopyWith<_ContactAccountRefView> get copyWith => __$ContactAccountRefViewCopyWithImpl<_ContactAccountRefView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContactAccountRefViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContactAccountRefView&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type);

@override
String toString() {
  return 'ContactAccountRefView(id: $id, name: $name, type: $type)';
}


}

/// @nodoc
abstract mixin class _$ContactAccountRefViewCopyWith<$Res> implements $ContactAccountRefViewCopyWith<$Res> {
  factory _$ContactAccountRefViewCopyWith(_ContactAccountRefView value, $Res Function(_ContactAccountRefView) _then) = __$ContactAccountRefViewCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, AccountType type
});




}
/// @nodoc
class __$ContactAccountRefViewCopyWithImpl<$Res>
    implements _$ContactAccountRefViewCopyWith<$Res> {
  __$ContactAccountRefViewCopyWithImpl(this._self, this._then);

  final _ContactAccountRefView _self;
  final $Res Function(_ContactAccountRefView) _then;

/// Create a copy of ContactAccountRefView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,}) {
  return _then(_ContactAccountRefView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AccountType,
  ));
}


}


/// @nodoc
mixin _$ContactView {

 String get id; String? get accountId; ContactAccountRefView? get account; String? get company; String get firstName; String get lastName; String? get position; String? get phone; String? get email; String? get notes; bool get isPrimary; DateTime? get createdAt; DateTime? get updatedAt; DateTime? get archivedAt;
/// Create a copy of ContactView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactViewCopyWith<ContactView> get copyWith => _$ContactViewCopyWithImpl<ContactView>(this as ContactView, _$identity);

  /// Serializes this ContactView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactView&&(identical(other.id, id) || other.id == id)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.account, account) || other.account == account)&&(identical(other.company, company) || other.company == company)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.position, position) || other.position == position)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isPrimary, isPrimary) || other.isPrimary == isPrimary)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.archivedAt, archivedAt) || other.archivedAt == archivedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accountId,account,company,firstName,lastName,position,phone,email,notes,isPrimary,createdAt,updatedAt,archivedAt);

@override
String toString() {
  return 'ContactView(id: $id, accountId: $accountId, account: $account, company: $company, firstName: $firstName, lastName: $lastName, position: $position, phone: $phone, email: $email, notes: $notes, isPrimary: $isPrimary, createdAt: $createdAt, updatedAt: $updatedAt, archivedAt: $archivedAt)';
}


}

/// @nodoc
abstract mixin class $ContactViewCopyWith<$Res>  {
  factory $ContactViewCopyWith(ContactView value, $Res Function(ContactView) _then) = _$ContactViewCopyWithImpl;
@useResult
$Res call({
 String id, String? accountId, ContactAccountRefView? account, String? company, String firstName, String lastName, String? position, String? phone, String? email, String? notes, bool isPrimary, DateTime? createdAt, DateTime? updatedAt, DateTime? archivedAt
});


$ContactAccountRefViewCopyWith<$Res>? get account;

}
/// @nodoc
class _$ContactViewCopyWithImpl<$Res>
    implements $ContactViewCopyWith<$Res> {
  _$ContactViewCopyWithImpl(this._self, this._then);

  final ContactView _self;
  final $Res Function(ContactView) _then;

/// Create a copy of ContactView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? accountId = freezed,Object? account = freezed,Object? company = freezed,Object? firstName = null,Object? lastName = null,Object? position = freezed,Object? phone = freezed,Object? email = freezed,Object? notes = freezed,Object? isPrimary = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? archivedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String?,account: freezed == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as ContactAccountRefView?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isPrimary: null == isPrimary ? _self.isPrimary : isPrimary // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,archivedAt: freezed == archivedAt ? _self.archivedAt : archivedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of ContactView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContactAccountRefViewCopyWith<$Res>? get account {
    if (_self.account == null) {
    return null;
  }

  return $ContactAccountRefViewCopyWith<$Res>(_self.account!, (value) {
    return _then(_self.copyWith(account: value));
  });
}
}


/// Adds pattern-matching-related methods to [ContactView].
extension ContactViewPatterns on ContactView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContactView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContactView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContactView value)  $default,){
final _that = this;
switch (_that) {
case _ContactView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContactView value)?  $default,){
final _that = this;
switch (_that) {
case _ContactView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? accountId,  ContactAccountRefView? account,  String? company,  String firstName,  String lastName,  String? position,  String? phone,  String? email,  String? notes,  bool isPrimary,  DateTime? createdAt,  DateTime? updatedAt,  DateTime? archivedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContactView() when $default != null:
return $default(_that.id,_that.accountId,_that.account,_that.company,_that.firstName,_that.lastName,_that.position,_that.phone,_that.email,_that.notes,_that.isPrimary,_that.createdAt,_that.updatedAt,_that.archivedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? accountId,  ContactAccountRefView? account,  String? company,  String firstName,  String lastName,  String? position,  String? phone,  String? email,  String? notes,  bool isPrimary,  DateTime? createdAt,  DateTime? updatedAt,  DateTime? archivedAt)  $default,) {final _that = this;
switch (_that) {
case _ContactView():
return $default(_that.id,_that.accountId,_that.account,_that.company,_that.firstName,_that.lastName,_that.position,_that.phone,_that.email,_that.notes,_that.isPrimary,_that.createdAt,_that.updatedAt,_that.archivedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? accountId,  ContactAccountRefView? account,  String? company,  String firstName,  String lastName,  String? position,  String? phone,  String? email,  String? notes,  bool isPrimary,  DateTime? createdAt,  DateTime? updatedAt,  DateTime? archivedAt)?  $default,) {final _that = this;
switch (_that) {
case _ContactView() when $default != null:
return $default(_that.id,_that.accountId,_that.account,_that.company,_that.firstName,_that.lastName,_that.position,_that.phone,_that.email,_that.notes,_that.isPrimary,_that.createdAt,_that.updatedAt,_that.archivedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(converters: [UtcDateTimeConverter()])
class _ContactView implements ContactView {
  const _ContactView({required this.id, this.accountId, this.account, this.company, required this.firstName, required this.lastName, this.position, this.phone, this.email, this.notes, this.isPrimary = false, this.createdAt, this.updatedAt, this.archivedAt});
  factory _ContactView.fromJson(Map<String, dynamic> json) => _$ContactViewFromJson(json);

@override final  String id;
@override final  String? accountId;
@override final  ContactAccountRefView? account;
@override final  String? company;
@override final  String firstName;
@override final  String lastName;
@override final  String? position;
@override final  String? phone;
@override final  String? email;
@override final  String? notes;
@override@JsonKey() final  bool isPrimary;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override final  DateTime? archivedAt;

/// Create a copy of ContactView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactViewCopyWith<_ContactView> get copyWith => __$ContactViewCopyWithImpl<_ContactView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContactViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContactView&&(identical(other.id, id) || other.id == id)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.account, account) || other.account == account)&&(identical(other.company, company) || other.company == company)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.position, position) || other.position == position)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isPrimary, isPrimary) || other.isPrimary == isPrimary)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.archivedAt, archivedAt) || other.archivedAt == archivedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accountId,account,company,firstName,lastName,position,phone,email,notes,isPrimary,createdAt,updatedAt,archivedAt);

@override
String toString() {
  return 'ContactView(id: $id, accountId: $accountId, account: $account, company: $company, firstName: $firstName, lastName: $lastName, position: $position, phone: $phone, email: $email, notes: $notes, isPrimary: $isPrimary, createdAt: $createdAt, updatedAt: $updatedAt, archivedAt: $archivedAt)';
}


}

/// @nodoc
abstract mixin class _$ContactViewCopyWith<$Res> implements $ContactViewCopyWith<$Res> {
  factory _$ContactViewCopyWith(_ContactView value, $Res Function(_ContactView) _then) = __$ContactViewCopyWithImpl;
@override @useResult
$Res call({
 String id, String? accountId, ContactAccountRefView? account, String? company, String firstName, String lastName, String? position, String? phone, String? email, String? notes, bool isPrimary, DateTime? createdAt, DateTime? updatedAt, DateTime? archivedAt
});


@override $ContactAccountRefViewCopyWith<$Res>? get account;

}
/// @nodoc
class __$ContactViewCopyWithImpl<$Res>
    implements _$ContactViewCopyWith<$Res> {
  __$ContactViewCopyWithImpl(this._self, this._then);

  final _ContactView _self;
  final $Res Function(_ContactView) _then;

/// Create a copy of ContactView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? accountId = freezed,Object? account = freezed,Object? company = freezed,Object? firstName = null,Object? lastName = null,Object? position = freezed,Object? phone = freezed,Object? email = freezed,Object? notes = freezed,Object? isPrimary = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? archivedAt = freezed,}) {
  return _then(_ContactView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String?,account: freezed == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as ContactAccountRefView?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isPrimary: null == isPrimary ? _self.isPrimary : isPrimary // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,archivedAt: freezed == archivedAt ? _self.archivedAt : archivedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of ContactView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContactAccountRefViewCopyWith<$Res>? get account {
    if (_self.account == null) {
    return null;
  }

  return $ContactAccountRefViewCopyWith<$Res>(_self.account!, (value) {
    return _then(_self.copyWith(account: value));
  });
}
}

// dart format on
