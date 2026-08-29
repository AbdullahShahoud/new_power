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
mixin _$AccountClassificationView {

 String? get id; String? get accountId; AccountClassification get classification; bool get isAuthorized; DateTime? get authorizedAt; DateTime? get addedAt; DateTime? get removedAt; String? get removalReason;
/// Create a copy of AccountClassificationView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountClassificationViewCopyWith<AccountClassificationView> get copyWith => _$AccountClassificationViewCopyWithImpl<AccountClassificationView>(this as AccountClassificationView, _$identity);

  /// Serializes this AccountClassificationView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountClassificationView&&(identical(other.id, id) || other.id == id)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.classification, classification) || other.classification == classification)&&(identical(other.isAuthorized, isAuthorized) || other.isAuthorized == isAuthorized)&&(identical(other.authorizedAt, authorizedAt) || other.authorizedAt == authorizedAt)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.removedAt, removedAt) || other.removedAt == removedAt)&&(identical(other.removalReason, removalReason) || other.removalReason == removalReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accountId,classification,isAuthorized,authorizedAt,addedAt,removedAt,removalReason);

@override
String toString() {
  return 'AccountClassificationView(id: $id, accountId: $accountId, classification: $classification, isAuthorized: $isAuthorized, authorizedAt: $authorizedAt, addedAt: $addedAt, removedAt: $removedAt, removalReason: $removalReason)';
}


}

/// @nodoc
abstract mixin class $AccountClassificationViewCopyWith<$Res>  {
  factory $AccountClassificationViewCopyWith(AccountClassificationView value, $Res Function(AccountClassificationView) _then) = _$AccountClassificationViewCopyWithImpl;
@useResult
$Res call({
 String? id, String? accountId, AccountClassification classification, bool isAuthorized, DateTime? authorizedAt, DateTime? addedAt, DateTime? removedAt, String? removalReason
});




}
/// @nodoc
class _$AccountClassificationViewCopyWithImpl<$Res>
    implements $AccountClassificationViewCopyWith<$Res> {
  _$AccountClassificationViewCopyWithImpl(this._self, this._then);

  final AccountClassificationView _self;
  final $Res Function(AccountClassificationView) _then;

/// Create a copy of AccountClassificationView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? accountId = freezed,Object? classification = null,Object? isAuthorized = null,Object? authorizedAt = freezed,Object? addedAt = freezed,Object? removedAt = freezed,Object? removalReason = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String?,classification: null == classification ? _self.classification : classification // ignore: cast_nullable_to_non_nullable
as AccountClassification,isAuthorized: null == isAuthorized ? _self.isAuthorized : isAuthorized // ignore: cast_nullable_to_non_nullable
as bool,authorizedAt: freezed == authorizedAt ? _self.authorizedAt : authorizedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,addedAt: freezed == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,removedAt: freezed == removedAt ? _self.removedAt : removedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,removalReason: freezed == removalReason ? _self.removalReason : removalReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountClassificationView].
extension AccountClassificationViewPatterns on AccountClassificationView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountClassificationView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountClassificationView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountClassificationView value)  $default,){
final _that = this;
switch (_that) {
case _AccountClassificationView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountClassificationView value)?  $default,){
final _that = this;
switch (_that) {
case _AccountClassificationView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? accountId,  AccountClassification classification,  bool isAuthorized,  DateTime? authorizedAt,  DateTime? addedAt,  DateTime? removedAt,  String? removalReason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountClassificationView() when $default != null:
return $default(_that.id,_that.accountId,_that.classification,_that.isAuthorized,_that.authorizedAt,_that.addedAt,_that.removedAt,_that.removalReason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? accountId,  AccountClassification classification,  bool isAuthorized,  DateTime? authorizedAt,  DateTime? addedAt,  DateTime? removedAt,  String? removalReason)  $default,) {final _that = this;
switch (_that) {
case _AccountClassificationView():
return $default(_that.id,_that.accountId,_that.classification,_that.isAuthorized,_that.authorizedAt,_that.addedAt,_that.removedAt,_that.removalReason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? accountId,  AccountClassification classification,  bool isAuthorized,  DateTime? authorizedAt,  DateTime? addedAt,  DateTime? removedAt,  String? removalReason)?  $default,) {final _that = this;
switch (_that) {
case _AccountClassificationView() when $default != null:
return $default(_that.id,_that.accountId,_that.classification,_that.isAuthorized,_that.authorizedAt,_that.addedAt,_that.removedAt,_that.removalReason);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(converters: [UtcDateTimeConverter()])
class _AccountClassificationView implements AccountClassificationView {
  const _AccountClassificationView({this.id, this.accountId, required this.classification, this.isAuthorized = false, this.authorizedAt, this.addedAt, this.removedAt, this.removalReason});
  factory _AccountClassificationView.fromJson(Map<String, dynamic> json) => _$AccountClassificationViewFromJson(json);

@override final  String? id;
@override final  String? accountId;
@override final  AccountClassification classification;
@override@JsonKey() final  bool isAuthorized;
@override final  DateTime? authorizedAt;
@override final  DateTime? addedAt;
@override final  DateTime? removedAt;
@override final  String? removalReason;

/// Create a copy of AccountClassificationView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountClassificationViewCopyWith<_AccountClassificationView> get copyWith => __$AccountClassificationViewCopyWithImpl<_AccountClassificationView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountClassificationViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountClassificationView&&(identical(other.id, id) || other.id == id)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.classification, classification) || other.classification == classification)&&(identical(other.isAuthorized, isAuthorized) || other.isAuthorized == isAuthorized)&&(identical(other.authorizedAt, authorizedAt) || other.authorizedAt == authorizedAt)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.removedAt, removedAt) || other.removedAt == removedAt)&&(identical(other.removalReason, removalReason) || other.removalReason == removalReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accountId,classification,isAuthorized,authorizedAt,addedAt,removedAt,removalReason);

@override
String toString() {
  return 'AccountClassificationView(id: $id, accountId: $accountId, classification: $classification, isAuthorized: $isAuthorized, authorizedAt: $authorizedAt, addedAt: $addedAt, removedAt: $removedAt, removalReason: $removalReason)';
}


}

/// @nodoc
abstract mixin class _$AccountClassificationViewCopyWith<$Res> implements $AccountClassificationViewCopyWith<$Res> {
  factory _$AccountClassificationViewCopyWith(_AccountClassificationView value, $Res Function(_AccountClassificationView) _then) = __$AccountClassificationViewCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? accountId, AccountClassification classification, bool isAuthorized, DateTime? authorizedAt, DateTime? addedAt, DateTime? removedAt, String? removalReason
});




}
/// @nodoc
class __$AccountClassificationViewCopyWithImpl<$Res>
    implements _$AccountClassificationViewCopyWith<$Res> {
  __$AccountClassificationViewCopyWithImpl(this._self, this._then);

  final _AccountClassificationView _self;
  final $Res Function(_AccountClassificationView) _then;

/// Create a copy of AccountClassificationView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? accountId = freezed,Object? classification = null,Object? isAuthorized = null,Object? authorizedAt = freezed,Object? addedAt = freezed,Object? removedAt = freezed,Object? removalReason = freezed,}) {
  return _then(_AccountClassificationView(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String?,classification: null == classification ? _self.classification : classification // ignore: cast_nullable_to_non_nullable
as AccountClassification,isAuthorized: null == isAuthorized ? _self.isAuthorized : isAuthorized // ignore: cast_nullable_to_non_nullable
as bool,authorizedAt: freezed == authorizedAt ? _self.authorizedAt : authorizedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,addedAt: freezed == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,removedAt: freezed == removedAt ? _self.removedAt : removedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,removalReason: freezed == removalReason ? _self.removalReason : removalReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AccountView {

 String get id; String get name;// Falls back rather than throwing — see AccountType.unknown. One row the
// client cannot read must not fail the whole page.
// ignore: invalid_annotation_target
@JsonKey(unknownEnumValue: AccountType.unknown) AccountType get type; String? get registrationNumber; String? get phone; String? get email; String? get city; String? get addressLine; String? get notes; bool get isVerified; DateTime? get verifiedAt; String? get verifiedBy; ActorView? get verifiedByUser; int? get contactCount; int? get activeLinkCount; DateTime? get createdAt; DateTime? get updatedAt; DateTime? get archivedAt; String? get mergedIntoId; DateTime? get mergedAt; List<AccountClassificationView> get classifications;
/// Create a copy of AccountView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountViewCopyWith<AccountView> get copyWith => _$AccountViewCopyWithImpl<AccountView>(this as AccountView, _$identity);

  /// Serializes this AccountView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountView&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.registrationNumber, registrationNumber) || other.registrationNumber == registrationNumber)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.city, city) || other.city == city)&&(identical(other.addressLine, addressLine) || other.addressLine == addressLine)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.verifiedAt, verifiedAt) || other.verifiedAt == verifiedAt)&&(identical(other.verifiedBy, verifiedBy) || other.verifiedBy == verifiedBy)&&(identical(other.verifiedByUser, verifiedByUser) || other.verifiedByUser == verifiedByUser)&&(identical(other.contactCount, contactCount) || other.contactCount == contactCount)&&(identical(other.activeLinkCount, activeLinkCount) || other.activeLinkCount == activeLinkCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.archivedAt, archivedAt) || other.archivedAt == archivedAt)&&(identical(other.mergedIntoId, mergedIntoId) || other.mergedIntoId == mergedIntoId)&&(identical(other.mergedAt, mergedAt) || other.mergedAt == mergedAt)&&const DeepCollectionEquality().equals(other.classifications, classifications));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,type,registrationNumber,phone,email,city,addressLine,notes,isVerified,verifiedAt,verifiedBy,verifiedByUser,contactCount,activeLinkCount,createdAt,updatedAt,archivedAt,mergedIntoId,mergedAt,const DeepCollectionEquality().hash(classifications)]);

@override
String toString() {
  return 'AccountView(id: $id, name: $name, type: $type, registrationNumber: $registrationNumber, phone: $phone, email: $email, city: $city, addressLine: $addressLine, notes: $notes, isVerified: $isVerified, verifiedAt: $verifiedAt, verifiedBy: $verifiedBy, verifiedByUser: $verifiedByUser, contactCount: $contactCount, activeLinkCount: $activeLinkCount, createdAt: $createdAt, updatedAt: $updatedAt, archivedAt: $archivedAt, mergedIntoId: $mergedIntoId, mergedAt: $mergedAt, classifications: $classifications)';
}


}

/// @nodoc
abstract mixin class $AccountViewCopyWith<$Res>  {
  factory $AccountViewCopyWith(AccountView value, $Res Function(AccountView) _then) = _$AccountViewCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(unknownEnumValue: AccountType.unknown) AccountType type, String? registrationNumber, String? phone, String? email, String? city, String? addressLine, String? notes, bool isVerified, DateTime? verifiedAt, String? verifiedBy, ActorView? verifiedByUser, int? contactCount, int? activeLinkCount, DateTime? createdAt, DateTime? updatedAt, DateTime? archivedAt, String? mergedIntoId, DateTime? mergedAt, List<AccountClassificationView> classifications
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? registrationNumber = freezed,Object? phone = freezed,Object? email = freezed,Object? city = freezed,Object? addressLine = freezed,Object? notes = freezed,Object? isVerified = null,Object? verifiedAt = freezed,Object? verifiedBy = freezed,Object? verifiedByUser = freezed,Object? contactCount = freezed,Object? activeLinkCount = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? archivedAt = freezed,Object? mergedIntoId = freezed,Object? mergedAt = freezed,Object? classifications = null,}) {
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
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,archivedAt: freezed == archivedAt ? _self.archivedAt : archivedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,mergedIntoId: freezed == mergedIntoId ? _self.mergedIntoId : mergedIntoId // ignore: cast_nullable_to_non_nullable
as String?,mergedAt: freezed == mergedAt ? _self.mergedAt : mergedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,classifications: null == classifications ? _self.classifications : classifications // ignore: cast_nullable_to_non_nullable
as List<AccountClassificationView>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(unknownEnumValue: AccountType.unknown)  AccountType type,  String? registrationNumber,  String? phone,  String? email,  String? city,  String? addressLine,  String? notes,  bool isVerified,  DateTime? verifiedAt,  String? verifiedBy,  ActorView? verifiedByUser,  int? contactCount,  int? activeLinkCount,  DateTime? createdAt,  DateTime? updatedAt,  DateTime? archivedAt,  String? mergedIntoId,  DateTime? mergedAt,  List<AccountClassificationView> classifications)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountView() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.registrationNumber,_that.phone,_that.email,_that.city,_that.addressLine,_that.notes,_that.isVerified,_that.verifiedAt,_that.verifiedBy,_that.verifiedByUser,_that.contactCount,_that.activeLinkCount,_that.createdAt,_that.updatedAt,_that.archivedAt,_that.mergedIntoId,_that.mergedAt,_that.classifications);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(unknownEnumValue: AccountType.unknown)  AccountType type,  String? registrationNumber,  String? phone,  String? email,  String? city,  String? addressLine,  String? notes,  bool isVerified,  DateTime? verifiedAt,  String? verifiedBy,  ActorView? verifiedByUser,  int? contactCount,  int? activeLinkCount,  DateTime? createdAt,  DateTime? updatedAt,  DateTime? archivedAt,  String? mergedIntoId,  DateTime? mergedAt,  List<AccountClassificationView> classifications)  $default,) {final _that = this;
switch (_that) {
case _AccountView():
return $default(_that.id,_that.name,_that.type,_that.registrationNumber,_that.phone,_that.email,_that.city,_that.addressLine,_that.notes,_that.isVerified,_that.verifiedAt,_that.verifiedBy,_that.verifiedByUser,_that.contactCount,_that.activeLinkCount,_that.createdAt,_that.updatedAt,_that.archivedAt,_that.mergedIntoId,_that.mergedAt,_that.classifications);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(unknownEnumValue: AccountType.unknown)  AccountType type,  String? registrationNumber,  String? phone,  String? email,  String? city,  String? addressLine,  String? notes,  bool isVerified,  DateTime? verifiedAt,  String? verifiedBy,  ActorView? verifiedByUser,  int? contactCount,  int? activeLinkCount,  DateTime? createdAt,  DateTime? updatedAt,  DateTime? archivedAt,  String? mergedIntoId,  DateTime? mergedAt,  List<AccountClassificationView> classifications)?  $default,) {final _that = this;
switch (_that) {
case _AccountView() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.registrationNumber,_that.phone,_that.email,_that.city,_that.addressLine,_that.notes,_that.isVerified,_that.verifiedAt,_that.verifiedBy,_that.verifiedByUser,_that.contactCount,_that.activeLinkCount,_that.createdAt,_that.updatedAt,_that.archivedAt,_that.mergedIntoId,_that.mergedAt,_that.classifications);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(converters: [UtcDateTimeConverter()])
class _AccountView implements AccountView {
  const _AccountView({required this.id, required this.name, @JsonKey(unknownEnumValue: AccountType.unknown) this.type = AccountType.unknown, this.registrationNumber, this.phone, this.email, this.city, this.addressLine, this.notes, required this.isVerified, this.verifiedAt, this.verifiedBy, this.verifiedByUser, this.contactCount, this.activeLinkCount, this.createdAt, this.updatedAt, this.archivedAt, this.mergedIntoId, this.mergedAt, final  List<AccountClassificationView> classifications = const <AccountClassificationView>[]}): _classifications = classifications;
  factory _AccountView.fromJson(Map<String, dynamic> json) => _$AccountViewFromJson(json);

@override final  String id;
@override final  String name;
// Falls back rather than throwing — see AccountType.unknown. One row the
// client cannot read must not fail the whole page.
// ignore: invalid_annotation_target
@override@JsonKey(unknownEnumValue: AccountType.unknown) final  AccountType type;
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
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override final  DateTime? archivedAt;
@override final  String? mergedIntoId;
@override final  DateTime? mergedAt;
 final  List<AccountClassificationView> _classifications;
@override@JsonKey() List<AccountClassificationView> get classifications {
  if (_classifications is EqualUnmodifiableListView) return _classifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_classifications);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountView&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.registrationNumber, registrationNumber) || other.registrationNumber == registrationNumber)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.city, city) || other.city == city)&&(identical(other.addressLine, addressLine) || other.addressLine == addressLine)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.verifiedAt, verifiedAt) || other.verifiedAt == verifiedAt)&&(identical(other.verifiedBy, verifiedBy) || other.verifiedBy == verifiedBy)&&(identical(other.verifiedByUser, verifiedByUser) || other.verifiedByUser == verifiedByUser)&&(identical(other.contactCount, contactCount) || other.contactCount == contactCount)&&(identical(other.activeLinkCount, activeLinkCount) || other.activeLinkCount == activeLinkCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.archivedAt, archivedAt) || other.archivedAt == archivedAt)&&(identical(other.mergedIntoId, mergedIntoId) || other.mergedIntoId == mergedIntoId)&&(identical(other.mergedAt, mergedAt) || other.mergedAt == mergedAt)&&const DeepCollectionEquality().equals(other._classifications, _classifications));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,type,registrationNumber,phone,email,city,addressLine,notes,isVerified,verifiedAt,verifiedBy,verifiedByUser,contactCount,activeLinkCount,createdAt,updatedAt,archivedAt,mergedIntoId,mergedAt,const DeepCollectionEquality().hash(_classifications)]);

@override
String toString() {
  return 'AccountView(id: $id, name: $name, type: $type, registrationNumber: $registrationNumber, phone: $phone, email: $email, city: $city, addressLine: $addressLine, notes: $notes, isVerified: $isVerified, verifiedAt: $verifiedAt, verifiedBy: $verifiedBy, verifiedByUser: $verifiedByUser, contactCount: $contactCount, activeLinkCount: $activeLinkCount, createdAt: $createdAt, updatedAt: $updatedAt, archivedAt: $archivedAt, mergedIntoId: $mergedIntoId, mergedAt: $mergedAt, classifications: $classifications)';
}


}

/// @nodoc
abstract mixin class _$AccountViewCopyWith<$Res> implements $AccountViewCopyWith<$Res> {
  factory _$AccountViewCopyWith(_AccountView value, $Res Function(_AccountView) _then) = __$AccountViewCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(unknownEnumValue: AccountType.unknown) AccountType type, String? registrationNumber, String? phone, String? email, String? city, String? addressLine, String? notes, bool isVerified, DateTime? verifiedAt, String? verifiedBy, ActorView? verifiedByUser, int? contactCount, int? activeLinkCount, DateTime? createdAt, DateTime? updatedAt, DateTime? archivedAt, String? mergedIntoId, DateTime? mergedAt, List<AccountClassificationView> classifications
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? registrationNumber = freezed,Object? phone = freezed,Object? email = freezed,Object? city = freezed,Object? addressLine = freezed,Object? notes = freezed,Object? isVerified = null,Object? verifiedAt = freezed,Object? verifiedBy = freezed,Object? verifiedByUser = freezed,Object? contactCount = freezed,Object? activeLinkCount = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? archivedAt = freezed,Object? mergedIntoId = freezed,Object? mergedAt = freezed,Object? classifications = null,}) {
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
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,archivedAt: freezed == archivedAt ? _self.archivedAt : archivedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,mergedIntoId: freezed == mergedIntoId ? _self.mergedIntoId : mergedIntoId // ignore: cast_nullable_to_non_nullable
as String?,mergedAt: freezed == mergedAt ? _self.mergedAt : mergedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,classifications: null == classifications ? _self._classifications : classifications // ignore: cast_nullable_to_non_nullable
as List<AccountClassificationView>,
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
