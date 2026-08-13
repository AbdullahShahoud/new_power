// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stakeholder_link_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StakeholderLinkAccountView {

 String get id; String get name; String get type;
/// Create a copy of StakeholderLinkAccountView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StakeholderLinkAccountViewCopyWith<StakeholderLinkAccountView> get copyWith => _$StakeholderLinkAccountViewCopyWithImpl<StakeholderLinkAccountView>(this as StakeholderLinkAccountView, _$identity);

  /// Serializes this StakeholderLinkAccountView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StakeholderLinkAccountView&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type);

@override
String toString() {
  return 'StakeholderLinkAccountView(id: $id, name: $name, type: $type)';
}


}

/// @nodoc
abstract mixin class $StakeholderLinkAccountViewCopyWith<$Res>  {
  factory $StakeholderLinkAccountViewCopyWith(StakeholderLinkAccountView value, $Res Function(StakeholderLinkAccountView) _then) = _$StakeholderLinkAccountViewCopyWithImpl;
@useResult
$Res call({
 String id, String name, String type
});




}
/// @nodoc
class _$StakeholderLinkAccountViewCopyWithImpl<$Res>
    implements $StakeholderLinkAccountViewCopyWith<$Res> {
  _$StakeholderLinkAccountViewCopyWithImpl(this._self, this._then);

  final StakeholderLinkAccountView _self;
  final $Res Function(StakeholderLinkAccountView) _then;

/// Create a copy of StakeholderLinkAccountView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StakeholderLinkAccountView].
extension StakeholderLinkAccountViewPatterns on StakeholderLinkAccountView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StakeholderLinkAccountView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StakeholderLinkAccountView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StakeholderLinkAccountView value)  $default,){
final _that = this;
switch (_that) {
case _StakeholderLinkAccountView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StakeholderLinkAccountView value)?  $default,){
final _that = this;
switch (_that) {
case _StakeholderLinkAccountView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StakeholderLinkAccountView() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String type)  $default,) {final _that = this;
switch (_that) {
case _StakeholderLinkAccountView():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String type)?  $default,) {final _that = this;
switch (_that) {
case _StakeholderLinkAccountView() when $default != null:
return $default(_that.id,_that.name,_that.type);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(converters: [UtcDateTimeConverter()])
class _StakeholderLinkAccountView implements StakeholderLinkAccountView {
  const _StakeholderLinkAccountView({required this.id, required this.name, required this.type});
  factory _StakeholderLinkAccountView.fromJson(Map<String, dynamic> json) => _$StakeholderLinkAccountViewFromJson(json);

@override final  String id;
@override final  String name;
@override final  String type;

/// Create a copy of StakeholderLinkAccountView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StakeholderLinkAccountViewCopyWith<_StakeholderLinkAccountView> get copyWith => __$StakeholderLinkAccountViewCopyWithImpl<_StakeholderLinkAccountView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StakeholderLinkAccountViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StakeholderLinkAccountView&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type);

@override
String toString() {
  return 'StakeholderLinkAccountView(id: $id, name: $name, type: $type)';
}


}

/// @nodoc
abstract mixin class _$StakeholderLinkAccountViewCopyWith<$Res> implements $StakeholderLinkAccountViewCopyWith<$Res> {
  factory _$StakeholderLinkAccountViewCopyWith(_StakeholderLinkAccountView value, $Res Function(_StakeholderLinkAccountView) _then) = __$StakeholderLinkAccountViewCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String type
});




}
/// @nodoc
class __$StakeholderLinkAccountViewCopyWithImpl<$Res>
    implements _$StakeholderLinkAccountViewCopyWith<$Res> {
  __$StakeholderLinkAccountViewCopyWithImpl(this._self, this._then);

  final _StakeholderLinkAccountView _self;
  final $Res Function(_StakeholderLinkAccountView) _then;

/// Create a copy of StakeholderLinkAccountView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,}) {
  return _then(_StakeholderLinkAccountView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$StakeholderLinkContactView {

 String get id; String get accountId; String get firstName; String get lastName; String? get position; String? get phone; String? get email;
/// Create a copy of StakeholderLinkContactView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StakeholderLinkContactViewCopyWith<StakeholderLinkContactView> get copyWith => _$StakeholderLinkContactViewCopyWithImpl<StakeholderLinkContactView>(this as StakeholderLinkContactView, _$identity);

  /// Serializes this StakeholderLinkContactView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StakeholderLinkContactView&&(identical(other.id, id) || other.id == id)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.position, position) || other.position == position)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accountId,firstName,lastName,position,phone,email);

@override
String toString() {
  return 'StakeholderLinkContactView(id: $id, accountId: $accountId, firstName: $firstName, lastName: $lastName, position: $position, phone: $phone, email: $email)';
}


}

/// @nodoc
abstract mixin class $StakeholderLinkContactViewCopyWith<$Res>  {
  factory $StakeholderLinkContactViewCopyWith(StakeholderLinkContactView value, $Res Function(StakeholderLinkContactView) _then) = _$StakeholderLinkContactViewCopyWithImpl;
@useResult
$Res call({
 String id, String accountId, String firstName, String lastName, String? position, String? phone, String? email
});




}
/// @nodoc
class _$StakeholderLinkContactViewCopyWithImpl<$Res>
    implements $StakeholderLinkContactViewCopyWith<$Res> {
  _$StakeholderLinkContactViewCopyWithImpl(this._self, this._then);

  final StakeholderLinkContactView _self;
  final $Res Function(StakeholderLinkContactView) _then;

/// Create a copy of StakeholderLinkContactView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? accountId = null,Object? firstName = null,Object? lastName = null,Object? position = freezed,Object? phone = freezed,Object? email = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [StakeholderLinkContactView].
extension StakeholderLinkContactViewPatterns on StakeholderLinkContactView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StakeholderLinkContactView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StakeholderLinkContactView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StakeholderLinkContactView value)  $default,){
final _that = this;
switch (_that) {
case _StakeholderLinkContactView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StakeholderLinkContactView value)?  $default,){
final _that = this;
switch (_that) {
case _StakeholderLinkContactView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String accountId,  String firstName,  String lastName,  String? position,  String? phone,  String? email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StakeholderLinkContactView() when $default != null:
return $default(_that.id,_that.accountId,_that.firstName,_that.lastName,_that.position,_that.phone,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String accountId,  String firstName,  String lastName,  String? position,  String? phone,  String? email)  $default,) {final _that = this;
switch (_that) {
case _StakeholderLinkContactView():
return $default(_that.id,_that.accountId,_that.firstName,_that.lastName,_that.position,_that.phone,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String accountId,  String firstName,  String lastName,  String? position,  String? phone,  String? email)?  $default,) {final _that = this;
switch (_that) {
case _StakeholderLinkContactView() when $default != null:
return $default(_that.id,_that.accountId,_that.firstName,_that.lastName,_that.position,_that.phone,_that.email);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(converters: [UtcDateTimeConverter()])
class _StakeholderLinkContactView implements StakeholderLinkContactView {
  const _StakeholderLinkContactView({required this.id, required this.accountId, required this.firstName, required this.lastName, this.position, this.phone, this.email});
  factory _StakeholderLinkContactView.fromJson(Map<String, dynamic> json) => _$StakeholderLinkContactViewFromJson(json);

@override final  String id;
@override final  String accountId;
@override final  String firstName;
@override final  String lastName;
@override final  String? position;
@override final  String? phone;
@override final  String? email;

/// Create a copy of StakeholderLinkContactView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StakeholderLinkContactViewCopyWith<_StakeholderLinkContactView> get copyWith => __$StakeholderLinkContactViewCopyWithImpl<_StakeholderLinkContactView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StakeholderLinkContactViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StakeholderLinkContactView&&(identical(other.id, id) || other.id == id)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.position, position) || other.position == position)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accountId,firstName,lastName,position,phone,email);

@override
String toString() {
  return 'StakeholderLinkContactView(id: $id, accountId: $accountId, firstName: $firstName, lastName: $lastName, position: $position, phone: $phone, email: $email)';
}


}

/// @nodoc
abstract mixin class _$StakeholderLinkContactViewCopyWith<$Res> implements $StakeholderLinkContactViewCopyWith<$Res> {
  factory _$StakeholderLinkContactViewCopyWith(_StakeholderLinkContactView value, $Res Function(_StakeholderLinkContactView) _then) = __$StakeholderLinkContactViewCopyWithImpl;
@override @useResult
$Res call({
 String id, String accountId, String firstName, String lastName, String? position, String? phone, String? email
});




}
/// @nodoc
class __$StakeholderLinkContactViewCopyWithImpl<$Res>
    implements _$StakeholderLinkContactViewCopyWith<$Res> {
  __$StakeholderLinkContactViewCopyWithImpl(this._self, this._then);

  final _StakeholderLinkContactView _self;
  final $Res Function(_StakeholderLinkContactView) _then;

/// Create a copy of StakeholderLinkContactView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? accountId = null,Object? firstName = null,Object? lastName = null,Object? position = freezed,Object? phone = freezed,Object? email = freezed,}) {
  return _then(_StakeholderLinkContactView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
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
mixin _$StakeholderLinkView {

 String get id; String get projectId; String get accountId; StakeholderLinkAccountView get account; StakeholderRole get role; String? get primaryContactId; StakeholderLinkContactView? get primaryContact; String? get note; DateTime get startedAt; DateTime? get endedAt; String? get endReason; String? get replacedByLinkId; bool get isActive;
/// Create a copy of StakeholderLinkView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StakeholderLinkViewCopyWith<StakeholderLinkView> get copyWith => _$StakeholderLinkViewCopyWithImpl<StakeholderLinkView>(this as StakeholderLinkView, _$identity);

  /// Serializes this StakeholderLinkView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StakeholderLinkView&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.account, account) || other.account == account)&&(identical(other.role, role) || other.role == role)&&(identical(other.primaryContactId, primaryContactId) || other.primaryContactId == primaryContactId)&&(identical(other.primaryContact, primaryContact) || other.primaryContact == primaryContact)&&(identical(other.note, note) || other.note == note)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.endReason, endReason) || other.endReason == endReason)&&(identical(other.replacedByLinkId, replacedByLinkId) || other.replacedByLinkId == replacedByLinkId)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,projectId,accountId,account,role,primaryContactId,primaryContact,note,startedAt,endedAt,endReason,replacedByLinkId,isActive);

@override
String toString() {
  return 'StakeholderLinkView(id: $id, projectId: $projectId, accountId: $accountId, account: $account, role: $role, primaryContactId: $primaryContactId, primaryContact: $primaryContact, note: $note, startedAt: $startedAt, endedAt: $endedAt, endReason: $endReason, replacedByLinkId: $replacedByLinkId, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $StakeholderLinkViewCopyWith<$Res>  {
  factory $StakeholderLinkViewCopyWith(StakeholderLinkView value, $Res Function(StakeholderLinkView) _then) = _$StakeholderLinkViewCopyWithImpl;
@useResult
$Res call({
 String id, String projectId, String accountId, StakeholderLinkAccountView account, StakeholderRole role, String? primaryContactId, StakeholderLinkContactView? primaryContact, String? note, DateTime startedAt, DateTime? endedAt, String? endReason, String? replacedByLinkId, bool isActive
});


$StakeholderLinkAccountViewCopyWith<$Res> get account;$StakeholderLinkContactViewCopyWith<$Res>? get primaryContact;

}
/// @nodoc
class _$StakeholderLinkViewCopyWithImpl<$Res>
    implements $StakeholderLinkViewCopyWith<$Res> {
  _$StakeholderLinkViewCopyWithImpl(this._self, this._then);

  final StakeholderLinkView _self;
  final $Res Function(StakeholderLinkView) _then;

/// Create a copy of StakeholderLinkView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? projectId = null,Object? accountId = null,Object? account = null,Object? role = null,Object? primaryContactId = freezed,Object? primaryContact = freezed,Object? note = freezed,Object? startedAt = null,Object? endedAt = freezed,Object? endReason = freezed,Object? replacedByLinkId = freezed,Object? isActive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as StakeholderLinkAccountView,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as StakeholderRole,primaryContactId: freezed == primaryContactId ? _self.primaryContactId : primaryContactId // ignore: cast_nullable_to_non_nullable
as String?,primaryContact: freezed == primaryContact ? _self.primaryContact : primaryContact // ignore: cast_nullable_to_non_nullable
as StakeholderLinkContactView?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endReason: freezed == endReason ? _self.endReason : endReason // ignore: cast_nullable_to_non_nullable
as String?,replacedByLinkId: freezed == replacedByLinkId ? _self.replacedByLinkId : replacedByLinkId // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of StakeholderLinkView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StakeholderLinkAccountViewCopyWith<$Res> get account {
  
  return $StakeholderLinkAccountViewCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}/// Create a copy of StakeholderLinkView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StakeholderLinkContactViewCopyWith<$Res>? get primaryContact {
    if (_self.primaryContact == null) {
    return null;
  }

  return $StakeholderLinkContactViewCopyWith<$Res>(_self.primaryContact!, (value) {
    return _then(_self.copyWith(primaryContact: value));
  });
}
}


/// Adds pattern-matching-related methods to [StakeholderLinkView].
extension StakeholderLinkViewPatterns on StakeholderLinkView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StakeholderLinkView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StakeholderLinkView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StakeholderLinkView value)  $default,){
final _that = this;
switch (_that) {
case _StakeholderLinkView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StakeholderLinkView value)?  $default,){
final _that = this;
switch (_that) {
case _StakeholderLinkView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String projectId,  String accountId,  StakeholderLinkAccountView account,  StakeholderRole role,  String? primaryContactId,  StakeholderLinkContactView? primaryContact,  String? note,  DateTime startedAt,  DateTime? endedAt,  String? endReason,  String? replacedByLinkId,  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StakeholderLinkView() when $default != null:
return $default(_that.id,_that.projectId,_that.accountId,_that.account,_that.role,_that.primaryContactId,_that.primaryContact,_that.note,_that.startedAt,_that.endedAt,_that.endReason,_that.replacedByLinkId,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String projectId,  String accountId,  StakeholderLinkAccountView account,  StakeholderRole role,  String? primaryContactId,  StakeholderLinkContactView? primaryContact,  String? note,  DateTime startedAt,  DateTime? endedAt,  String? endReason,  String? replacedByLinkId,  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _StakeholderLinkView():
return $default(_that.id,_that.projectId,_that.accountId,_that.account,_that.role,_that.primaryContactId,_that.primaryContact,_that.note,_that.startedAt,_that.endedAt,_that.endReason,_that.replacedByLinkId,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String projectId,  String accountId,  StakeholderLinkAccountView account,  StakeholderRole role,  String? primaryContactId,  StakeholderLinkContactView? primaryContact,  String? note,  DateTime startedAt,  DateTime? endedAt,  String? endReason,  String? replacedByLinkId,  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _StakeholderLinkView() when $default != null:
return $default(_that.id,_that.projectId,_that.accountId,_that.account,_that.role,_that.primaryContactId,_that.primaryContact,_that.note,_that.startedAt,_that.endedAt,_that.endReason,_that.replacedByLinkId,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(converters: [UtcDateTimeConverter()])
class _StakeholderLinkView implements StakeholderLinkView {
  const _StakeholderLinkView({required this.id, required this.projectId, required this.accountId, required this.account, required this.role, this.primaryContactId, this.primaryContact, this.note, required this.startedAt, this.endedAt, this.endReason, this.replacedByLinkId, this.isActive = true});
  factory _StakeholderLinkView.fromJson(Map<String, dynamic> json) => _$StakeholderLinkViewFromJson(json);

@override final  String id;
@override final  String projectId;
@override final  String accountId;
@override final  StakeholderLinkAccountView account;
@override final  StakeholderRole role;
@override final  String? primaryContactId;
@override final  StakeholderLinkContactView? primaryContact;
@override final  String? note;
@override final  DateTime startedAt;
@override final  DateTime? endedAt;
@override final  String? endReason;
@override final  String? replacedByLinkId;
@override@JsonKey() final  bool isActive;

/// Create a copy of StakeholderLinkView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StakeholderLinkViewCopyWith<_StakeholderLinkView> get copyWith => __$StakeholderLinkViewCopyWithImpl<_StakeholderLinkView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StakeholderLinkViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StakeholderLinkView&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.account, account) || other.account == account)&&(identical(other.role, role) || other.role == role)&&(identical(other.primaryContactId, primaryContactId) || other.primaryContactId == primaryContactId)&&(identical(other.primaryContact, primaryContact) || other.primaryContact == primaryContact)&&(identical(other.note, note) || other.note == note)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.endReason, endReason) || other.endReason == endReason)&&(identical(other.replacedByLinkId, replacedByLinkId) || other.replacedByLinkId == replacedByLinkId)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,projectId,accountId,account,role,primaryContactId,primaryContact,note,startedAt,endedAt,endReason,replacedByLinkId,isActive);

@override
String toString() {
  return 'StakeholderLinkView(id: $id, projectId: $projectId, accountId: $accountId, account: $account, role: $role, primaryContactId: $primaryContactId, primaryContact: $primaryContact, note: $note, startedAt: $startedAt, endedAt: $endedAt, endReason: $endReason, replacedByLinkId: $replacedByLinkId, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$StakeholderLinkViewCopyWith<$Res> implements $StakeholderLinkViewCopyWith<$Res> {
  factory _$StakeholderLinkViewCopyWith(_StakeholderLinkView value, $Res Function(_StakeholderLinkView) _then) = __$StakeholderLinkViewCopyWithImpl;
@override @useResult
$Res call({
 String id, String projectId, String accountId, StakeholderLinkAccountView account, StakeholderRole role, String? primaryContactId, StakeholderLinkContactView? primaryContact, String? note, DateTime startedAt, DateTime? endedAt, String? endReason, String? replacedByLinkId, bool isActive
});


@override $StakeholderLinkAccountViewCopyWith<$Res> get account;@override $StakeholderLinkContactViewCopyWith<$Res>? get primaryContact;

}
/// @nodoc
class __$StakeholderLinkViewCopyWithImpl<$Res>
    implements _$StakeholderLinkViewCopyWith<$Res> {
  __$StakeholderLinkViewCopyWithImpl(this._self, this._then);

  final _StakeholderLinkView _self;
  final $Res Function(_StakeholderLinkView) _then;

/// Create a copy of StakeholderLinkView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? projectId = null,Object? accountId = null,Object? account = null,Object? role = null,Object? primaryContactId = freezed,Object? primaryContact = freezed,Object? note = freezed,Object? startedAt = null,Object? endedAt = freezed,Object? endReason = freezed,Object? replacedByLinkId = freezed,Object? isActive = null,}) {
  return _then(_StakeholderLinkView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as StakeholderLinkAccountView,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as StakeholderRole,primaryContactId: freezed == primaryContactId ? _self.primaryContactId : primaryContactId // ignore: cast_nullable_to_non_nullable
as String?,primaryContact: freezed == primaryContact ? _self.primaryContact : primaryContact // ignore: cast_nullable_to_non_nullable
as StakeholderLinkContactView?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endReason: freezed == endReason ? _self.endReason : endReason // ignore: cast_nullable_to_non_nullable
as String?,replacedByLinkId: freezed == replacedByLinkId ? _self.replacedByLinkId : replacedByLinkId // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of StakeholderLinkView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StakeholderLinkAccountViewCopyWith<$Res> get account {
  
  return $StakeholderLinkAccountViewCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}/// Create a copy of StakeholderLinkView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StakeholderLinkContactViewCopyWith<$Res>? get primaryContact {
    if (_self.primaryContact == null) {
    return null;
  }

  return $StakeholderLinkContactViewCopyWith<$Res>(_self.primaryContact!, (value) {
    return _then(_self.copyWith(primaryContact: value));
  });
}
}

// dart format on
