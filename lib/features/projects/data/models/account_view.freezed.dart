// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountView {

 String get id; String get name; AccountType get type; String? get registrationNumber; String? get phone; String? get email; String? get city; String? get addressLine; String? get notes; bool get isVerified; DateTime? get verifiedAt; String? get verifiedBy; ActorView? get verifiedByUser; int? get contactCount; int? get activeLinkCount; DateTime? get archivedAt;
/// Create a copy of AccountView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountViewCopyWith<AccountView> get copyWith => _$AccountViewCopyWithImpl<AccountView>(this as AccountView, _$identity);

  /// Serializes this AccountView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountView&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.registrationNumber, registrationNumber) || other.registrationNumber == registrationNumber)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.city, city) || other.city == city)&&(identical(other.addressLine, addressLine) || other.addressLine == addressLine)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.verifiedAt, verifiedAt) || other.verifiedAt == verifiedAt)&&(identical(other.verifiedBy, verifiedBy) || other.verifiedBy == verifiedBy)&&(identical(other.verifiedByUser, verifiedByUser) || other.verifiedByUser == verifiedByUser)&&(identical(other.contactCount, contactCount) || other.contactCount == contactCount)&&(identical(other.activeLinkCount, activeLinkCount) || other.activeLinkCount == activeLinkCount)&&(identical(other.archivedAt, archivedAt) || other.archivedAt == archivedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,registrationNumber,phone,email,city,addressLine,notes,isVerified,verifiedAt,verifiedBy,verifiedByUser,contactCount,activeLinkCount,archivedAt);

@override
String toString() {
  return 'AccountView(id: $id, name: $name, type: $type, registrationNumber: $registrationNumber, phone: $phone, email: $email, city: $city, addressLine: $addressLine, notes: $notes, isVerified: $isVerified, verifiedAt: $verifiedAt, verifiedBy: $verifiedBy, verifiedByUser: $verifiedByUser, contactCount: $contactCount, activeLinkCount: $activeLinkCount, archivedAt: $archivedAt)';
}


}

/// @nodoc
abstract mixin class $AccountViewCopyWith<$Res>  {
  factory $AccountViewCopyWith(AccountView value, $Res Function(AccountView) _then) = _$AccountViewCopyWithImpl;
@useResult
$Res call({
 String id, String name, AccountType type, String? registrationNumber, String? phone, String? email, String? city, String? addressLine, String? notes, bool isVerified, DateTime? verifiedAt, String? verifiedBy, ActorView? verifiedByUser, int? contactCount, int? activeLinkCount, DateTime? archivedAt
});


$ActorViewCopyWith<$Res>? get verifiedByUser;

}
/// @nodoc
class _$AccountViewCopyWithImpl<$Res>
    implements $AccountViewCopyWith<$Res> {
  _$AccountViewCopyWithImpl(this._self, this._then);

  final AccountView _self;
  final $Res Function(AccountView) _then;

/// Create a copy of AccountView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? registrationNumber = freezed,Object? phone = freezed,Object? email = freezed,Object? city = freezed,Object? addressLine = freezed,Object? notes = freezed,Object? isVerified = null,Object? verifiedAt = freezed,Object? verifiedBy = freezed,Object? verifiedByUser = freezed,Object? contactCount = freezed,Object? activeLinkCount = freezed,Object? archivedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AccountType,registrationNumber: freezed == registrationNumber ? _self.registrationNumber : registrationNumber // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,addressLine: freezed == addressLine ? _self.addressLine : addressLine // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,verifiedAt: freezed == verifiedAt ? _self.verifiedAt : verifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,verifiedBy: freezed == verifiedBy ? _self.verifiedBy : verifiedBy // ignore: cast_nullable_to_non_nullable
as String?,verifiedByUser: freezed == verifiedByUser ? _self.verifiedByUser : verifiedByUser // ignore: cast_nullable_to_non_nullable
as ActorView?,contactCount: freezed == contactCount ? _self.contactCount : contactCount // ignore: cast_nullable_to_non_nullable
as int?,activeLinkCount: freezed == activeLinkCount ? _self.activeLinkCount : activeLinkCount // ignore: cast_nullable_to_non_nullable
as int?,archivedAt: freezed == archivedAt ? _self.archivedAt : archivedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of AccountView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActorViewCopyWith<$Res>? get verifiedByUser {
    if (_self.verifiedByUser == null) {
    return null;
  }

  return $ActorViewCopyWith<$Res>(_self.verifiedByUser!, (value) {
    return _then(_self.copyWith(verifiedByUser: value));
  });
}
}


/// Adds pattern-matching-related methods to [AccountView].
extension AccountViewPatterns on AccountView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountView value)  $default,){
final _that = this;
switch (_that) {
case _AccountView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountView value)?  $default,){
final _that = this;
switch (_that) {
case _AccountView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  AccountType type,  String? registrationNumber,  String? phone,  String? email,  String? city,  String? addressLine,  String? notes,  bool isVerified,  DateTime? verifiedAt,  String? verifiedBy,  ActorView? verifiedByUser,  int? contactCount,  int? activeLinkCount,  DateTime? archivedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountView() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.registrationNumber,_that.phone,_that.email,_that.city,_that.addressLine,_that.notes,_that.isVerified,_that.verifiedAt,_that.verifiedBy,_that.verifiedByUser,_that.contactCount,_that.activeLinkCount,_that.archivedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  AccountType type,  String? registrationNumber,  String? phone,  String? email,  String? city,  String? addressLine,  String? notes,  bool isVerified,  DateTime? verifiedAt,  String? verifiedBy,  ActorView? verifiedByUser,  int? contactCount,  int? activeLinkCount,  DateTime? archivedAt)  $default,) {final _that = this;
switch (_that) {
case _AccountView():
return $default(_that.id,_that.name,_that.type,_that.registrationNumber,_that.phone,_that.email,_that.city,_that.addressLine,_that.notes,_that.isVerified,_that.verifiedAt,_that.verifiedBy,_that.verifiedByUser,_that.contactCount,_that.activeLinkCount,_that.archivedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  AccountType type,  String? registrationNumber,  String? phone,  String? email,  String? city,  String? addressLine,  String? notes,  bool isVerified,  DateTime? verifiedAt,  String? verifiedBy,  ActorView? verifiedByUser,  int? contactCount,  int? activeLinkCount,  DateTime? archivedAt)?  $default,) {final _that = this;
switch (_that) {
case _AccountView() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.registrationNumber,_that.phone,_that.email,_that.city,_that.addressLine,_that.notes,_that.isVerified,_that.verifiedAt,_that.verifiedBy,_that.verifiedByUser,_that.contactCount,_that.activeLinkCount,_that.archivedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(converters: [UtcDateTimeConverter()])
class _AccountView implements AccountView {
  const _AccountView({required this.id, required this.name, required this.type, this.registrationNumber, this.phone, this.email, this.city, this.addressLine, this.notes, required this.isVerified, this.verifiedAt, this.verifiedBy, this.verifiedByUser, this.contactCount, this.activeLinkCount, this.archivedAt});
  factory _AccountView.fromJson(Map<String, dynamic> json) => _$AccountViewFromJson(json);

@override final  String id;
@override final  String name;
@override final  AccountType type;
@override final  String? registrationNumber;
@override final  String? phone;
@override final  String? email;
@override final  String? city;
@override final  String? addressLine;
@override final  String? notes;
@override final  bool isVerified;
@override final  DateTime? verifiedAt;
@override final  String? verifiedBy;
@override final  ActorView? verifiedByUser;
@override final  int? contactCount;
@override final  int? activeLinkCount;
@override final  DateTime? archivedAt;

/// Create a copy of AccountView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountViewCopyWith<_AccountView> get copyWith => __$AccountViewCopyWithImpl<_AccountView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountView&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.registrationNumber, registrationNumber) || other.registrationNumber == registrationNumber)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.city, city) || other.city == city)&&(identical(other.addressLine, addressLine) || other.addressLine == addressLine)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.verifiedAt, verifiedAt) || other.verifiedAt == verifiedAt)&&(identical(other.verifiedBy, verifiedBy) || other.verifiedBy == verifiedBy)&&(identical(other.verifiedByUser, verifiedByUser) || other.verifiedByUser == verifiedByUser)&&(identical(other.contactCount, contactCount) || other.contactCount == contactCount)&&(identical(other.activeLinkCount, activeLinkCount) || other.activeLinkCount == activeLinkCount)&&(identical(other.archivedAt, archivedAt) || other.archivedAt == archivedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,registrationNumber,phone,email,city,addressLine,notes,isVerified,verifiedAt,verifiedBy,verifiedByUser,contactCount,activeLinkCount,archivedAt);

@override
String toString() {
  return 'AccountView(id: $id, name: $name, type: $type, registrationNumber: $registrationNumber, phone: $phone, email: $email, city: $city, addressLine: $addressLine, notes: $notes, isVerified: $isVerified, verifiedAt: $verifiedAt, verifiedBy: $verifiedBy, verifiedByUser: $verifiedByUser, contactCount: $contactCount, activeLinkCount: $activeLinkCount, archivedAt: $archivedAt)';
}


}

/// @nodoc
abstract mixin class _$AccountViewCopyWith<$Res> implements $AccountViewCopyWith<$Res> {
  factory _$AccountViewCopyWith(_AccountView value, $Res Function(_AccountView) _then) = __$AccountViewCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, AccountType type, String? registrationNumber, String? phone, String? email, String? city, String? addressLine, String? notes, bool isVerified, DateTime? verifiedAt, String? verifiedBy, ActorView? verifiedByUser, int? contactCount, int? activeLinkCount, DateTime? archivedAt
});


@override $ActorViewCopyWith<$Res>? get verifiedByUser;

}
/// @nodoc
class __$AccountViewCopyWithImpl<$Res>
    implements _$AccountViewCopyWith<$Res> {
  __$AccountViewCopyWithImpl(this._self, this._then);

  final _AccountView _self;
  final $Res Function(_AccountView) _then;

/// Create a copy of AccountView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? registrationNumber = freezed,Object? phone = freezed,Object? email = freezed,Object? city = freezed,Object? addressLine = freezed,Object? notes = freezed,Object? isVerified = null,Object? verifiedAt = freezed,Object? verifiedBy = freezed,Object? verifiedByUser = freezed,Object? contactCount = freezed,Object? activeLinkCount = freezed,Object? archivedAt = freezed,}) {
  return _then(_AccountView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AccountType,registrationNumber: freezed == registrationNumber ? _self.registrationNumber : registrationNumber // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,addressLine: freezed == addressLine ? _self.addressLine : addressLine // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,verifiedAt: freezed == verifiedAt ? _self.verifiedAt : verifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,verifiedBy: freezed == verifiedBy ? _self.verifiedBy : verifiedBy // ignore: cast_nullable_to_non_nullable
as String?,verifiedByUser: freezed == verifiedByUser ? _self.verifiedByUser : verifiedByUser // ignore: cast_nullable_to_non_nullable
as ActorView?,contactCount: freezed == contactCount ? _self.contactCount : contactCount // ignore: cast_nullable_to_non_nullable
as int?,activeLinkCount: freezed == activeLinkCount ? _self.activeLinkCount : activeLinkCount // ignore: cast_nullable_to_non_nullable
as int?,archivedAt: freezed == archivedAt ? _self.archivedAt : archivedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of AccountView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActorViewCopyWith<$Res>? get verifiedByUser {
    if (_self.verifiedByUser == null) {
    return null;
  }

  return $ActorViewCopyWith<$Res>(_self.verifiedByUser!, (value) {
    return _then(_self.copyWith(verifiedByUser: value));
  });
}
}

// dart format on
