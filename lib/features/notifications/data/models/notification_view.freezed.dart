// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationView {

/// ⚠️ A **cuid**, not a uuid. The routes carry no `ParseUUIDPipe`, so
/// never validate it as one.
 String get id;@JsonKey(unknownEnumValue: NotificationType.unknown) NotificationType get type;@JsonKey(unknownEnumValue: NotificationStatus.unknown) NotificationStatus get status;/// **English only** — every template is hard-coded English server-side.
/// The UI renders an Arabic replacement keyed on the derived sub-type;
/// see `NotificationPresentation`.
 String get title; String get message;/// Free-form and **shape-varying per event**, and it can be `null`
/// outright (any broadcast sent without metadata). Every lookup must be
/// null-safe — a tile has to render correctly with `metadata: null`.
 Map<String, dynamic>? get metadata; DateTime? get readAt; DateTime? get createdAt;// ── present ONLY on `PATCH /{id}/read` ──────────────────────────
 String? get userId; DateTime? get archivedAt; DateTime? get updatedAt;
/// Create a copy of NotificationView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationViewCopyWith<NotificationView> get copyWith => _$NotificationViewCopyWithImpl<NotificationView>(this as NotificationView, _$identity);

  /// Serializes this NotificationView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationView&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.title, title) || other.title == title)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.metadata, metadata)&&(identical(other.readAt, readAt) || other.readAt == readAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.archivedAt, archivedAt) || other.archivedAt == archivedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,status,title,message,const DeepCollectionEquality().hash(metadata),readAt,createdAt,userId,archivedAt,updatedAt);

@override
String toString() {
  return 'NotificationView(id: $id, type: $type, status: $status, title: $title, message: $message, metadata: $metadata, readAt: $readAt, createdAt: $createdAt, userId: $userId, archivedAt: $archivedAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $NotificationViewCopyWith<$Res>  {
  factory $NotificationViewCopyWith(NotificationView value, $Res Function(NotificationView) _then) = _$NotificationViewCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(unknownEnumValue: NotificationType.unknown) NotificationType type,@JsonKey(unknownEnumValue: NotificationStatus.unknown) NotificationStatus status, String title, String message, Map<String, dynamic>? metadata, DateTime? readAt, DateTime? createdAt, String? userId, DateTime? archivedAt, DateTime? updatedAt
});




}
/// @nodoc
class _$NotificationViewCopyWithImpl<$Res>
    implements $NotificationViewCopyWith<$Res> {
  _$NotificationViewCopyWithImpl(this._self, this._then);

  final NotificationView _self;
  final $Res Function(NotificationView) _then;

/// Create a copy of NotificationView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? status = null,Object? title = null,Object? message = null,Object? metadata = freezed,Object? readAt = freezed,Object? createdAt = freezed,Object? userId = freezed,Object? archivedAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NotificationType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NotificationStatus,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,readAt: freezed == readAt ? _self.readAt : readAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,archivedAt: freezed == archivedAt ? _self.archivedAt : archivedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationView].
extension NotificationViewPatterns on NotificationView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationView value)  $default,){
final _that = this;
switch (_that) {
case _NotificationView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationView value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(unknownEnumValue: NotificationType.unknown)  NotificationType type, @JsonKey(unknownEnumValue: NotificationStatus.unknown)  NotificationStatus status,  String title,  String message,  Map<String, dynamic>? metadata,  DateTime? readAt,  DateTime? createdAt,  String? userId,  DateTime? archivedAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationView() when $default != null:
return $default(_that.id,_that.type,_that.status,_that.title,_that.message,_that.metadata,_that.readAt,_that.createdAt,_that.userId,_that.archivedAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(unknownEnumValue: NotificationType.unknown)  NotificationType type, @JsonKey(unknownEnumValue: NotificationStatus.unknown)  NotificationStatus status,  String title,  String message,  Map<String, dynamic>? metadata,  DateTime? readAt,  DateTime? createdAt,  String? userId,  DateTime? archivedAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _NotificationView():
return $default(_that.id,_that.type,_that.status,_that.title,_that.message,_that.metadata,_that.readAt,_that.createdAt,_that.userId,_that.archivedAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(unknownEnumValue: NotificationType.unknown)  NotificationType type, @JsonKey(unknownEnumValue: NotificationStatus.unknown)  NotificationStatus status,  String title,  String message,  Map<String, dynamic>? metadata,  DateTime? readAt,  DateTime? createdAt,  String? userId,  DateTime? archivedAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _NotificationView() when $default != null:
return $default(_that.id,_that.type,_that.status,_that.title,_that.message,_that.metadata,_that.readAt,_that.createdAt,_that.userId,_that.archivedAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(converters: [UtcDateTimeConverter()])
class _NotificationView implements NotificationView {
  const _NotificationView({required this.id, @JsonKey(unknownEnumValue: NotificationType.unknown) this.type = NotificationType.unknown, @JsonKey(unknownEnumValue: NotificationStatus.unknown) this.status = NotificationStatus.unknown, this.title = '', this.message = '', final  Map<String, dynamic>? metadata, this.readAt, this.createdAt, this.userId, this.archivedAt, this.updatedAt}): _metadata = metadata;
  factory _NotificationView.fromJson(Map<String, dynamic> json) => _$NotificationViewFromJson(json);

/// ⚠️ A **cuid**, not a uuid. The routes carry no `ParseUUIDPipe`, so
/// never validate it as one.
@override final  String id;
@override@JsonKey(unknownEnumValue: NotificationType.unknown) final  NotificationType type;
@override@JsonKey(unknownEnumValue: NotificationStatus.unknown) final  NotificationStatus status;
/// **English only** — every template is hard-coded English server-side.
/// The UI renders an Arabic replacement keyed on the derived sub-type;
/// see `NotificationPresentation`.
@override@JsonKey() final  String title;
@override@JsonKey() final  String message;
/// Free-form and **shape-varying per event**, and it can be `null`
/// outright (any broadcast sent without metadata). Every lookup must be
/// null-safe — a tile has to render correctly with `metadata: null`.
 final  Map<String, dynamic>? _metadata;
/// Free-form and **shape-varying per event**, and it can be `null`
/// outright (any broadcast sent without metadata). Every lookup must be
/// null-safe — a tile has to render correctly with `metadata: null`.
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  DateTime? readAt;
@override final  DateTime? createdAt;
// ── present ONLY on `PATCH /{id}/read` ──────────────────────────
@override final  String? userId;
@override final  DateTime? archivedAt;
@override final  DateTime? updatedAt;

/// Create a copy of NotificationView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationViewCopyWith<_NotificationView> get copyWith => __$NotificationViewCopyWithImpl<_NotificationView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationView&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.title, title) || other.title == title)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._metadata, _metadata)&&(identical(other.readAt, readAt) || other.readAt == readAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.archivedAt, archivedAt) || other.archivedAt == archivedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,status,title,message,const DeepCollectionEquality().hash(_metadata),readAt,createdAt,userId,archivedAt,updatedAt);

@override
String toString() {
  return 'NotificationView(id: $id, type: $type, status: $status, title: $title, message: $message, metadata: $metadata, readAt: $readAt, createdAt: $createdAt, userId: $userId, archivedAt: $archivedAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$NotificationViewCopyWith<$Res> implements $NotificationViewCopyWith<$Res> {
  factory _$NotificationViewCopyWith(_NotificationView value, $Res Function(_NotificationView) _then) = __$NotificationViewCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(unknownEnumValue: NotificationType.unknown) NotificationType type,@JsonKey(unknownEnumValue: NotificationStatus.unknown) NotificationStatus status, String title, String message, Map<String, dynamic>? metadata, DateTime? readAt, DateTime? createdAt, String? userId, DateTime? archivedAt, DateTime? updatedAt
});




}
/// @nodoc
class __$NotificationViewCopyWithImpl<$Res>
    implements _$NotificationViewCopyWith<$Res> {
  __$NotificationViewCopyWithImpl(this._self, this._then);

  final _NotificationView _self;
  final $Res Function(_NotificationView) _then;

/// Create a copy of NotificationView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? status = null,Object? title = null,Object? message = null,Object? metadata = freezed,Object? readAt = freezed,Object? createdAt = freezed,Object? userId = freezed,Object? archivedAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_NotificationView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NotificationType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NotificationStatus,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,readAt: freezed == readAt ? _self.readAt : readAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,archivedAt: freezed == archivedAt ? _self.archivedAt : archivedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$NotificationPreferencesView {

 bool get securityEnabled; bool get systemEnabled;/// Admin broadcasts. **Off by default**, which is why the settings
/// screen shows it as genuinely off rather than assuming true.
 bool get marketingEnabled;/// Narrower than the others: it suppresses the **push only**. The in-app
/// row is still written, so the inbox stays complete.
 bool get pushEnabled; NotificationLanguage get language;
/// Create a copy of NotificationPreferencesView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationPreferencesViewCopyWith<NotificationPreferencesView> get copyWith => _$NotificationPreferencesViewCopyWithImpl<NotificationPreferencesView>(this as NotificationPreferencesView, _$identity);

  /// Serializes this NotificationPreferencesView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationPreferencesView&&(identical(other.securityEnabled, securityEnabled) || other.securityEnabled == securityEnabled)&&(identical(other.systemEnabled, systemEnabled) || other.systemEnabled == systemEnabled)&&(identical(other.marketingEnabled, marketingEnabled) || other.marketingEnabled == marketingEnabled)&&(identical(other.pushEnabled, pushEnabled) || other.pushEnabled == pushEnabled)&&(identical(other.language, language) || other.language == language));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,securityEnabled,systemEnabled,marketingEnabled,pushEnabled,language);

@override
String toString() {
  return 'NotificationPreferencesView(securityEnabled: $securityEnabled, systemEnabled: $systemEnabled, marketingEnabled: $marketingEnabled, pushEnabled: $pushEnabled, language: $language)';
}


}

/// @nodoc
abstract mixin class $NotificationPreferencesViewCopyWith<$Res>  {
  factory $NotificationPreferencesViewCopyWith(NotificationPreferencesView value, $Res Function(NotificationPreferencesView) _then) = _$NotificationPreferencesViewCopyWithImpl;
@useResult
$Res call({
 bool securityEnabled, bool systemEnabled, bool marketingEnabled, bool pushEnabled, NotificationLanguage language
});




}
/// @nodoc
class _$NotificationPreferencesViewCopyWithImpl<$Res>
    implements $NotificationPreferencesViewCopyWith<$Res> {
  _$NotificationPreferencesViewCopyWithImpl(this._self, this._then);

  final NotificationPreferencesView _self;
  final $Res Function(NotificationPreferencesView) _then;

/// Create a copy of NotificationPreferencesView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? securityEnabled = null,Object? systemEnabled = null,Object? marketingEnabled = null,Object? pushEnabled = null,Object? language = null,}) {
  return _then(_self.copyWith(
securityEnabled: null == securityEnabled ? _self.securityEnabled : securityEnabled // ignore: cast_nullable_to_non_nullable
as bool,systemEnabled: null == systemEnabled ? _self.systemEnabled : systemEnabled // ignore: cast_nullable_to_non_nullable
as bool,marketingEnabled: null == marketingEnabled ? _self.marketingEnabled : marketingEnabled // ignore: cast_nullable_to_non_nullable
as bool,pushEnabled: null == pushEnabled ? _self.pushEnabled : pushEnabled // ignore: cast_nullable_to_non_nullable
as bool,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as NotificationLanguage,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationPreferencesView].
extension NotificationPreferencesViewPatterns on NotificationPreferencesView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationPreferencesView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationPreferencesView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationPreferencesView value)  $default,){
final _that = this;
switch (_that) {
case _NotificationPreferencesView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationPreferencesView value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationPreferencesView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool securityEnabled,  bool systemEnabled,  bool marketingEnabled,  bool pushEnabled,  NotificationLanguage language)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationPreferencesView() when $default != null:
return $default(_that.securityEnabled,_that.systemEnabled,_that.marketingEnabled,_that.pushEnabled,_that.language);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool securityEnabled,  bool systemEnabled,  bool marketingEnabled,  bool pushEnabled,  NotificationLanguage language)  $default,) {final _that = this;
switch (_that) {
case _NotificationPreferencesView():
return $default(_that.securityEnabled,_that.systemEnabled,_that.marketingEnabled,_that.pushEnabled,_that.language);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool securityEnabled,  bool systemEnabled,  bool marketingEnabled,  bool pushEnabled,  NotificationLanguage language)?  $default,) {final _that = this;
switch (_that) {
case _NotificationPreferencesView() when $default != null:
return $default(_that.securityEnabled,_that.systemEnabled,_that.marketingEnabled,_that.pushEnabled,_that.language);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationPreferencesView implements NotificationPreferencesView {
  const _NotificationPreferencesView({this.securityEnabled = true, this.systemEnabled = true, this.marketingEnabled = false, this.pushEnabled = true, this.language = NotificationLanguage.en});
  factory _NotificationPreferencesView.fromJson(Map<String, dynamic> json) => _$NotificationPreferencesViewFromJson(json);

@override@JsonKey() final  bool securityEnabled;
@override@JsonKey() final  bool systemEnabled;
/// Admin broadcasts. **Off by default**, which is why the settings
/// screen shows it as genuinely off rather than assuming true.
@override@JsonKey() final  bool marketingEnabled;
/// Narrower than the others: it suppresses the **push only**. The in-app
/// row is still written, so the inbox stays complete.
@override@JsonKey() final  bool pushEnabled;
@override@JsonKey() final  NotificationLanguage language;

/// Create a copy of NotificationPreferencesView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationPreferencesViewCopyWith<_NotificationPreferencesView> get copyWith => __$NotificationPreferencesViewCopyWithImpl<_NotificationPreferencesView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationPreferencesViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationPreferencesView&&(identical(other.securityEnabled, securityEnabled) || other.securityEnabled == securityEnabled)&&(identical(other.systemEnabled, systemEnabled) || other.systemEnabled == systemEnabled)&&(identical(other.marketingEnabled, marketingEnabled) || other.marketingEnabled == marketingEnabled)&&(identical(other.pushEnabled, pushEnabled) || other.pushEnabled == pushEnabled)&&(identical(other.language, language) || other.language == language));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,securityEnabled,systemEnabled,marketingEnabled,pushEnabled,language);

@override
String toString() {
  return 'NotificationPreferencesView(securityEnabled: $securityEnabled, systemEnabled: $systemEnabled, marketingEnabled: $marketingEnabled, pushEnabled: $pushEnabled, language: $language)';
}


}

/// @nodoc
abstract mixin class _$NotificationPreferencesViewCopyWith<$Res> implements $NotificationPreferencesViewCopyWith<$Res> {
  factory _$NotificationPreferencesViewCopyWith(_NotificationPreferencesView value, $Res Function(_NotificationPreferencesView) _then) = __$NotificationPreferencesViewCopyWithImpl;
@override @useResult
$Res call({
 bool securityEnabled, bool systemEnabled, bool marketingEnabled, bool pushEnabled, NotificationLanguage language
});




}
/// @nodoc
class __$NotificationPreferencesViewCopyWithImpl<$Res>
    implements _$NotificationPreferencesViewCopyWith<$Res> {
  __$NotificationPreferencesViewCopyWithImpl(this._self, this._then);

  final _NotificationPreferencesView _self;
  final $Res Function(_NotificationPreferencesView) _then;

/// Create a copy of NotificationPreferencesView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? securityEnabled = null,Object? systemEnabled = null,Object? marketingEnabled = null,Object? pushEnabled = null,Object? language = null,}) {
  return _then(_NotificationPreferencesView(
securityEnabled: null == securityEnabled ? _self.securityEnabled : securityEnabled // ignore: cast_nullable_to_non_nullable
as bool,systemEnabled: null == systemEnabled ? _self.systemEnabled : systemEnabled // ignore: cast_nullable_to_non_nullable
as bool,marketingEnabled: null == marketingEnabled ? _self.marketingEnabled : marketingEnabled // ignore: cast_nullable_to_non_nullable
as bool,pushEnabled: null == pushEnabled ? _self.pushEnabled : pushEnabled // ignore: cast_nullable_to_non_nullable
as bool,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as NotificationLanguage,
  ));
}


}


/// @nodoc
mixin _$UpdateNotificationPreferencesRequest {

 bool? get securityEnabled; bool? get systemEnabled; bool? get marketingEnabled; bool? get pushEnabled; NotificationLanguage? get language;
/// Create a copy of UpdateNotificationPreferencesRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateNotificationPreferencesRequestCopyWith<UpdateNotificationPreferencesRequest> get copyWith => _$UpdateNotificationPreferencesRequestCopyWithImpl<UpdateNotificationPreferencesRequest>(this as UpdateNotificationPreferencesRequest, _$identity);

  /// Serializes this UpdateNotificationPreferencesRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateNotificationPreferencesRequest&&(identical(other.securityEnabled, securityEnabled) || other.securityEnabled == securityEnabled)&&(identical(other.systemEnabled, systemEnabled) || other.systemEnabled == systemEnabled)&&(identical(other.marketingEnabled, marketingEnabled) || other.marketingEnabled == marketingEnabled)&&(identical(other.pushEnabled, pushEnabled) || other.pushEnabled == pushEnabled)&&(identical(other.language, language) || other.language == language));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,securityEnabled,systemEnabled,marketingEnabled,pushEnabled,language);

@override
String toString() {
  return 'UpdateNotificationPreferencesRequest(securityEnabled: $securityEnabled, systemEnabled: $systemEnabled, marketingEnabled: $marketingEnabled, pushEnabled: $pushEnabled, language: $language)';
}


}

/// @nodoc
abstract mixin class $UpdateNotificationPreferencesRequestCopyWith<$Res>  {
  factory $UpdateNotificationPreferencesRequestCopyWith(UpdateNotificationPreferencesRequest value, $Res Function(UpdateNotificationPreferencesRequest) _then) = _$UpdateNotificationPreferencesRequestCopyWithImpl;
@useResult
$Res call({
 bool? securityEnabled, bool? systemEnabled, bool? marketingEnabled, bool? pushEnabled, NotificationLanguage? language
});




}
/// @nodoc
class _$UpdateNotificationPreferencesRequestCopyWithImpl<$Res>
    implements $UpdateNotificationPreferencesRequestCopyWith<$Res> {
  _$UpdateNotificationPreferencesRequestCopyWithImpl(this._self, this._then);

  final UpdateNotificationPreferencesRequest _self;
  final $Res Function(UpdateNotificationPreferencesRequest) _then;

/// Create a copy of UpdateNotificationPreferencesRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? securityEnabled = freezed,Object? systemEnabled = freezed,Object? marketingEnabled = freezed,Object? pushEnabled = freezed,Object? language = freezed,}) {
  return _then(_self.copyWith(
securityEnabled: freezed == securityEnabled ? _self.securityEnabled : securityEnabled // ignore: cast_nullable_to_non_nullable
as bool?,systemEnabled: freezed == systemEnabled ? _self.systemEnabled : systemEnabled // ignore: cast_nullable_to_non_nullable
as bool?,marketingEnabled: freezed == marketingEnabled ? _self.marketingEnabled : marketingEnabled // ignore: cast_nullable_to_non_nullable
as bool?,pushEnabled: freezed == pushEnabled ? _self.pushEnabled : pushEnabled // ignore: cast_nullable_to_non_nullable
as bool?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as NotificationLanguage?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateNotificationPreferencesRequest].
extension UpdateNotificationPreferencesRequestPatterns on UpdateNotificationPreferencesRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateNotificationPreferencesRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateNotificationPreferencesRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateNotificationPreferencesRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateNotificationPreferencesRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateNotificationPreferencesRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateNotificationPreferencesRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? securityEnabled,  bool? systemEnabled,  bool? marketingEnabled,  bool? pushEnabled,  NotificationLanguage? language)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateNotificationPreferencesRequest() when $default != null:
return $default(_that.securityEnabled,_that.systemEnabled,_that.marketingEnabled,_that.pushEnabled,_that.language);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? securityEnabled,  bool? systemEnabled,  bool? marketingEnabled,  bool? pushEnabled,  NotificationLanguage? language)  $default,) {final _that = this;
switch (_that) {
case _UpdateNotificationPreferencesRequest():
return $default(_that.securityEnabled,_that.systemEnabled,_that.marketingEnabled,_that.pushEnabled,_that.language);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? securityEnabled,  bool? systemEnabled,  bool? marketingEnabled,  bool? pushEnabled,  NotificationLanguage? language)?  $default,) {final _that = this;
switch (_that) {
case _UpdateNotificationPreferencesRequest() when $default != null:
return $default(_that.securityEnabled,_that.systemEnabled,_that.marketingEnabled,_that.pushEnabled,_that.language);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _UpdateNotificationPreferencesRequest implements UpdateNotificationPreferencesRequest {
  const _UpdateNotificationPreferencesRequest({this.securityEnabled, this.systemEnabled, this.marketingEnabled, this.pushEnabled, this.language});
  factory _UpdateNotificationPreferencesRequest.fromJson(Map<String, dynamic> json) => _$UpdateNotificationPreferencesRequestFromJson(json);

@override final  bool? securityEnabled;
@override final  bool? systemEnabled;
@override final  bool? marketingEnabled;
@override final  bool? pushEnabled;
@override final  NotificationLanguage? language;

/// Create a copy of UpdateNotificationPreferencesRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateNotificationPreferencesRequestCopyWith<_UpdateNotificationPreferencesRequest> get copyWith => __$UpdateNotificationPreferencesRequestCopyWithImpl<_UpdateNotificationPreferencesRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateNotificationPreferencesRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateNotificationPreferencesRequest&&(identical(other.securityEnabled, securityEnabled) || other.securityEnabled == securityEnabled)&&(identical(other.systemEnabled, systemEnabled) || other.systemEnabled == systemEnabled)&&(identical(other.marketingEnabled, marketingEnabled) || other.marketingEnabled == marketingEnabled)&&(identical(other.pushEnabled, pushEnabled) || other.pushEnabled == pushEnabled)&&(identical(other.language, language) || other.language == language));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,securityEnabled,systemEnabled,marketingEnabled,pushEnabled,language);

@override
String toString() {
  return 'UpdateNotificationPreferencesRequest(securityEnabled: $securityEnabled, systemEnabled: $systemEnabled, marketingEnabled: $marketingEnabled, pushEnabled: $pushEnabled, language: $language)';
}


}

/// @nodoc
abstract mixin class _$UpdateNotificationPreferencesRequestCopyWith<$Res> implements $UpdateNotificationPreferencesRequestCopyWith<$Res> {
  factory _$UpdateNotificationPreferencesRequestCopyWith(_UpdateNotificationPreferencesRequest value, $Res Function(_UpdateNotificationPreferencesRequest) _then) = __$UpdateNotificationPreferencesRequestCopyWithImpl;
@override @useResult
$Res call({
 bool? securityEnabled, bool? systemEnabled, bool? marketingEnabled, bool? pushEnabled, NotificationLanguage? language
});




}
/// @nodoc
class __$UpdateNotificationPreferencesRequestCopyWithImpl<$Res>
    implements _$UpdateNotificationPreferencesRequestCopyWith<$Res> {
  __$UpdateNotificationPreferencesRequestCopyWithImpl(this._self, this._then);

  final _UpdateNotificationPreferencesRequest _self;
  final $Res Function(_UpdateNotificationPreferencesRequest) _then;

/// Create a copy of UpdateNotificationPreferencesRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? securityEnabled = freezed,Object? systemEnabled = freezed,Object? marketingEnabled = freezed,Object? pushEnabled = freezed,Object? language = freezed,}) {
  return _then(_UpdateNotificationPreferencesRequest(
securityEnabled: freezed == securityEnabled ? _self.securityEnabled : securityEnabled // ignore: cast_nullable_to_non_nullable
as bool?,systemEnabled: freezed == systemEnabled ? _self.systemEnabled : systemEnabled // ignore: cast_nullable_to_non_nullable
as bool?,marketingEnabled: freezed == marketingEnabled ? _self.marketingEnabled : marketingEnabled // ignore: cast_nullable_to_non_nullable
as bool?,pushEnabled: freezed == pushEnabled ? _self.pushEnabled : pushEnabled // ignore: cast_nullable_to_non_nullable
as bool?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as NotificationLanguage?,
  ));
}


}

// dart format on
