// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryRefView {

 String get id; String get slug; Localized get name; String get path;
/// Create a copy of CategoryRefView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryRefViewCopyWith<CategoryRefView> get copyWith => _$CategoryRefViewCopyWithImpl<CategoryRefView>(this as CategoryRefView, _$identity);

  /// Serializes this CategoryRefView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryRefView&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.path, path) || other.path == path));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,name,path);

@override
String toString() {
  return 'CategoryRefView(id: $id, slug: $slug, name: $name, path: $path)';
}


}

/// @nodoc
abstract mixin class $CategoryRefViewCopyWith<$Res>  {
  factory $CategoryRefViewCopyWith(CategoryRefView value, $Res Function(CategoryRefView) _then) = _$CategoryRefViewCopyWithImpl;
@useResult
$Res call({
 String id, String slug, Localized name, String path
});


$LocalizedCopyWith<$Res> get name;

}
/// @nodoc
class _$CategoryRefViewCopyWithImpl<$Res>
    implements $CategoryRefViewCopyWith<$Res> {
  _$CategoryRefViewCopyWithImpl(this._self, this._then);

  final CategoryRefView _self;
  final $Res Function(CategoryRefView) _then;

/// Create a copy of CategoryRefView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? path = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Localized,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of CategoryRefView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get name {
  
  return $LocalizedCopyWith<$Res>(_self.name, (value) {
    return _then(_self.copyWith(name: value));
  });
}
}


/// Adds pattern-matching-related methods to [CategoryRefView].
extension CategoryRefViewPatterns on CategoryRefView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryRefView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryRefView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryRefView value)  $default,){
final _that = this;
switch (_that) {
case _CategoryRefView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryRefView value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryRefView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String slug,  Localized name,  String path)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryRefView() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.path);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String slug,  Localized name,  String path)  $default,) {final _that = this;
switch (_that) {
case _CategoryRefView():
return $default(_that.id,_that.slug,_that.name,_that.path);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String slug,  Localized name,  String path)?  $default,) {final _that = this;
switch (_that) {
case _CategoryRefView() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.path);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryRefView implements CategoryRefView {
  const _CategoryRefView({required this.id, required this.slug, required this.name, required this.path});
  factory _CategoryRefView.fromJson(Map<String, dynamic> json) => _$CategoryRefViewFromJson(json);

@override final  String id;
@override final  String slug;
@override final  Localized name;
@override final  String path;

/// Create a copy of CategoryRefView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryRefViewCopyWith<_CategoryRefView> get copyWith => __$CategoryRefViewCopyWithImpl<_CategoryRefView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryRefViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryRefView&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.path, path) || other.path == path));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,name,path);

@override
String toString() {
  return 'CategoryRefView(id: $id, slug: $slug, name: $name, path: $path)';
}


}

/// @nodoc
abstract mixin class _$CategoryRefViewCopyWith<$Res> implements $CategoryRefViewCopyWith<$Res> {
  factory _$CategoryRefViewCopyWith(_CategoryRefView value, $Res Function(_CategoryRefView) _then) = __$CategoryRefViewCopyWithImpl;
@override @useResult
$Res call({
 String id, String slug, Localized name, String path
});


@override $LocalizedCopyWith<$Res> get name;

}
/// @nodoc
class __$CategoryRefViewCopyWithImpl<$Res>
    implements _$CategoryRefViewCopyWith<$Res> {
  __$CategoryRefViewCopyWithImpl(this._self, this._then);

  final _CategoryRefView _self;
  final $Res Function(_CategoryRefView) _then;

/// Create a copy of CategoryRefView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? path = null,}) {
  return _then(_CategoryRefView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Localized,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of CategoryRefView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get name {
  
  return $LocalizedCopyWith<$Res>(_self.name, (value) {
    return _then(_self.copyWith(name: value));
  });
}
}


/// @nodoc
mixin _$CategoryView {

 String get id; String get slug; Localized get name; String get path; String? get parentId; Localized? get description; String? get imageUrl; int get depth; int get sortOrder; int get productCount; int get subtreeProductCount;/// Present only under `?tree=true`. **Absent** (not null) in flat mode.
 List<CategoryView>? get children;
/// Create a copy of CategoryView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryViewCopyWith<CategoryView> get copyWith => _$CategoryViewCopyWithImpl<CategoryView>(this as CategoryView, _$identity);

  /// Serializes this CategoryView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryView&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.path, path) || other.path == path)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.depth, depth) || other.depth == depth)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.productCount, productCount) || other.productCount == productCount)&&(identical(other.subtreeProductCount, subtreeProductCount) || other.subtreeProductCount == subtreeProductCount)&&const DeepCollectionEquality().equals(other.children, children));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,name,path,parentId,description,imageUrl,depth,sortOrder,productCount,subtreeProductCount,const DeepCollectionEquality().hash(children));

@override
String toString() {
  return 'CategoryView(id: $id, slug: $slug, name: $name, path: $path, parentId: $parentId, description: $description, imageUrl: $imageUrl, depth: $depth, sortOrder: $sortOrder, productCount: $productCount, subtreeProductCount: $subtreeProductCount, children: $children)';
}


}

/// @nodoc
abstract mixin class $CategoryViewCopyWith<$Res>  {
  factory $CategoryViewCopyWith(CategoryView value, $Res Function(CategoryView) _then) = _$CategoryViewCopyWithImpl;
@useResult
$Res call({
 String id, String slug, Localized name, String path, String? parentId, Localized? description, String? imageUrl, int depth, int sortOrder, int productCount, int subtreeProductCount, List<CategoryView>? children
});


$LocalizedCopyWith<$Res> get name;$LocalizedCopyWith<$Res>? get description;

}
/// @nodoc
class _$CategoryViewCopyWithImpl<$Res>
    implements $CategoryViewCopyWith<$Res> {
  _$CategoryViewCopyWithImpl(this._self, this._then);

  final CategoryView _self;
  final $Res Function(CategoryView) _then;

/// Create a copy of CategoryView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? path = null,Object? parentId = freezed,Object? description = freezed,Object? imageUrl = freezed,Object? depth = null,Object? sortOrder = null,Object? productCount = null,Object? subtreeProductCount = null,Object? children = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Localized,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as Localized?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,depth: null == depth ? _self.depth : depth // ignore: cast_nullable_to_non_nullable
as int,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,productCount: null == productCount ? _self.productCount : productCount // ignore: cast_nullable_to_non_nullable
as int,subtreeProductCount: null == subtreeProductCount ? _self.subtreeProductCount : subtreeProductCount // ignore: cast_nullable_to_non_nullable
as int,children: freezed == children ? _self.children : children // ignore: cast_nullable_to_non_nullable
as List<CategoryView>?,
  ));
}
/// Create a copy of CategoryView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get name {
  
  return $LocalizedCopyWith<$Res>(_self.name, (value) {
    return _then(_self.copyWith(name: value));
  });
}/// Create a copy of CategoryView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res>? get description {
    if (_self.description == null) {
    return null;
  }

  return $LocalizedCopyWith<$Res>(_self.description!, (value) {
    return _then(_self.copyWith(description: value));
  });
}
}


/// Adds pattern-matching-related methods to [CategoryView].
extension CategoryViewPatterns on CategoryView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryView value)  $default,){
final _that = this;
switch (_that) {
case _CategoryView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryView value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String slug,  Localized name,  String path,  String? parentId,  Localized? description,  String? imageUrl,  int depth,  int sortOrder,  int productCount,  int subtreeProductCount,  List<CategoryView>? children)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryView() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.path,_that.parentId,_that.description,_that.imageUrl,_that.depth,_that.sortOrder,_that.productCount,_that.subtreeProductCount,_that.children);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String slug,  Localized name,  String path,  String? parentId,  Localized? description,  String? imageUrl,  int depth,  int sortOrder,  int productCount,  int subtreeProductCount,  List<CategoryView>? children)  $default,) {final _that = this;
switch (_that) {
case _CategoryView():
return $default(_that.id,_that.slug,_that.name,_that.path,_that.parentId,_that.description,_that.imageUrl,_that.depth,_that.sortOrder,_that.productCount,_that.subtreeProductCount,_that.children);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String slug,  Localized name,  String path,  String? parentId,  Localized? description,  String? imageUrl,  int depth,  int sortOrder,  int productCount,  int subtreeProductCount,  List<CategoryView>? children)?  $default,) {final _that = this;
switch (_that) {
case _CategoryView() when $default != null:
return $default(_that.id,_that.slug,_that.name,_that.path,_that.parentId,_that.description,_that.imageUrl,_that.depth,_that.sortOrder,_that.productCount,_that.subtreeProductCount,_that.children);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryView implements CategoryView {
  const _CategoryView({required this.id, required this.slug, required this.name, required this.path, this.parentId, this.description, this.imageUrl, this.depth = 0, this.sortOrder = 0, this.productCount = 0, this.subtreeProductCount = 0, final  List<CategoryView>? children}): _children = children;
  factory _CategoryView.fromJson(Map<String, dynamic> json) => _$CategoryViewFromJson(json);

@override final  String id;
@override final  String slug;
@override final  Localized name;
@override final  String path;
@override final  String? parentId;
@override final  Localized? description;
@override final  String? imageUrl;
@override@JsonKey() final  int depth;
@override@JsonKey() final  int sortOrder;
@override@JsonKey() final  int productCount;
@override@JsonKey() final  int subtreeProductCount;
/// Present only under `?tree=true`. **Absent** (not null) in flat mode.
 final  List<CategoryView>? _children;
/// Present only under `?tree=true`. **Absent** (not null) in flat mode.
@override List<CategoryView>? get children {
  final value = _children;
  if (value == null) return null;
  if (_children is EqualUnmodifiableListView) return _children;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CategoryView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryViewCopyWith<_CategoryView> get copyWith => __$CategoryViewCopyWithImpl<_CategoryView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryView&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.path, path) || other.path == path)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.depth, depth) || other.depth == depth)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.productCount, productCount) || other.productCount == productCount)&&(identical(other.subtreeProductCount, subtreeProductCount) || other.subtreeProductCount == subtreeProductCount)&&const DeepCollectionEquality().equals(other._children, _children));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,name,path,parentId,description,imageUrl,depth,sortOrder,productCount,subtreeProductCount,const DeepCollectionEquality().hash(_children));

@override
String toString() {
  return 'CategoryView(id: $id, slug: $slug, name: $name, path: $path, parentId: $parentId, description: $description, imageUrl: $imageUrl, depth: $depth, sortOrder: $sortOrder, productCount: $productCount, subtreeProductCount: $subtreeProductCount, children: $children)';
}


}

/// @nodoc
abstract mixin class _$CategoryViewCopyWith<$Res> implements $CategoryViewCopyWith<$Res> {
  factory _$CategoryViewCopyWith(_CategoryView value, $Res Function(_CategoryView) _then) = __$CategoryViewCopyWithImpl;
@override @useResult
$Res call({
 String id, String slug, Localized name, String path, String? parentId, Localized? description, String? imageUrl, int depth, int sortOrder, int productCount, int subtreeProductCount, List<CategoryView>? children
});


@override $LocalizedCopyWith<$Res> get name;@override $LocalizedCopyWith<$Res>? get description;

}
/// @nodoc
class __$CategoryViewCopyWithImpl<$Res>
    implements _$CategoryViewCopyWith<$Res> {
  __$CategoryViewCopyWithImpl(this._self, this._then);

  final _CategoryView _self;
  final $Res Function(_CategoryView) _then;

/// Create a copy of CategoryView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? name = null,Object? path = null,Object? parentId = freezed,Object? description = freezed,Object? imageUrl = freezed,Object? depth = null,Object? sortOrder = null,Object? productCount = null,Object? subtreeProductCount = null,Object? children = freezed,}) {
  return _then(_CategoryView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Localized,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as Localized?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,depth: null == depth ? _self.depth : depth // ignore: cast_nullable_to_non_nullable
as int,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,productCount: null == productCount ? _self.productCount : productCount // ignore: cast_nullable_to_non_nullable
as int,subtreeProductCount: null == subtreeProductCount ? _self.subtreeProductCount : subtreeProductCount // ignore: cast_nullable_to_non_nullable
as int,children: freezed == children ? _self._children : children // ignore: cast_nullable_to_non_nullable
as List<CategoryView>?,
  ));
}

/// Create a copy of CategoryView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get name {
  
  return $LocalizedCopyWith<$Res>(_self.name, (value) {
    return _then(_self.copyWith(name: value));
  });
}/// Create a copy of CategoryView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res>? get description {
    if (_self.description == null) {
    return null;
  }

  return $LocalizedCopyWith<$Res>(_self.description!, (value) {
    return _then(_self.copyWith(description: value));
  });
}
}


/// @nodoc
mixin _$GetCategoryResultView {

 CategoryView get category; List<CategoryView> get breadcrumb; List<CategoryView> get children;
/// Create a copy of GetCategoryResultView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetCategoryResultViewCopyWith<GetCategoryResultView> get copyWith => _$GetCategoryResultViewCopyWithImpl<GetCategoryResultView>(this as GetCategoryResultView, _$identity);

  /// Serializes this GetCategoryResultView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetCategoryResultView&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other.breadcrumb, breadcrumb)&&const DeepCollectionEquality().equals(other.children, children));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,const DeepCollectionEquality().hash(breadcrumb),const DeepCollectionEquality().hash(children));

@override
String toString() {
  return 'GetCategoryResultView(category: $category, breadcrumb: $breadcrumb, children: $children)';
}


}

/// @nodoc
abstract mixin class $GetCategoryResultViewCopyWith<$Res>  {
  factory $GetCategoryResultViewCopyWith(GetCategoryResultView value, $Res Function(GetCategoryResultView) _then) = _$GetCategoryResultViewCopyWithImpl;
@useResult
$Res call({
 CategoryView category, List<CategoryView> breadcrumb, List<CategoryView> children
});


$CategoryViewCopyWith<$Res> get category;

}
/// @nodoc
class _$GetCategoryResultViewCopyWithImpl<$Res>
    implements $GetCategoryResultViewCopyWith<$Res> {
  _$GetCategoryResultViewCopyWithImpl(this._self, this._then);

  final GetCategoryResultView _self;
  final $Res Function(GetCategoryResultView) _then;

/// Create a copy of GetCategoryResultView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? breadcrumb = null,Object? children = null,}) {
  return _then(_self.copyWith(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryView,breadcrumb: null == breadcrumb ? _self.breadcrumb : breadcrumb // ignore: cast_nullable_to_non_nullable
as List<CategoryView>,children: null == children ? _self.children : children // ignore: cast_nullable_to_non_nullable
as List<CategoryView>,
  ));
}
/// Create a copy of GetCategoryResultView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryViewCopyWith<$Res> get category {
  
  return $CategoryViewCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// Adds pattern-matching-related methods to [GetCategoryResultView].
extension GetCategoryResultViewPatterns on GetCategoryResultView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetCategoryResultView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetCategoryResultView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetCategoryResultView value)  $default,){
final _that = this;
switch (_that) {
case _GetCategoryResultView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetCategoryResultView value)?  $default,){
final _that = this;
switch (_that) {
case _GetCategoryResultView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CategoryView category,  List<CategoryView> breadcrumb,  List<CategoryView> children)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetCategoryResultView() when $default != null:
return $default(_that.category,_that.breadcrumb,_that.children);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CategoryView category,  List<CategoryView> breadcrumb,  List<CategoryView> children)  $default,) {final _that = this;
switch (_that) {
case _GetCategoryResultView():
return $default(_that.category,_that.breadcrumb,_that.children);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CategoryView category,  List<CategoryView> breadcrumb,  List<CategoryView> children)?  $default,) {final _that = this;
switch (_that) {
case _GetCategoryResultView() when $default != null:
return $default(_that.category,_that.breadcrumb,_that.children);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetCategoryResultView implements GetCategoryResultView {
  const _GetCategoryResultView({required this.category, final  List<CategoryView> breadcrumb = const <CategoryView>[], final  List<CategoryView> children = const <CategoryView>[]}): _breadcrumb = breadcrumb,_children = children;
  factory _GetCategoryResultView.fromJson(Map<String, dynamic> json) => _$GetCategoryResultViewFromJson(json);

@override final  CategoryView category;
 final  List<CategoryView> _breadcrumb;
@override@JsonKey() List<CategoryView> get breadcrumb {
  if (_breadcrumb is EqualUnmodifiableListView) return _breadcrumb;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_breadcrumb);
}

 final  List<CategoryView> _children;
@override@JsonKey() List<CategoryView> get children {
  if (_children is EqualUnmodifiableListView) return _children;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_children);
}


/// Create a copy of GetCategoryResultView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetCategoryResultViewCopyWith<_GetCategoryResultView> get copyWith => __$GetCategoryResultViewCopyWithImpl<_GetCategoryResultView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetCategoryResultViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetCategoryResultView&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._breadcrumb, _breadcrumb)&&const DeepCollectionEquality().equals(other._children, _children));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,const DeepCollectionEquality().hash(_breadcrumb),const DeepCollectionEquality().hash(_children));

@override
String toString() {
  return 'GetCategoryResultView(category: $category, breadcrumb: $breadcrumb, children: $children)';
}


}

/// @nodoc
abstract mixin class _$GetCategoryResultViewCopyWith<$Res> implements $GetCategoryResultViewCopyWith<$Res> {
  factory _$GetCategoryResultViewCopyWith(_GetCategoryResultView value, $Res Function(_GetCategoryResultView) _then) = __$GetCategoryResultViewCopyWithImpl;
@override @useResult
$Res call({
 CategoryView category, List<CategoryView> breadcrumb, List<CategoryView> children
});


@override $CategoryViewCopyWith<$Res> get category;

}
/// @nodoc
class __$GetCategoryResultViewCopyWithImpl<$Res>
    implements _$GetCategoryResultViewCopyWith<$Res> {
  __$GetCategoryResultViewCopyWithImpl(this._self, this._then);

  final _GetCategoryResultView _self;
  final $Res Function(_GetCategoryResultView) _then;

/// Create a copy of GetCategoryResultView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? breadcrumb = null,Object? children = null,}) {
  return _then(_GetCategoryResultView(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryView,breadcrumb: null == breadcrumb ? _self._breadcrumb : breadcrumb // ignore: cast_nullable_to_non_nullable
as List<CategoryView>,children: null == children ? _self._children : children // ignore: cast_nullable_to_non_nullable
as List<CategoryView>,
  ));
}

/// Create a copy of GetCategoryResultView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryViewCopyWith<$Res> get category {
  
  return $CategoryViewCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

// dart format on
