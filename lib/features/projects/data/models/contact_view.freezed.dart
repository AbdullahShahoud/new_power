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
mixin _$ContactView {

 String get id; String get accountId; String get firstName; String get lastName; String? get position; String? get phone; String? get email; bool get isPrimary; DateTime? get archivedAt;
/// Create a copy of ContactView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactViewCopyWith<ContactView> get copyWith => _$ContactViewCopyWithImpl<ContactView>(this as ContactView, _$identity);

  /// Serializes this ContactView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactView&&(identical(other.id, id) || other.id == id)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.position, position) || other.position == position)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.isPrimary, isPrimary) || other.isPrimary == isPrimary)&&(identical(other.archivedAt, archivedAt) || other.archivedAt == archivedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accountId,firstName,lastName,position,phone,email,isPrimary,archivedAt);

@override
String toString() {
  return 'ContactView(id: $id, accountId: $accountId, firstName: $firstName, lastName: $lastName, position: $position, phone: $phone, email: $email, isPrimary: $isPrimary, archivedAt: $archivedAt)';
}


}

/// @nodoc
abstract mixin class $ContactViewCopyWith<$Res>  {
  factory $ContactViewCopyWith(ContactView value, $Res Function(ContactView) _then) = _$ContactViewCopyWithImpl;
@useResult
$Res call({
 String id, String accountId, String firstName, String lastName, String? position, String? phone, String? email, bool isPrimary, DateTime? archivedAt
});




}
/// @nodoc
class _$ContactViewCopyWithImpl<$Res>
    implements $ContactViewCopyWith<$Res> {
  _$ContactViewCopyWithImpl(this._self, this._then);

  final ContactView _self;
  final $Res Function(ContactView) _then;

/// Create a copy of ContactView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? accountId = null,Object? firstName = null,Object? lastName = null,Object? position = freezed,Object? phone = freezed,Object? email = freezed,Object? isPrimary = null,Object? archivedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,isPrimary: null == isPrimary ? _self.isPrimary : isPrimary // ignore: cast_nullable_to_non_nullable
as bool,archivedAt: freezed == archivedAt ? _self.archivedAt : archivedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String accountId,  String firstName,  String lastName,  String? position,  String? phone,  String? email,  bool isPrimary,  DateTime? archivedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContactView() when $default != null:
return $default(_that.id,_that.accountId,_that.firstName,_that.lastName,_that.position,_that.phone,_that.email,_that.isPrimary,_that.archivedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String accountId,  String firstName,  String lastName,  String? position,  String? phone,  String? email,  bool isPrimary,  DateTime? archivedAt)  $default,) {final _that = this;
switch (_that) {
case _ContactView():
return $default(_that.id,_that.accountId,_that.firstName,_that.lastName,_that.position,_that.phone,_that.email,_that.isPrimary,_that.archivedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String accountId,  String firstName,  String lastName,  String? position,  String? phone,  String? email,  bool isPrimary,  DateTime? archivedAt)?  $default,) {final _that = this;
switch (_that) {
case _ContactView() when $default != null:
return $default(_that.id,_that.accountId,_that.firstName,_that.lastName,_that.position,_that.phone,_that.email,_that.isPrimary,_that.archivedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContactView implements ContactView {
  const _ContactView({required this.id, required this.accountId, required this.firstName, required this.lastName, this.position, this.phone, this.email, this.isPrimary = false, this.archivedAt});
  factory _ContactView.fromJson(Map<String, dynamic> json) => _$ContactViewFromJson(json);

@override final  String id;
@override final  String accountId;
@override final  String firstName;
@override final  String lastName;
@override final  String? position;
@override final  String? phone;
@override final  String? email;
@override@JsonKey() final  bool isPrimary;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContactView&&(identical(other.id, id) || other.id == id)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.position, position) || other.position == position)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.isPrimary, isPrimary) || other.isPrimary == isPrimary)&&(identical(other.archivedAt, archivedAt) || other.archivedAt == archivedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accountId,firstName,lastName,position,phone,email,isPrimary,archivedAt);

@override
String toString() {
  return 'ContactView(id: $id, accountId: $accountId, firstName: $firstName, lastName: $lastName, position: $position, phone: $phone, email: $email, isPrimary: $isPrimary, archivedAt: $archivedAt)';
}


}

/// @nodoc
abstract mixin class _$ContactViewCopyWith<$Res> implements $ContactViewCopyWith<$Res> {
  factory _$ContactViewCopyWith(_ContactView value, $Res Function(_ContactView) _then) = __$ContactViewCopyWithImpl;
@override @useResult
$Res call({
 String id, String accountId, String firstName, String lastName, String? position, String? phone, String? email, bool isPrimary, DateTime? archivedAt
});




}
/// @nodoc
class __$ContactViewCopyWithImpl<$Res>
    implements _$ContactViewCopyWith<$Res> {
  __$ContactViewCopyWithImpl(this._self, this._then);

  final _ContactView _self;
  final $Res Function(_ContactView) _then;

/// Create a copy of ContactView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? accountId = null,Object? firstName = null,Object? lastName = null,Object? position = freezed,Object? phone = freezed,Object? email = freezed,Object? isPrimary = null,Object? archivedAt = freezed,}) {
  return _then(_ContactView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,isPrimary: null == isPrimary ? _self.isPrimary : isPrimary // ignore: cast_nullable_to_non_nullable
as bool,archivedAt: freezed == archivedAt ? _self.archivedAt : archivedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
