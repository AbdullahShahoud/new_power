// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PersonMetRefView {

 String get contactId; String get firstName; String get lastName; String? get position; String get accountId; String get accountName;
/// Create a copy of PersonMetRefView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonMetRefViewCopyWith<PersonMetRefView> get copyWith => _$PersonMetRefViewCopyWithImpl<PersonMetRefView>(this as PersonMetRefView, _$identity);

  /// Serializes this PersonMetRefView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonMetRefView&&(identical(other.contactId, contactId) || other.contactId == contactId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.position, position) || other.position == position)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.accountName, accountName) || other.accountName == accountName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contactId,firstName,lastName,position,accountId,accountName);

@override
String toString() {
  return 'PersonMetRefView(contactId: $contactId, firstName: $firstName, lastName: $lastName, position: $position, accountId: $accountId, accountName: $accountName)';
}


}

/// @nodoc
abstract mixin class $PersonMetRefViewCopyWith<$Res>  {
  factory $PersonMetRefViewCopyWith(PersonMetRefView value, $Res Function(PersonMetRefView) _then) = _$PersonMetRefViewCopyWithImpl;
@useResult
$Res call({
 String contactId, String firstName, String lastName, String? position, String accountId, String accountName
});




}
/// @nodoc
class _$PersonMetRefViewCopyWithImpl<$Res>
    implements $PersonMetRefViewCopyWith<$Res> {
  _$PersonMetRefViewCopyWithImpl(this._self, this._then);

  final PersonMetRefView _self;
  final $Res Function(PersonMetRefView) _then;

/// Create a copy of PersonMetRefView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contactId = null,Object? firstName = null,Object? lastName = null,Object? position = freezed,Object? accountId = null,Object? accountName = null,}) {
  return _then(_self.copyWith(
contactId: null == contactId ? _self.contactId : contactId // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String?,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,accountName: null == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PersonMetRefView].
extension PersonMetRefViewPatterns on PersonMetRefView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PersonMetRefView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PersonMetRefView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PersonMetRefView value)  $default,){
final _that = this;
switch (_that) {
case _PersonMetRefView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PersonMetRefView value)?  $default,){
final _that = this;
switch (_that) {
case _PersonMetRefView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String contactId,  String firstName,  String lastName,  String? position,  String accountId,  String accountName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PersonMetRefView() when $default != null:
return $default(_that.contactId,_that.firstName,_that.lastName,_that.position,_that.accountId,_that.accountName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String contactId,  String firstName,  String lastName,  String? position,  String accountId,  String accountName)  $default,) {final _that = this;
switch (_that) {
case _PersonMetRefView():
return $default(_that.contactId,_that.firstName,_that.lastName,_that.position,_that.accountId,_that.accountName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String contactId,  String firstName,  String lastName,  String? position,  String accountId,  String accountName)?  $default,) {final _that = this;
switch (_that) {
case _PersonMetRefView() when $default != null:
return $default(_that.contactId,_that.firstName,_that.lastName,_that.position,_that.accountId,_that.accountName);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(converters: [UtcDateTimeConverter()])
class _PersonMetRefView implements PersonMetRefView {
  const _PersonMetRefView({required this.contactId, required this.firstName, required this.lastName, this.position, required this.accountId, required this.accountName});
  factory _PersonMetRefView.fromJson(Map<String, dynamic> json) => _$PersonMetRefViewFromJson(json);

@override final  String contactId;
@override final  String firstName;
@override final  String lastName;
@override final  String? position;
@override final  String accountId;
@override final  String accountName;

/// Create a copy of PersonMetRefView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PersonMetRefViewCopyWith<_PersonMetRefView> get copyWith => __$PersonMetRefViewCopyWithImpl<_PersonMetRefView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PersonMetRefViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PersonMetRefView&&(identical(other.contactId, contactId) || other.contactId == contactId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.position, position) || other.position == position)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.accountName, accountName) || other.accountName == accountName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contactId,firstName,lastName,position,accountId,accountName);

@override
String toString() {
  return 'PersonMetRefView(contactId: $contactId, firstName: $firstName, lastName: $lastName, position: $position, accountId: $accountId, accountName: $accountName)';
}


}

/// @nodoc
abstract mixin class _$PersonMetRefViewCopyWith<$Res> implements $PersonMetRefViewCopyWith<$Res> {
  factory _$PersonMetRefViewCopyWith(_PersonMetRefView value, $Res Function(_PersonMetRefView) _then) = __$PersonMetRefViewCopyWithImpl;
@override @useResult
$Res call({
 String contactId, String firstName, String lastName, String? position, String accountId, String accountName
});




}
/// @nodoc
class __$PersonMetRefViewCopyWithImpl<$Res>
    implements _$PersonMetRefViewCopyWith<$Res> {
  __$PersonMetRefViewCopyWithImpl(this._self, this._then);

  final _PersonMetRefView _self;
  final $Res Function(_PersonMetRefView) _then;

/// Create a copy of PersonMetRefView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contactId = null,Object? firstName = null,Object? lastName = null,Object? position = freezed,Object? accountId = null,Object? accountName = null,}) {
  return _then(_PersonMetRefView(
contactId: null == contactId ? _self.contactId : contactId // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String?,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,accountName: null == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ActivityAttachmentView {

 String get id; String get key; String get name; String get contentType; int get byteSize; String? get url; DateTime? get urlExpiresAt; DateTime get uploadedAt; String? get uploadedBy;
/// Create a copy of ActivityAttachmentView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityAttachmentViewCopyWith<ActivityAttachmentView> get copyWith => _$ActivityAttachmentViewCopyWithImpl<ActivityAttachmentView>(this as ActivityAttachmentView, _$identity);

  /// Serializes this ActivityAttachmentView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityAttachmentView&&(identical(other.id, id) || other.id == id)&&(identical(other.key, key) || other.key == key)&&(identical(other.name, name) || other.name == name)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.byteSize, byteSize) || other.byteSize == byteSize)&&(identical(other.url, url) || other.url == url)&&(identical(other.urlExpiresAt, urlExpiresAt) || other.urlExpiresAt == urlExpiresAt)&&(identical(other.uploadedAt, uploadedAt) || other.uploadedAt == uploadedAt)&&(identical(other.uploadedBy, uploadedBy) || other.uploadedBy == uploadedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,key,name,contentType,byteSize,url,urlExpiresAt,uploadedAt,uploadedBy);



}

/// @nodoc
abstract mixin class $ActivityAttachmentViewCopyWith<$Res>  {
  factory $ActivityAttachmentViewCopyWith(ActivityAttachmentView value, $Res Function(ActivityAttachmentView) _then) = _$ActivityAttachmentViewCopyWithImpl;
@useResult
$Res call({
 String id, String key, String name, String contentType, int byteSize, String? url, DateTime? urlExpiresAt, DateTime uploadedAt, String? uploadedBy
});




}
/// @nodoc
class _$ActivityAttachmentViewCopyWithImpl<$Res>
    implements $ActivityAttachmentViewCopyWith<$Res> {
  _$ActivityAttachmentViewCopyWithImpl(this._self, this._then);

  final ActivityAttachmentView _self;
  final $Res Function(ActivityAttachmentView) _then;

/// Create a copy of ActivityAttachmentView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? key = null,Object? name = null,Object? contentType = null,Object? byteSize = null,Object? url = freezed,Object? urlExpiresAt = freezed,Object? uploadedAt = null,Object? uploadedBy = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String,byteSize: null == byteSize ? _self.byteSize : byteSize // ignore: cast_nullable_to_non_nullable
as int,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,urlExpiresAt: freezed == urlExpiresAt ? _self.urlExpiresAt : urlExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,uploadedAt: null == uploadedAt ? _self.uploadedAt : uploadedAt // ignore: cast_nullable_to_non_nullable
as DateTime,uploadedBy: freezed == uploadedBy ? _self.uploadedBy : uploadedBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ActivityAttachmentView].
extension ActivityAttachmentViewPatterns on ActivityAttachmentView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActivityAttachmentView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActivityAttachmentView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActivityAttachmentView value)  $default,){
final _that = this;
switch (_that) {
case _ActivityAttachmentView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActivityAttachmentView value)?  $default,){
final _that = this;
switch (_that) {
case _ActivityAttachmentView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String key,  String name,  String contentType,  int byteSize,  String? url,  DateTime? urlExpiresAt,  DateTime uploadedAt,  String? uploadedBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActivityAttachmentView() when $default != null:
return $default(_that.id,_that.key,_that.name,_that.contentType,_that.byteSize,_that.url,_that.urlExpiresAt,_that.uploadedAt,_that.uploadedBy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String key,  String name,  String contentType,  int byteSize,  String? url,  DateTime? urlExpiresAt,  DateTime uploadedAt,  String? uploadedBy)  $default,) {final _that = this;
switch (_that) {
case _ActivityAttachmentView():
return $default(_that.id,_that.key,_that.name,_that.contentType,_that.byteSize,_that.url,_that.urlExpiresAt,_that.uploadedAt,_that.uploadedBy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String key,  String name,  String contentType,  int byteSize,  String? url,  DateTime? urlExpiresAt,  DateTime uploadedAt,  String? uploadedBy)?  $default,) {final _that = this;
switch (_that) {
case _ActivityAttachmentView() when $default != null:
return $default(_that.id,_that.key,_that.name,_that.contentType,_that.byteSize,_that.url,_that.urlExpiresAt,_that.uploadedAt,_that.uploadedBy);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(converters: [UtcDateTimeConverter()])
class _ActivityAttachmentView implements ActivityAttachmentView {
  const _ActivityAttachmentView({required this.id, required this.key, required this.name, required this.contentType, required this.byteSize, this.url, this.urlExpiresAt, required this.uploadedAt, this.uploadedBy});
  factory _ActivityAttachmentView.fromJson(Map<String, dynamic> json) => _$ActivityAttachmentViewFromJson(json);

@override final  String id;
@override final  String key;
@override final  String name;
@override final  String contentType;
@override final  int byteSize;
@override final  String? url;
@override final  DateTime? urlExpiresAt;
@override final  DateTime uploadedAt;
@override final  String? uploadedBy;

/// Create a copy of ActivityAttachmentView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivityAttachmentViewCopyWith<_ActivityAttachmentView> get copyWith => __$ActivityAttachmentViewCopyWithImpl<_ActivityAttachmentView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActivityAttachmentViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivityAttachmentView&&(identical(other.id, id) || other.id == id)&&(identical(other.key, key) || other.key == key)&&(identical(other.name, name) || other.name == name)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.byteSize, byteSize) || other.byteSize == byteSize)&&(identical(other.url, url) || other.url == url)&&(identical(other.urlExpiresAt, urlExpiresAt) || other.urlExpiresAt == urlExpiresAt)&&(identical(other.uploadedAt, uploadedAt) || other.uploadedAt == uploadedAt)&&(identical(other.uploadedBy, uploadedBy) || other.uploadedBy == uploadedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,key,name,contentType,byteSize,url,urlExpiresAt,uploadedAt,uploadedBy);



}

/// @nodoc
abstract mixin class _$ActivityAttachmentViewCopyWith<$Res> implements $ActivityAttachmentViewCopyWith<$Res> {
  factory _$ActivityAttachmentViewCopyWith(_ActivityAttachmentView value, $Res Function(_ActivityAttachmentView) _then) = __$ActivityAttachmentViewCopyWithImpl;
@override @useResult
$Res call({
 String id, String key, String name, String contentType, int byteSize, String? url, DateTime? urlExpiresAt, DateTime uploadedAt, String? uploadedBy
});




}
/// @nodoc
class __$ActivityAttachmentViewCopyWithImpl<$Res>
    implements _$ActivityAttachmentViewCopyWith<$Res> {
  __$ActivityAttachmentViewCopyWithImpl(this._self, this._then);

  final _ActivityAttachmentView _self;
  final $Res Function(_ActivityAttachmentView) _then;

/// Create a copy of ActivityAttachmentView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? key = null,Object? name = null,Object? contentType = null,Object? byteSize = null,Object? url = freezed,Object? urlExpiresAt = freezed,Object? uploadedAt = null,Object? uploadedBy = freezed,}) {
  return _then(_ActivityAttachmentView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String,byteSize: null == byteSize ? _self.byteSize : byteSize // ignore: cast_nullable_to_non_nullable
as int,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,urlExpiresAt: freezed == urlExpiresAt ? _self.urlExpiresAt : urlExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,uploadedAt: null == uploadedAt ? _self.uploadedAt : uploadedAt // ignore: cast_nullable_to_non_nullable
as DateTime,uploadedBy: freezed == uploadedBy ? _self.uploadedBy : uploadedBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ActivityView {

 String get id; String get projectId; String get projectName; ActivityKind get kind; ActivityChannel? get channel; ActivityPurpose get purpose; ActivityOutcome get outcome; DateTime get occurredAt; DateTime get capturedAt; double? get latitude; double? get longitude; double? get locationAccuracyM; bool get locationVerified; ConstructionPhase? get constructionPhaseObserved; String? get competitorAccountId; String? get competitorName; String get notes; List<PersonMetRefView> get personsMet; List<ActivityAttachmentView> get attachments; DateTime? get nextActionAt; DateTime? get nextActionDoneAt; bool get backdated; String? get backdateApprovedBy; bool get editedAfterWindow; String? get createdBy; ActorView? get createdByUser; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of ActivityView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityViewCopyWith<ActivityView> get copyWith => _$ActivityViewCopyWithImpl<ActivityView>(this as ActivityView, _$identity);

  /// Serializes this ActivityView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityView&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.projectName, projectName) || other.projectName == projectName)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.channel, channel) || other.channel == channel)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.outcome, outcome) || other.outcome == outcome)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&(identical(other.capturedAt, capturedAt) || other.capturedAt == capturedAt)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.locationAccuracyM, locationAccuracyM) || other.locationAccuracyM == locationAccuracyM)&&(identical(other.locationVerified, locationVerified) || other.locationVerified == locationVerified)&&(identical(other.constructionPhaseObserved, constructionPhaseObserved) || other.constructionPhaseObserved == constructionPhaseObserved)&&(identical(other.competitorAccountId, competitorAccountId) || other.competitorAccountId == competitorAccountId)&&(identical(other.competitorName, competitorName) || other.competitorName == competitorName)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.personsMet, personsMet)&&const DeepCollectionEquality().equals(other.attachments, attachments)&&(identical(other.nextActionAt, nextActionAt) || other.nextActionAt == nextActionAt)&&(identical(other.nextActionDoneAt, nextActionDoneAt) || other.nextActionDoneAt == nextActionDoneAt)&&(identical(other.backdated, backdated) || other.backdated == backdated)&&(identical(other.backdateApprovedBy, backdateApprovedBy) || other.backdateApprovedBy == backdateApprovedBy)&&(identical(other.editedAfterWindow, editedAfterWindow) || other.editedAfterWindow == editedAfterWindow)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdByUser, createdByUser) || other.createdByUser == createdByUser)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,projectId,projectName,kind,channel,purpose,outcome,occurredAt,capturedAt,latitude,longitude,locationAccuracyM,locationVerified,constructionPhaseObserved,competitorAccountId,competitorName,notes,const DeepCollectionEquality().hash(personsMet),const DeepCollectionEquality().hash(attachments),nextActionAt,nextActionDoneAt,backdated,backdateApprovedBy,editedAfterWindow,createdBy,createdByUser,createdAt,updatedAt]);

@override
String toString() {
  return 'ActivityView(id: $id, projectId: $projectId, projectName: $projectName, kind: $kind, channel: $channel, purpose: $purpose, outcome: $outcome, occurredAt: $occurredAt, capturedAt: $capturedAt, latitude: $latitude, longitude: $longitude, locationAccuracyM: $locationAccuracyM, locationVerified: $locationVerified, constructionPhaseObserved: $constructionPhaseObserved, competitorAccountId: $competitorAccountId, competitorName: $competitorName, notes: $notes, personsMet: $personsMet, attachments: $attachments, nextActionAt: $nextActionAt, nextActionDoneAt: $nextActionDoneAt, backdated: $backdated, backdateApprovedBy: $backdateApprovedBy, editedAfterWindow: $editedAfterWindow, createdBy: $createdBy, createdByUser: $createdByUser, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ActivityViewCopyWith<$Res>  {
  factory $ActivityViewCopyWith(ActivityView value, $Res Function(ActivityView) _then) = _$ActivityViewCopyWithImpl;
@useResult
$Res call({
 String id, String projectId, String projectName, ActivityKind kind, ActivityChannel? channel, ActivityPurpose purpose, ActivityOutcome outcome, DateTime occurredAt, DateTime capturedAt, double? latitude, double? longitude, double? locationAccuracyM, bool locationVerified, ConstructionPhase? constructionPhaseObserved, String? competitorAccountId, String? competitorName, String notes, List<PersonMetRefView> personsMet, List<ActivityAttachmentView> attachments, DateTime? nextActionAt, DateTime? nextActionDoneAt, bool backdated, String? backdateApprovedBy, bool editedAfterWindow, String? createdBy, ActorView? createdByUser, DateTime createdAt, DateTime updatedAt
});


$ActorViewCopyWith<$Res>? get createdByUser;

}
/// @nodoc
class _$ActivityViewCopyWithImpl<$Res>
    implements $ActivityViewCopyWith<$Res> {
  _$ActivityViewCopyWithImpl(this._self, this._then);

  final ActivityView _self;
  final $Res Function(ActivityView) _then;

/// Create a copy of ActivityView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? projectId = null,Object? projectName = null,Object? kind = null,Object? channel = freezed,Object? purpose = null,Object? outcome = null,Object? occurredAt = null,Object? capturedAt = null,Object? latitude = freezed,Object? longitude = freezed,Object? locationAccuracyM = freezed,Object? locationVerified = null,Object? constructionPhaseObserved = freezed,Object? competitorAccountId = freezed,Object? competitorName = freezed,Object? notes = null,Object? personsMet = null,Object? attachments = null,Object? nextActionAt = freezed,Object? nextActionDoneAt = freezed,Object? backdated = null,Object? backdateApprovedBy = freezed,Object? editedAfterWindow = null,Object? createdBy = freezed,Object? createdByUser = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,projectName: null == projectName ? _self.projectName : projectName // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ActivityKind,channel: freezed == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as ActivityChannel?,purpose: null == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as ActivityPurpose,outcome: null == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as ActivityOutcome,occurredAt: null == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime,capturedAt: null == capturedAt ? _self.capturedAt : capturedAt // ignore: cast_nullable_to_non_nullable
as DateTime,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,locationAccuracyM: freezed == locationAccuracyM ? _self.locationAccuracyM : locationAccuracyM // ignore: cast_nullable_to_non_nullable
as double?,locationVerified: null == locationVerified ? _self.locationVerified : locationVerified // ignore: cast_nullable_to_non_nullable
as bool,constructionPhaseObserved: freezed == constructionPhaseObserved ? _self.constructionPhaseObserved : constructionPhaseObserved // ignore: cast_nullable_to_non_nullable
as ConstructionPhase?,competitorAccountId: freezed == competitorAccountId ? _self.competitorAccountId : competitorAccountId // ignore: cast_nullable_to_non_nullable
as String?,competitorName: freezed == competitorName ? _self.competitorName : competitorName // ignore: cast_nullable_to_non_nullable
as String?,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,personsMet: null == personsMet ? _self.personsMet : personsMet // ignore: cast_nullable_to_non_nullable
as List<PersonMetRefView>,attachments: null == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<ActivityAttachmentView>,nextActionAt: freezed == nextActionAt ? _self.nextActionAt : nextActionAt // ignore: cast_nullable_to_non_nullable
as DateTime?,nextActionDoneAt: freezed == nextActionDoneAt ? _self.nextActionDoneAt : nextActionDoneAt // ignore: cast_nullable_to_non_nullable
as DateTime?,backdated: null == backdated ? _self.backdated : backdated // ignore: cast_nullable_to_non_nullable
as bool,backdateApprovedBy: freezed == backdateApprovedBy ? _self.backdateApprovedBy : backdateApprovedBy // ignore: cast_nullable_to_non_nullable
as String?,editedAfterWindow: null == editedAfterWindow ? _self.editedAfterWindow : editedAfterWindow // ignore: cast_nullable_to_non_nullable
as bool,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,createdByUser: freezed == createdByUser ? _self.createdByUser : createdByUser // ignore: cast_nullable_to_non_nullable
as ActorView?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of ActivityView
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
}
}


/// Adds pattern-matching-related methods to [ActivityView].
extension ActivityViewPatterns on ActivityView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActivityView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActivityView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActivityView value)  $default,){
final _that = this;
switch (_that) {
case _ActivityView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActivityView value)?  $default,){
final _that = this;
switch (_that) {
case _ActivityView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String projectId,  String projectName,  ActivityKind kind,  ActivityChannel? channel,  ActivityPurpose purpose,  ActivityOutcome outcome,  DateTime occurredAt,  DateTime capturedAt,  double? latitude,  double? longitude,  double? locationAccuracyM,  bool locationVerified,  ConstructionPhase? constructionPhaseObserved,  String? competitorAccountId,  String? competitorName,  String notes,  List<PersonMetRefView> personsMet,  List<ActivityAttachmentView> attachments,  DateTime? nextActionAt,  DateTime? nextActionDoneAt,  bool backdated,  String? backdateApprovedBy,  bool editedAfterWindow,  String? createdBy,  ActorView? createdByUser,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActivityView() when $default != null:
return $default(_that.id,_that.projectId,_that.projectName,_that.kind,_that.channel,_that.purpose,_that.outcome,_that.occurredAt,_that.capturedAt,_that.latitude,_that.longitude,_that.locationAccuracyM,_that.locationVerified,_that.constructionPhaseObserved,_that.competitorAccountId,_that.competitorName,_that.notes,_that.personsMet,_that.attachments,_that.nextActionAt,_that.nextActionDoneAt,_that.backdated,_that.backdateApprovedBy,_that.editedAfterWindow,_that.createdBy,_that.createdByUser,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String projectId,  String projectName,  ActivityKind kind,  ActivityChannel? channel,  ActivityPurpose purpose,  ActivityOutcome outcome,  DateTime occurredAt,  DateTime capturedAt,  double? latitude,  double? longitude,  double? locationAccuracyM,  bool locationVerified,  ConstructionPhase? constructionPhaseObserved,  String? competitorAccountId,  String? competitorName,  String notes,  List<PersonMetRefView> personsMet,  List<ActivityAttachmentView> attachments,  DateTime? nextActionAt,  DateTime? nextActionDoneAt,  bool backdated,  String? backdateApprovedBy,  bool editedAfterWindow,  String? createdBy,  ActorView? createdByUser,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ActivityView():
return $default(_that.id,_that.projectId,_that.projectName,_that.kind,_that.channel,_that.purpose,_that.outcome,_that.occurredAt,_that.capturedAt,_that.latitude,_that.longitude,_that.locationAccuracyM,_that.locationVerified,_that.constructionPhaseObserved,_that.competitorAccountId,_that.competitorName,_that.notes,_that.personsMet,_that.attachments,_that.nextActionAt,_that.nextActionDoneAt,_that.backdated,_that.backdateApprovedBy,_that.editedAfterWindow,_that.createdBy,_that.createdByUser,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String projectId,  String projectName,  ActivityKind kind,  ActivityChannel? channel,  ActivityPurpose purpose,  ActivityOutcome outcome,  DateTime occurredAt,  DateTime capturedAt,  double? latitude,  double? longitude,  double? locationAccuracyM,  bool locationVerified,  ConstructionPhase? constructionPhaseObserved,  String? competitorAccountId,  String? competitorName,  String notes,  List<PersonMetRefView> personsMet,  List<ActivityAttachmentView> attachments,  DateTime? nextActionAt,  DateTime? nextActionDoneAt,  bool backdated,  String? backdateApprovedBy,  bool editedAfterWindow,  String? createdBy,  ActorView? createdByUser,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ActivityView() when $default != null:
return $default(_that.id,_that.projectId,_that.projectName,_that.kind,_that.channel,_that.purpose,_that.outcome,_that.occurredAt,_that.capturedAt,_that.latitude,_that.longitude,_that.locationAccuracyM,_that.locationVerified,_that.constructionPhaseObserved,_that.competitorAccountId,_that.competitorName,_that.notes,_that.personsMet,_that.attachments,_that.nextActionAt,_that.nextActionDoneAt,_that.backdated,_that.backdateApprovedBy,_that.editedAfterWindow,_that.createdBy,_that.createdByUser,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(converters: [UtcDateTimeConverter()])
class _ActivityView implements ActivityView {
  const _ActivityView({required this.id, required this.projectId, required this.projectName, required this.kind, this.channel, required this.purpose, required this.outcome, required this.occurredAt, required this.capturedAt, this.latitude, this.longitude, this.locationAccuracyM, this.locationVerified = false, this.constructionPhaseObserved, this.competitorAccountId, this.competitorName, required this.notes, final  List<PersonMetRefView> personsMet = const <PersonMetRefView>[], final  List<ActivityAttachmentView> attachments = const <ActivityAttachmentView>[], this.nextActionAt, this.nextActionDoneAt, this.backdated = false, this.backdateApprovedBy, this.editedAfterWindow = false, this.createdBy, this.createdByUser, required this.createdAt, required this.updatedAt}): _personsMet = personsMet,_attachments = attachments;
  factory _ActivityView.fromJson(Map<String, dynamic> json) => _$ActivityViewFromJson(json);

@override final  String id;
@override final  String projectId;
@override final  String projectName;
@override final  ActivityKind kind;
@override final  ActivityChannel? channel;
@override final  ActivityPurpose purpose;
@override final  ActivityOutcome outcome;
@override final  DateTime occurredAt;
@override final  DateTime capturedAt;
@override final  double? latitude;
@override final  double? longitude;
@override final  double? locationAccuracyM;
@override@JsonKey() final  bool locationVerified;
@override final  ConstructionPhase? constructionPhaseObserved;
@override final  String? competitorAccountId;
@override final  String? competitorName;
@override final  String notes;
 final  List<PersonMetRefView> _personsMet;
@override@JsonKey() List<PersonMetRefView> get personsMet {
  if (_personsMet is EqualUnmodifiableListView) return _personsMet;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_personsMet);
}

 final  List<ActivityAttachmentView> _attachments;
@override@JsonKey() List<ActivityAttachmentView> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}

@override final  DateTime? nextActionAt;
@override final  DateTime? nextActionDoneAt;
@override@JsonKey() final  bool backdated;
@override final  String? backdateApprovedBy;
@override@JsonKey() final  bool editedAfterWindow;
@override final  String? createdBy;
@override final  ActorView? createdByUser;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of ActivityView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivityViewCopyWith<_ActivityView> get copyWith => __$ActivityViewCopyWithImpl<_ActivityView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActivityViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivityView&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.projectName, projectName) || other.projectName == projectName)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.channel, channel) || other.channel == channel)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.outcome, outcome) || other.outcome == outcome)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&(identical(other.capturedAt, capturedAt) || other.capturedAt == capturedAt)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.locationAccuracyM, locationAccuracyM) || other.locationAccuracyM == locationAccuracyM)&&(identical(other.locationVerified, locationVerified) || other.locationVerified == locationVerified)&&(identical(other.constructionPhaseObserved, constructionPhaseObserved) || other.constructionPhaseObserved == constructionPhaseObserved)&&(identical(other.competitorAccountId, competitorAccountId) || other.competitorAccountId == competitorAccountId)&&(identical(other.competitorName, competitorName) || other.competitorName == competitorName)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other._personsMet, _personsMet)&&const DeepCollectionEquality().equals(other._attachments, _attachments)&&(identical(other.nextActionAt, nextActionAt) || other.nextActionAt == nextActionAt)&&(identical(other.nextActionDoneAt, nextActionDoneAt) || other.nextActionDoneAt == nextActionDoneAt)&&(identical(other.backdated, backdated) || other.backdated == backdated)&&(identical(other.backdateApprovedBy, backdateApprovedBy) || other.backdateApprovedBy == backdateApprovedBy)&&(identical(other.editedAfterWindow, editedAfterWindow) || other.editedAfterWindow == editedAfterWindow)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdByUser, createdByUser) || other.createdByUser == createdByUser)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,projectId,projectName,kind,channel,purpose,outcome,occurredAt,capturedAt,latitude,longitude,locationAccuracyM,locationVerified,constructionPhaseObserved,competitorAccountId,competitorName,notes,const DeepCollectionEquality().hash(_personsMet),const DeepCollectionEquality().hash(_attachments),nextActionAt,nextActionDoneAt,backdated,backdateApprovedBy,editedAfterWindow,createdBy,createdByUser,createdAt,updatedAt]);

@override
String toString() {
  return 'ActivityView(id: $id, projectId: $projectId, projectName: $projectName, kind: $kind, channel: $channel, purpose: $purpose, outcome: $outcome, occurredAt: $occurredAt, capturedAt: $capturedAt, latitude: $latitude, longitude: $longitude, locationAccuracyM: $locationAccuracyM, locationVerified: $locationVerified, constructionPhaseObserved: $constructionPhaseObserved, competitorAccountId: $competitorAccountId, competitorName: $competitorName, notes: $notes, personsMet: $personsMet, attachments: $attachments, nextActionAt: $nextActionAt, nextActionDoneAt: $nextActionDoneAt, backdated: $backdated, backdateApprovedBy: $backdateApprovedBy, editedAfterWindow: $editedAfterWindow, createdBy: $createdBy, createdByUser: $createdByUser, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ActivityViewCopyWith<$Res> implements $ActivityViewCopyWith<$Res> {
  factory _$ActivityViewCopyWith(_ActivityView value, $Res Function(_ActivityView) _then) = __$ActivityViewCopyWithImpl;
@override @useResult
$Res call({
 String id, String projectId, String projectName, ActivityKind kind, ActivityChannel? channel, ActivityPurpose purpose, ActivityOutcome outcome, DateTime occurredAt, DateTime capturedAt, double? latitude, double? longitude, double? locationAccuracyM, bool locationVerified, ConstructionPhase? constructionPhaseObserved, String? competitorAccountId, String? competitorName, String notes, List<PersonMetRefView> personsMet, List<ActivityAttachmentView> attachments, DateTime? nextActionAt, DateTime? nextActionDoneAt, bool backdated, String? backdateApprovedBy, bool editedAfterWindow, String? createdBy, ActorView? createdByUser, DateTime createdAt, DateTime updatedAt
});


@override $ActorViewCopyWith<$Res>? get createdByUser;

}
/// @nodoc
class __$ActivityViewCopyWithImpl<$Res>
    implements _$ActivityViewCopyWith<$Res> {
  __$ActivityViewCopyWithImpl(this._self, this._then);

  final _ActivityView _self;
  final $Res Function(_ActivityView) _then;

/// Create a copy of ActivityView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? projectId = null,Object? projectName = null,Object? kind = null,Object? channel = freezed,Object? purpose = null,Object? outcome = null,Object? occurredAt = null,Object? capturedAt = null,Object? latitude = freezed,Object? longitude = freezed,Object? locationAccuracyM = freezed,Object? locationVerified = null,Object? constructionPhaseObserved = freezed,Object? competitorAccountId = freezed,Object? competitorName = freezed,Object? notes = null,Object? personsMet = null,Object? attachments = null,Object? nextActionAt = freezed,Object? nextActionDoneAt = freezed,Object? backdated = null,Object? backdateApprovedBy = freezed,Object? editedAfterWindow = null,Object? createdBy = freezed,Object? createdByUser = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ActivityView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,projectName: null == projectName ? _self.projectName : projectName // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ActivityKind,channel: freezed == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as ActivityChannel?,purpose: null == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as ActivityPurpose,outcome: null == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as ActivityOutcome,occurredAt: null == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime,capturedAt: null == capturedAt ? _self.capturedAt : capturedAt // ignore: cast_nullable_to_non_nullable
as DateTime,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,locationAccuracyM: freezed == locationAccuracyM ? _self.locationAccuracyM : locationAccuracyM // ignore: cast_nullable_to_non_nullable
as double?,locationVerified: null == locationVerified ? _self.locationVerified : locationVerified // ignore: cast_nullable_to_non_nullable
as bool,constructionPhaseObserved: freezed == constructionPhaseObserved ? _self.constructionPhaseObserved : constructionPhaseObserved // ignore: cast_nullable_to_non_nullable
as ConstructionPhase?,competitorAccountId: freezed == competitorAccountId ? _self.competitorAccountId : competitorAccountId // ignore: cast_nullable_to_non_nullable
as String?,competitorName: freezed == competitorName ? _self.competitorName : competitorName // ignore: cast_nullable_to_non_nullable
as String?,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,personsMet: null == personsMet ? _self._personsMet : personsMet // ignore: cast_nullable_to_non_nullable
as List<PersonMetRefView>,attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<ActivityAttachmentView>,nextActionAt: freezed == nextActionAt ? _self.nextActionAt : nextActionAt // ignore: cast_nullable_to_non_nullable
as DateTime?,nextActionDoneAt: freezed == nextActionDoneAt ? _self.nextActionDoneAt : nextActionDoneAt // ignore: cast_nullable_to_non_nullable
as DateTime?,backdated: null == backdated ? _self.backdated : backdated // ignore: cast_nullable_to_non_nullable
as bool,backdateApprovedBy: freezed == backdateApprovedBy ? _self.backdateApprovedBy : backdateApprovedBy // ignore: cast_nullable_to_non_nullable
as String?,editedAfterWindow: null == editedAfterWindow ? _self.editedAfterWindow : editedAfterWindow // ignore: cast_nullable_to_non_nullable
as bool,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,createdByUser: freezed == createdByUser ? _self.createdByUser : createdByUser // ignore: cast_nullable_to_non_nullable
as ActorView?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of ActivityView
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
}
}

// dart format on
