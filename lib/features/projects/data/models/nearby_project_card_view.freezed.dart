// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_project_card_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NearbyOwnerRefView {

 String get firstName; String get lastName;
/// Create a copy of NearbyOwnerRefView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NearbyOwnerRefViewCopyWith<NearbyOwnerRefView> get copyWith => _$NearbyOwnerRefViewCopyWithImpl<NearbyOwnerRefView>(this as NearbyOwnerRefView, _$identity);

  /// Serializes this NearbyOwnerRefView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyOwnerRefView&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName);

@override
String toString() {
  return 'NearbyOwnerRefView(firstName: $firstName, lastName: $lastName)';
}


}

/// @nodoc
abstract mixin class $NearbyOwnerRefViewCopyWith<$Res>  {
  factory $NearbyOwnerRefViewCopyWith(NearbyOwnerRefView value, $Res Function(NearbyOwnerRefView) _then) = _$NearbyOwnerRefViewCopyWithImpl;
@useResult
$Res call({
 String firstName, String lastName
});




}
/// @nodoc
class _$NearbyOwnerRefViewCopyWithImpl<$Res>
    implements $NearbyOwnerRefViewCopyWith<$Res> {
  _$NearbyOwnerRefViewCopyWithImpl(this._self, this._then);

  final NearbyOwnerRefView _self;
  final $Res Function(NearbyOwnerRefView) _then;

/// Create a copy of NearbyOwnerRefView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = null,Object? lastName = null,}) {
  return _then(_self.copyWith(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NearbyOwnerRefView].
extension NearbyOwnerRefViewPatterns on NearbyOwnerRefView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NearbyOwnerRefView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NearbyOwnerRefView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NearbyOwnerRefView value)  $default,){
final _that = this;
switch (_that) {
case _NearbyOwnerRefView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NearbyOwnerRefView value)?  $default,){
final _that = this;
switch (_that) {
case _NearbyOwnerRefView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String firstName,  String lastName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NearbyOwnerRefView() when $default != null:
return $default(_that.firstName,_that.lastName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String firstName,  String lastName)  $default,) {final _that = this;
switch (_that) {
case _NearbyOwnerRefView():
return $default(_that.firstName,_that.lastName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String firstName,  String lastName)?  $default,) {final _that = this;
switch (_that) {
case _NearbyOwnerRefView() when $default != null:
return $default(_that.firstName,_that.lastName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NearbyOwnerRefView implements NearbyOwnerRefView {
  const _NearbyOwnerRefView({required this.firstName, required this.lastName});
  factory _NearbyOwnerRefView.fromJson(Map<String, dynamic> json) => _$NearbyOwnerRefViewFromJson(json);

@override final  String firstName;
@override final  String lastName;

/// Create a copy of NearbyOwnerRefView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NearbyOwnerRefViewCopyWith<_NearbyOwnerRefView> get copyWith => __$NearbyOwnerRefViewCopyWithImpl<_NearbyOwnerRefView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NearbyOwnerRefViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NearbyOwnerRefView&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName);

@override
String toString() {
  return 'NearbyOwnerRefView(firstName: $firstName, lastName: $lastName)';
}


}

/// @nodoc
abstract mixin class _$NearbyOwnerRefViewCopyWith<$Res> implements $NearbyOwnerRefViewCopyWith<$Res> {
  factory _$NearbyOwnerRefViewCopyWith(_NearbyOwnerRefView value, $Res Function(_NearbyOwnerRefView) _then) = __$NearbyOwnerRefViewCopyWithImpl;
@override @useResult
$Res call({
 String firstName, String lastName
});




}
/// @nodoc
class __$NearbyOwnerRefViewCopyWithImpl<$Res>
    implements _$NearbyOwnerRefViewCopyWith<$Res> {
  __$NearbyOwnerRefViewCopyWithImpl(this._self, this._then);

  final _NearbyOwnerRefView _self;
  final $Res Function(_NearbyOwnerRefView) _then;

/// Create a copy of NearbyOwnerRefView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = null,Object? lastName = null,}) {
  return _then(_NearbyOwnerRefView(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$NearbyProjectCardView {

 String get name; BuildingType get buildingType; String get description; double get latitude; double get longitude; String? get addressLine; ConstructionPhase get constructionPhase; ProjectStage get stage; ProjectStatus get status; NearbyOwnerRefView get owner; int? get unitCount; double? get estimatedValue; String? get currency; List<StoredFileView> get images; double get distanceM; String? get projectId; bool? get isYours;
/// Create a copy of NearbyProjectCardView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NearbyProjectCardViewCopyWith<NearbyProjectCardView> get copyWith => _$NearbyProjectCardViewCopyWithImpl<NearbyProjectCardView>(this as NearbyProjectCardView, _$identity);

  /// Serializes this NearbyProjectCardView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyProjectCardView&&(identical(other.name, name) || other.name == name)&&(identical(other.buildingType, buildingType) || other.buildingType == buildingType)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.addressLine, addressLine) || other.addressLine == addressLine)&&(identical(other.constructionPhase, constructionPhase) || other.constructionPhase == constructionPhase)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.status, status) || other.status == status)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.unitCount, unitCount) || other.unitCount == unitCount)&&(identical(other.estimatedValue, estimatedValue) || other.estimatedValue == estimatedValue)&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.distanceM, distanceM) || other.distanceM == distanceM)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.isYours, isYours) || other.isYours == isYours));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,buildingType,description,latitude,longitude,addressLine,constructionPhase,stage,status,owner,unitCount,estimatedValue,currency,const DeepCollectionEquality().hash(images),distanceM,projectId,isYours);

@override
String toString() {
  return 'NearbyProjectCardView(name: $name, buildingType: $buildingType, description: $description, latitude: $latitude, longitude: $longitude, addressLine: $addressLine, constructionPhase: $constructionPhase, stage: $stage, status: $status, owner: $owner, unitCount: $unitCount, estimatedValue: $estimatedValue, currency: $currency, images: $images, distanceM: $distanceM, projectId: $projectId, isYours: $isYours)';
}


}

/// @nodoc
abstract mixin class $NearbyProjectCardViewCopyWith<$Res>  {
  factory $NearbyProjectCardViewCopyWith(NearbyProjectCardView value, $Res Function(NearbyProjectCardView) _then) = _$NearbyProjectCardViewCopyWithImpl;
@useResult
$Res call({
 String name, BuildingType buildingType, String description, double latitude, double longitude, String? addressLine, ConstructionPhase constructionPhase, ProjectStage stage, ProjectStatus status, NearbyOwnerRefView owner, int? unitCount, double? estimatedValue, String? currency, List<StoredFileView> images, double distanceM, String? projectId, bool? isYours
});


$NearbyOwnerRefViewCopyWith<$Res> get owner;

}
/// @nodoc
class _$NearbyProjectCardViewCopyWithImpl<$Res>
    implements $NearbyProjectCardViewCopyWith<$Res> {
  _$NearbyProjectCardViewCopyWithImpl(this._self, this._then);

  final NearbyProjectCardView _self;
  final $Res Function(NearbyProjectCardView) _then;

/// Create a copy of NearbyProjectCardView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? buildingType = null,Object? description = null,Object? latitude = null,Object? longitude = null,Object? addressLine = freezed,Object? constructionPhase = null,Object? stage = null,Object? status = null,Object? owner = null,Object? unitCount = freezed,Object? estimatedValue = freezed,Object? currency = freezed,Object? images = null,Object? distanceM = null,Object? projectId = freezed,Object? isYours = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,buildingType: null == buildingType ? _self.buildingType : buildingType // ignore: cast_nullable_to_non_nullable
as BuildingType,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,addressLine: freezed == addressLine ? _self.addressLine : addressLine // ignore: cast_nullable_to_non_nullable
as String?,constructionPhase: null == constructionPhase ? _self.constructionPhase : constructionPhase // ignore: cast_nullable_to_non_nullable
as ConstructionPhase,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as ProjectStage,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as NearbyOwnerRefView,unitCount: freezed == unitCount ? _self.unitCount : unitCount // ignore: cast_nullable_to_non_nullable
as int?,estimatedValue: freezed == estimatedValue ? _self.estimatedValue : estimatedValue // ignore: cast_nullable_to_non_nullable
as double?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<StoredFileView>,distanceM: null == distanceM ? _self.distanceM : distanceM // ignore: cast_nullable_to_non_nullable
as double,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,isYours: freezed == isYours ? _self.isYours : isYours // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of NearbyProjectCardView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NearbyOwnerRefViewCopyWith<$Res> get owner {
  
  return $NearbyOwnerRefViewCopyWith<$Res>(_self.owner, (value) {
    return _then(_self.copyWith(owner: value));
  });
}
}


/// Adds pattern-matching-related methods to [NearbyProjectCardView].
extension NearbyProjectCardViewPatterns on NearbyProjectCardView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NearbyProjectCardView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NearbyProjectCardView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NearbyProjectCardView value)  $default,){
final _that = this;
switch (_that) {
case _NearbyProjectCardView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NearbyProjectCardView value)?  $default,){
final _that = this;
switch (_that) {
case _NearbyProjectCardView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  BuildingType buildingType,  String description,  double latitude,  double longitude,  String? addressLine,  ConstructionPhase constructionPhase,  ProjectStage stage,  ProjectStatus status,  NearbyOwnerRefView owner,  int? unitCount,  double? estimatedValue,  String? currency,  List<StoredFileView> images,  double distanceM,  String? projectId,  bool? isYours)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NearbyProjectCardView() when $default != null:
return $default(_that.name,_that.buildingType,_that.description,_that.latitude,_that.longitude,_that.addressLine,_that.constructionPhase,_that.stage,_that.status,_that.owner,_that.unitCount,_that.estimatedValue,_that.currency,_that.images,_that.distanceM,_that.projectId,_that.isYours);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  BuildingType buildingType,  String description,  double latitude,  double longitude,  String? addressLine,  ConstructionPhase constructionPhase,  ProjectStage stage,  ProjectStatus status,  NearbyOwnerRefView owner,  int? unitCount,  double? estimatedValue,  String? currency,  List<StoredFileView> images,  double distanceM,  String? projectId,  bool? isYours)  $default,) {final _that = this;
switch (_that) {
case _NearbyProjectCardView():
return $default(_that.name,_that.buildingType,_that.description,_that.latitude,_that.longitude,_that.addressLine,_that.constructionPhase,_that.stage,_that.status,_that.owner,_that.unitCount,_that.estimatedValue,_that.currency,_that.images,_that.distanceM,_that.projectId,_that.isYours);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  BuildingType buildingType,  String description,  double latitude,  double longitude,  String? addressLine,  ConstructionPhase constructionPhase,  ProjectStage stage,  ProjectStatus status,  NearbyOwnerRefView owner,  int? unitCount,  double? estimatedValue,  String? currency,  List<StoredFileView> images,  double distanceM,  String? projectId,  bool? isYours)?  $default,) {final _that = this;
switch (_that) {
case _NearbyProjectCardView() when $default != null:
return $default(_that.name,_that.buildingType,_that.description,_that.latitude,_that.longitude,_that.addressLine,_that.constructionPhase,_that.stage,_that.status,_that.owner,_that.unitCount,_that.estimatedValue,_that.currency,_that.images,_that.distanceM,_that.projectId,_that.isYours);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NearbyProjectCardView implements NearbyProjectCardView {
  const _NearbyProjectCardView({required this.name, required this.buildingType, required this.description, required this.latitude, required this.longitude, this.addressLine, required this.constructionPhase, required this.stage, required this.status, required this.owner, this.unitCount, this.estimatedValue, this.currency, final  List<StoredFileView> images = const <StoredFileView>[], required this.distanceM, this.projectId, this.isYours}): _images = images;
  factory _NearbyProjectCardView.fromJson(Map<String, dynamic> json) => _$NearbyProjectCardViewFromJson(json);

@override final  String name;
@override final  BuildingType buildingType;
@override final  String description;
@override final  double latitude;
@override final  double longitude;
@override final  String? addressLine;
@override final  ConstructionPhase constructionPhase;
@override final  ProjectStage stage;
@override final  ProjectStatus status;
@override final  NearbyOwnerRefView owner;
@override final  int? unitCount;
@override final  double? estimatedValue;
@override final  String? currency;
 final  List<StoredFileView> _images;
@override@JsonKey() List<StoredFileView> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override final  double distanceM;
@override final  String? projectId;
@override final  bool? isYours;

/// Create a copy of NearbyProjectCardView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NearbyProjectCardViewCopyWith<_NearbyProjectCardView> get copyWith => __$NearbyProjectCardViewCopyWithImpl<_NearbyProjectCardView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NearbyProjectCardViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NearbyProjectCardView&&(identical(other.name, name) || other.name == name)&&(identical(other.buildingType, buildingType) || other.buildingType == buildingType)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.addressLine, addressLine) || other.addressLine == addressLine)&&(identical(other.constructionPhase, constructionPhase) || other.constructionPhase == constructionPhase)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.status, status) || other.status == status)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.unitCount, unitCount) || other.unitCount == unitCount)&&(identical(other.estimatedValue, estimatedValue) || other.estimatedValue == estimatedValue)&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.distanceM, distanceM) || other.distanceM == distanceM)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.isYours, isYours) || other.isYours == isYours));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,buildingType,description,latitude,longitude,addressLine,constructionPhase,stage,status,owner,unitCount,estimatedValue,currency,const DeepCollectionEquality().hash(_images),distanceM,projectId,isYours);

@override
String toString() {
  return 'NearbyProjectCardView(name: $name, buildingType: $buildingType, description: $description, latitude: $latitude, longitude: $longitude, addressLine: $addressLine, constructionPhase: $constructionPhase, stage: $stage, status: $status, owner: $owner, unitCount: $unitCount, estimatedValue: $estimatedValue, currency: $currency, images: $images, distanceM: $distanceM, projectId: $projectId, isYours: $isYours)';
}


}

/// @nodoc
abstract mixin class _$NearbyProjectCardViewCopyWith<$Res> implements $NearbyProjectCardViewCopyWith<$Res> {
  factory _$NearbyProjectCardViewCopyWith(_NearbyProjectCardView value, $Res Function(_NearbyProjectCardView) _then) = __$NearbyProjectCardViewCopyWithImpl;
@override @useResult
$Res call({
 String name, BuildingType buildingType, String description, double latitude, double longitude, String? addressLine, ConstructionPhase constructionPhase, ProjectStage stage, ProjectStatus status, NearbyOwnerRefView owner, int? unitCount, double? estimatedValue, String? currency, List<StoredFileView> images, double distanceM, String? projectId, bool? isYours
});


@override $NearbyOwnerRefViewCopyWith<$Res> get owner;

}
/// @nodoc
class __$NearbyProjectCardViewCopyWithImpl<$Res>
    implements _$NearbyProjectCardViewCopyWith<$Res> {
  __$NearbyProjectCardViewCopyWithImpl(this._self, this._then);

  final _NearbyProjectCardView _self;
  final $Res Function(_NearbyProjectCardView) _then;

/// Create a copy of NearbyProjectCardView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? buildingType = null,Object? description = null,Object? latitude = null,Object? longitude = null,Object? addressLine = freezed,Object? constructionPhase = null,Object? stage = null,Object? status = null,Object? owner = null,Object? unitCount = freezed,Object? estimatedValue = freezed,Object? currency = freezed,Object? images = null,Object? distanceM = null,Object? projectId = freezed,Object? isYours = freezed,}) {
  return _then(_NearbyProjectCardView(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,buildingType: null == buildingType ? _self.buildingType : buildingType // ignore: cast_nullable_to_non_nullable
as BuildingType,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,addressLine: freezed == addressLine ? _self.addressLine : addressLine // ignore: cast_nullable_to_non_nullable
as String?,constructionPhase: null == constructionPhase ? _self.constructionPhase : constructionPhase // ignore: cast_nullable_to_non_nullable
as ConstructionPhase,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as ProjectStage,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as NearbyOwnerRefView,unitCount: freezed == unitCount ? _self.unitCount : unitCount // ignore: cast_nullable_to_non_nullable
as int?,estimatedValue: freezed == estimatedValue ? _self.estimatedValue : estimatedValue // ignore: cast_nullable_to_non_nullable
as double?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<StoredFileView>,distanceM: null == distanceM ? _self.distanceM : distanceM // ignore: cast_nullable_to_non_nullable
as double,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,isYours: freezed == isYours ? _self.isYours : isYours // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of NearbyProjectCardView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NearbyOwnerRefViewCopyWith<$Res> get owner {
  
  return $NearbyOwnerRefViewCopyWith<$Res>(_self.owner, (value) {
    return _then(_self.copyWith(owner: value));
  });
}
}

// dart format on
