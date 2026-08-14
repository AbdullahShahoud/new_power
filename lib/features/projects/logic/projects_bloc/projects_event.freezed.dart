// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'projects_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectsEvent()';
}


}

/// @nodoc
class $ProjectsEventCopyWith<$Res>  {
$ProjectsEventCopyWith(ProjectsEvent _, $Res Function(ProjectsEvent) __);
}


/// Adds pattern-matching-related methods to [ProjectsEvent].
extension ProjectsEventPatterns on ProjectsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProjectsListRequested value)?  listRequested,TResult Function( ProjectsListRefreshed value)?  listRefreshed,TResult Function( ProjectsNextPageRequested value)?  nextPageRequested,TResult Function( ProjectsFilterChanged value)?  filterChanged,TResult Function( ProjectsSearchChanged value)?  searchChanged,TResult Function( ProjectsNearbyRequested value)?  nearbyRequested,TResult Function( ProjectRegisterSubmitted value)?  registerSubmitted,TResult Function( ProjectDetailRequested value)?  detailRequested,TResult Function( ProjectDetailRefreshed value)?  detailRefreshed,TResult Function( ProjectPatchSubmitted value)?  patchSubmitted,TResult Function( ProjectStageChangeSubmitted value)?  stageChangeSubmitted,TResult Function( ProjectStatusChangeSubmitted value)?  statusChangeSubmitted,TResult Function( ProjectLocationChangeSubmitted value)?  locationChangeSubmitted,TResult Function( ProjectHistoryRequested value)?  historyRequested,TResult Function( ProjectHistoryNextPageRequested value)?  historyNextPageRequested,TResult Function( ProjectImagesAddSubmitted value)?  imagesAddSubmitted,TResult Function( ProjectImageRemoveSubmitted value)?  imageRemoveSubmitted,TResult Function( ProjectRetryRequested value)?  retryRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProjectsListRequested() when listRequested != null:
return listRequested(_that);case ProjectsListRefreshed() when listRefreshed != null:
return listRefreshed(_that);case ProjectsNextPageRequested() when nextPageRequested != null:
return nextPageRequested(_that);case ProjectsFilterChanged() when filterChanged != null:
return filterChanged(_that);case ProjectsSearchChanged() when searchChanged != null:
return searchChanged(_that);case ProjectsNearbyRequested() when nearbyRequested != null:
return nearbyRequested(_that);case ProjectRegisterSubmitted() when registerSubmitted != null:
return registerSubmitted(_that);case ProjectDetailRequested() when detailRequested != null:
return detailRequested(_that);case ProjectDetailRefreshed() when detailRefreshed != null:
return detailRefreshed(_that);case ProjectPatchSubmitted() when patchSubmitted != null:
return patchSubmitted(_that);case ProjectStageChangeSubmitted() when stageChangeSubmitted != null:
return stageChangeSubmitted(_that);case ProjectStatusChangeSubmitted() when statusChangeSubmitted != null:
return statusChangeSubmitted(_that);case ProjectLocationChangeSubmitted() when locationChangeSubmitted != null:
return locationChangeSubmitted(_that);case ProjectHistoryRequested() when historyRequested != null:
return historyRequested(_that);case ProjectHistoryNextPageRequested() when historyNextPageRequested != null:
return historyNextPageRequested(_that);case ProjectImagesAddSubmitted() when imagesAddSubmitted != null:
return imagesAddSubmitted(_that);case ProjectImageRemoveSubmitted() when imageRemoveSubmitted != null:
return imageRemoveSubmitted(_that);case ProjectRetryRequested() when retryRequested != null:
return retryRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProjectsListRequested value)  listRequested,required TResult Function( ProjectsListRefreshed value)  listRefreshed,required TResult Function( ProjectsNextPageRequested value)  nextPageRequested,required TResult Function( ProjectsFilterChanged value)  filterChanged,required TResult Function( ProjectsSearchChanged value)  searchChanged,required TResult Function( ProjectsNearbyRequested value)  nearbyRequested,required TResult Function( ProjectRegisterSubmitted value)  registerSubmitted,required TResult Function( ProjectDetailRequested value)  detailRequested,required TResult Function( ProjectDetailRefreshed value)  detailRefreshed,required TResult Function( ProjectPatchSubmitted value)  patchSubmitted,required TResult Function( ProjectStageChangeSubmitted value)  stageChangeSubmitted,required TResult Function( ProjectStatusChangeSubmitted value)  statusChangeSubmitted,required TResult Function( ProjectLocationChangeSubmitted value)  locationChangeSubmitted,required TResult Function( ProjectHistoryRequested value)  historyRequested,required TResult Function( ProjectHistoryNextPageRequested value)  historyNextPageRequested,required TResult Function( ProjectImagesAddSubmitted value)  imagesAddSubmitted,required TResult Function( ProjectImageRemoveSubmitted value)  imageRemoveSubmitted,required TResult Function( ProjectRetryRequested value)  retryRequested,}){
final _that = this;
switch (_that) {
case ProjectsListRequested():
return listRequested(_that);case ProjectsListRefreshed():
return listRefreshed(_that);case ProjectsNextPageRequested():
return nextPageRequested(_that);case ProjectsFilterChanged():
return filterChanged(_that);case ProjectsSearchChanged():
return searchChanged(_that);case ProjectsNearbyRequested():
return nearbyRequested(_that);case ProjectRegisterSubmitted():
return registerSubmitted(_that);case ProjectDetailRequested():
return detailRequested(_that);case ProjectDetailRefreshed():
return detailRefreshed(_that);case ProjectPatchSubmitted():
return patchSubmitted(_that);case ProjectStageChangeSubmitted():
return stageChangeSubmitted(_that);case ProjectStatusChangeSubmitted():
return statusChangeSubmitted(_that);case ProjectLocationChangeSubmitted():
return locationChangeSubmitted(_that);case ProjectHistoryRequested():
return historyRequested(_that);case ProjectHistoryNextPageRequested():
return historyNextPageRequested(_that);case ProjectImagesAddSubmitted():
return imagesAddSubmitted(_that);case ProjectImageRemoveSubmitted():
return imageRemoveSubmitted(_that);case ProjectRetryRequested():
return retryRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProjectsListRequested value)?  listRequested,TResult? Function( ProjectsListRefreshed value)?  listRefreshed,TResult? Function( ProjectsNextPageRequested value)?  nextPageRequested,TResult? Function( ProjectsFilterChanged value)?  filterChanged,TResult? Function( ProjectsSearchChanged value)?  searchChanged,TResult? Function( ProjectsNearbyRequested value)?  nearbyRequested,TResult? Function( ProjectRegisterSubmitted value)?  registerSubmitted,TResult? Function( ProjectDetailRequested value)?  detailRequested,TResult? Function( ProjectDetailRefreshed value)?  detailRefreshed,TResult? Function( ProjectPatchSubmitted value)?  patchSubmitted,TResult? Function( ProjectStageChangeSubmitted value)?  stageChangeSubmitted,TResult? Function( ProjectStatusChangeSubmitted value)?  statusChangeSubmitted,TResult? Function( ProjectLocationChangeSubmitted value)?  locationChangeSubmitted,TResult? Function( ProjectHistoryRequested value)?  historyRequested,TResult? Function( ProjectHistoryNextPageRequested value)?  historyNextPageRequested,TResult? Function( ProjectImagesAddSubmitted value)?  imagesAddSubmitted,TResult? Function( ProjectImageRemoveSubmitted value)?  imageRemoveSubmitted,TResult? Function( ProjectRetryRequested value)?  retryRequested,}){
final _that = this;
switch (_that) {
case ProjectsListRequested() when listRequested != null:
return listRequested(_that);case ProjectsListRefreshed() when listRefreshed != null:
return listRefreshed(_that);case ProjectsNextPageRequested() when nextPageRequested != null:
return nextPageRequested(_that);case ProjectsFilterChanged() when filterChanged != null:
return filterChanged(_that);case ProjectsSearchChanged() when searchChanged != null:
return searchChanged(_that);case ProjectsNearbyRequested() when nearbyRequested != null:
return nearbyRequested(_that);case ProjectRegisterSubmitted() when registerSubmitted != null:
return registerSubmitted(_that);case ProjectDetailRequested() when detailRequested != null:
return detailRequested(_that);case ProjectDetailRefreshed() when detailRefreshed != null:
return detailRefreshed(_that);case ProjectPatchSubmitted() when patchSubmitted != null:
return patchSubmitted(_that);case ProjectStageChangeSubmitted() when stageChangeSubmitted != null:
return stageChangeSubmitted(_that);case ProjectStatusChangeSubmitted() when statusChangeSubmitted != null:
return statusChangeSubmitted(_that);case ProjectLocationChangeSubmitted() when locationChangeSubmitted != null:
return locationChangeSubmitted(_that);case ProjectHistoryRequested() when historyRequested != null:
return historyRequested(_that);case ProjectHistoryNextPageRequested() when historyNextPageRequested != null:
return historyNextPageRequested(_that);case ProjectImagesAddSubmitted() when imagesAddSubmitted != null:
return imagesAddSubmitted(_that);case ProjectImageRemoveSubmitted() when imageRemoveSubmitted != null:
return imageRemoveSubmitted(_that);case ProjectRetryRequested() when retryRequested != null:
return retryRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  listRequested,TResult Function()?  listRefreshed,TResult Function()?  nextPageRequested,TResult Function( ProjectsFilter filter)?  filterChanged,TResult Function( String query)?  searchChanged,TResult Function( double lat,  double lng,  int radiusM)?  nearbyRequested,TResult Function( RegisterProjectRequest request)?  registerSubmitted,TResult Function( String id)?  detailRequested,TResult Function( String id)?  detailRefreshed,TResult Function( String id,  PatchProjectRequest request)?  patchSubmitted,TResult Function( String id,  ChangeStageRequest request)?  stageChangeSubmitted,TResult Function( String id,  ChangeStatusRequest request)?  statusChangeSubmitted,TResult Function( String id,  ChangeLocationRequest request)?  locationChangeSubmitted,TResult Function( String id)?  historyRequested,TResult Function( String id)?  historyNextPageRequested,TResult Function( String id,  List<ProjectFileRefDto> files)?  imagesAddSubmitted,TResult Function( String id,  String imageId)?  imageRemoveSubmitted,TResult Function()?  retryRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProjectsListRequested() when listRequested != null:
return listRequested();case ProjectsListRefreshed() when listRefreshed != null:
return listRefreshed();case ProjectsNextPageRequested() when nextPageRequested != null:
return nextPageRequested();case ProjectsFilterChanged() when filterChanged != null:
return filterChanged(_that.filter);case ProjectsSearchChanged() when searchChanged != null:
return searchChanged(_that.query);case ProjectsNearbyRequested() when nearbyRequested != null:
return nearbyRequested(_that.lat,_that.lng,_that.radiusM);case ProjectRegisterSubmitted() when registerSubmitted != null:
return registerSubmitted(_that.request);case ProjectDetailRequested() when detailRequested != null:
return detailRequested(_that.id);case ProjectDetailRefreshed() when detailRefreshed != null:
return detailRefreshed(_that.id);case ProjectPatchSubmitted() when patchSubmitted != null:
return patchSubmitted(_that.id,_that.request);case ProjectStageChangeSubmitted() when stageChangeSubmitted != null:
return stageChangeSubmitted(_that.id,_that.request);case ProjectStatusChangeSubmitted() when statusChangeSubmitted != null:
return statusChangeSubmitted(_that.id,_that.request);case ProjectLocationChangeSubmitted() when locationChangeSubmitted != null:
return locationChangeSubmitted(_that.id,_that.request);case ProjectHistoryRequested() when historyRequested != null:
return historyRequested(_that.id);case ProjectHistoryNextPageRequested() when historyNextPageRequested != null:
return historyNextPageRequested(_that.id);case ProjectImagesAddSubmitted() when imagesAddSubmitted != null:
return imagesAddSubmitted(_that.id,_that.files);case ProjectImageRemoveSubmitted() when imageRemoveSubmitted != null:
return imageRemoveSubmitted(_that.id,_that.imageId);case ProjectRetryRequested() when retryRequested != null:
return retryRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  listRequested,required TResult Function()  listRefreshed,required TResult Function()  nextPageRequested,required TResult Function( ProjectsFilter filter)  filterChanged,required TResult Function( String query)  searchChanged,required TResult Function( double lat,  double lng,  int radiusM)  nearbyRequested,required TResult Function( RegisterProjectRequest request)  registerSubmitted,required TResult Function( String id)  detailRequested,required TResult Function( String id)  detailRefreshed,required TResult Function( String id,  PatchProjectRequest request)  patchSubmitted,required TResult Function( String id,  ChangeStageRequest request)  stageChangeSubmitted,required TResult Function( String id,  ChangeStatusRequest request)  statusChangeSubmitted,required TResult Function( String id,  ChangeLocationRequest request)  locationChangeSubmitted,required TResult Function( String id)  historyRequested,required TResult Function( String id)  historyNextPageRequested,required TResult Function( String id,  List<ProjectFileRefDto> files)  imagesAddSubmitted,required TResult Function( String id,  String imageId)  imageRemoveSubmitted,required TResult Function()  retryRequested,}) {final _that = this;
switch (_that) {
case ProjectsListRequested():
return listRequested();case ProjectsListRefreshed():
return listRefreshed();case ProjectsNextPageRequested():
return nextPageRequested();case ProjectsFilterChanged():
return filterChanged(_that.filter);case ProjectsSearchChanged():
return searchChanged(_that.query);case ProjectsNearbyRequested():
return nearbyRequested(_that.lat,_that.lng,_that.radiusM);case ProjectRegisterSubmitted():
return registerSubmitted(_that.request);case ProjectDetailRequested():
return detailRequested(_that.id);case ProjectDetailRefreshed():
return detailRefreshed(_that.id);case ProjectPatchSubmitted():
return patchSubmitted(_that.id,_that.request);case ProjectStageChangeSubmitted():
return stageChangeSubmitted(_that.id,_that.request);case ProjectStatusChangeSubmitted():
return statusChangeSubmitted(_that.id,_that.request);case ProjectLocationChangeSubmitted():
return locationChangeSubmitted(_that.id,_that.request);case ProjectHistoryRequested():
return historyRequested(_that.id);case ProjectHistoryNextPageRequested():
return historyNextPageRequested(_that.id);case ProjectImagesAddSubmitted():
return imagesAddSubmitted(_that.id,_that.files);case ProjectImageRemoveSubmitted():
return imageRemoveSubmitted(_that.id,_that.imageId);case ProjectRetryRequested():
return retryRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  listRequested,TResult? Function()?  listRefreshed,TResult? Function()?  nextPageRequested,TResult? Function( ProjectsFilter filter)?  filterChanged,TResult? Function( String query)?  searchChanged,TResult? Function( double lat,  double lng,  int radiusM)?  nearbyRequested,TResult? Function( RegisterProjectRequest request)?  registerSubmitted,TResult? Function( String id)?  detailRequested,TResult? Function( String id)?  detailRefreshed,TResult? Function( String id,  PatchProjectRequest request)?  patchSubmitted,TResult? Function( String id,  ChangeStageRequest request)?  stageChangeSubmitted,TResult? Function( String id,  ChangeStatusRequest request)?  statusChangeSubmitted,TResult? Function( String id,  ChangeLocationRequest request)?  locationChangeSubmitted,TResult? Function( String id)?  historyRequested,TResult? Function( String id)?  historyNextPageRequested,TResult? Function( String id,  List<ProjectFileRefDto> files)?  imagesAddSubmitted,TResult? Function( String id,  String imageId)?  imageRemoveSubmitted,TResult? Function()?  retryRequested,}) {final _that = this;
switch (_that) {
case ProjectsListRequested() when listRequested != null:
return listRequested();case ProjectsListRefreshed() when listRefreshed != null:
return listRefreshed();case ProjectsNextPageRequested() when nextPageRequested != null:
return nextPageRequested();case ProjectsFilterChanged() when filterChanged != null:
return filterChanged(_that.filter);case ProjectsSearchChanged() when searchChanged != null:
return searchChanged(_that.query);case ProjectsNearbyRequested() when nearbyRequested != null:
return nearbyRequested(_that.lat,_that.lng,_that.radiusM);case ProjectRegisterSubmitted() when registerSubmitted != null:
return registerSubmitted(_that.request);case ProjectDetailRequested() when detailRequested != null:
return detailRequested(_that.id);case ProjectDetailRefreshed() when detailRefreshed != null:
return detailRefreshed(_that.id);case ProjectPatchSubmitted() when patchSubmitted != null:
return patchSubmitted(_that.id,_that.request);case ProjectStageChangeSubmitted() when stageChangeSubmitted != null:
return stageChangeSubmitted(_that.id,_that.request);case ProjectStatusChangeSubmitted() when statusChangeSubmitted != null:
return statusChangeSubmitted(_that.id,_that.request);case ProjectLocationChangeSubmitted() when locationChangeSubmitted != null:
return locationChangeSubmitted(_that.id,_that.request);case ProjectHistoryRequested() when historyRequested != null:
return historyRequested(_that.id);case ProjectHistoryNextPageRequested() when historyNextPageRequested != null:
return historyNextPageRequested(_that.id);case ProjectImagesAddSubmitted() when imagesAddSubmitted != null:
return imagesAddSubmitted(_that.id,_that.files);case ProjectImageRemoveSubmitted() when imageRemoveSubmitted != null:
return imageRemoveSubmitted(_that.id,_that.imageId);case ProjectRetryRequested() when retryRequested != null:
return retryRequested();case _:
  return null;

}
}

}

/// @nodoc


class ProjectsListRequested implements ProjectsEvent {
  const ProjectsListRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectsListRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectsEvent.listRequested()';
}


}




/// @nodoc


class ProjectsListRefreshed implements ProjectsEvent {
  const ProjectsListRefreshed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectsListRefreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectsEvent.listRefreshed()';
}


}




/// @nodoc


class ProjectsNextPageRequested implements ProjectsEvent {
  const ProjectsNextPageRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectsNextPageRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectsEvent.nextPageRequested()';
}


}




/// @nodoc


class ProjectsFilterChanged implements ProjectsEvent {
  const ProjectsFilterChanged(this.filter);
  

 final  ProjectsFilter filter;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectsFilterChangedCopyWith<ProjectsFilterChanged> get copyWith => _$ProjectsFilterChangedCopyWithImpl<ProjectsFilterChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectsFilterChanged&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'ProjectsEvent.filterChanged(filter: $filter)';
}


}

/// @nodoc
abstract mixin class $ProjectsFilterChangedCopyWith<$Res> implements $ProjectsEventCopyWith<$Res> {
  factory $ProjectsFilterChangedCopyWith(ProjectsFilterChanged value, $Res Function(ProjectsFilterChanged) _then) = _$ProjectsFilterChangedCopyWithImpl;
@useResult
$Res call({
 ProjectsFilter filter
});


$ProjectsFilterCopyWith<$Res> get filter;

}
/// @nodoc
class _$ProjectsFilterChangedCopyWithImpl<$Res>
    implements $ProjectsFilterChangedCopyWith<$Res> {
  _$ProjectsFilterChangedCopyWithImpl(this._self, this._then);

  final ProjectsFilterChanged _self;
  final $Res Function(ProjectsFilterChanged) _then;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(ProjectsFilterChanged(
null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as ProjectsFilter,
  ));
}

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectsFilterCopyWith<$Res> get filter {
  
  return $ProjectsFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}

/// @nodoc


class ProjectsSearchChanged implements ProjectsEvent {
  const ProjectsSearchChanged(this.query);
  

 final  String query;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectsSearchChangedCopyWith<ProjectsSearchChanged> get copyWith => _$ProjectsSearchChangedCopyWithImpl<ProjectsSearchChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectsSearchChanged&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'ProjectsEvent.searchChanged(query: $query)';
}


}

/// @nodoc
abstract mixin class $ProjectsSearchChangedCopyWith<$Res> implements $ProjectsEventCopyWith<$Res> {
  factory $ProjectsSearchChangedCopyWith(ProjectsSearchChanged value, $Res Function(ProjectsSearchChanged) _then) = _$ProjectsSearchChangedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$ProjectsSearchChangedCopyWithImpl<$Res>
    implements $ProjectsSearchChangedCopyWith<$Res> {
  _$ProjectsSearchChangedCopyWithImpl(this._self, this._then);

  final ProjectsSearchChanged _self;
  final $Res Function(ProjectsSearchChanged) _then;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(ProjectsSearchChanged(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProjectsNearbyRequested implements ProjectsEvent {
  const ProjectsNearbyRequested({required this.lat, required this.lng, required this.radiusM});
  

 final  double lat;
 final  double lng;
 final  int radiusM;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectsNearbyRequestedCopyWith<ProjectsNearbyRequested> get copyWith => _$ProjectsNearbyRequestedCopyWithImpl<ProjectsNearbyRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectsNearbyRequested&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.radiusM, radiusM) || other.radiusM == radiusM));
}


@override
int get hashCode => Object.hash(runtimeType,lat,lng,radiusM);

@override
String toString() {
  return 'ProjectsEvent.nearbyRequested(lat: $lat, lng: $lng, radiusM: $radiusM)';
}


}

/// @nodoc
abstract mixin class $ProjectsNearbyRequestedCopyWith<$Res> implements $ProjectsEventCopyWith<$Res> {
  factory $ProjectsNearbyRequestedCopyWith(ProjectsNearbyRequested value, $Res Function(ProjectsNearbyRequested) _then) = _$ProjectsNearbyRequestedCopyWithImpl;
@useResult
$Res call({
 double lat, double lng, int radiusM
});




}
/// @nodoc
class _$ProjectsNearbyRequestedCopyWithImpl<$Res>
    implements $ProjectsNearbyRequestedCopyWith<$Res> {
  _$ProjectsNearbyRequestedCopyWithImpl(this._self, this._then);

  final ProjectsNearbyRequested _self;
  final $Res Function(ProjectsNearbyRequested) _then;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lat = null,Object? lng = null,Object? radiusM = null,}) {
  return _then(ProjectsNearbyRequested(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,radiusM: null == radiusM ? _self.radiusM : radiusM // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ProjectRegisterSubmitted implements ProjectsEvent {
  const ProjectRegisterSubmitted(this.request);
  

 final  RegisterProjectRequest request;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectRegisterSubmittedCopyWith<ProjectRegisterSubmitted> get copyWith => _$ProjectRegisterSubmittedCopyWithImpl<ProjectRegisterSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectRegisterSubmitted&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,request);

@override
String toString() {
  return 'ProjectsEvent.registerSubmitted(request: $request)';
}


}

/// @nodoc
abstract mixin class $ProjectRegisterSubmittedCopyWith<$Res> implements $ProjectsEventCopyWith<$Res> {
  factory $ProjectRegisterSubmittedCopyWith(ProjectRegisterSubmitted value, $Res Function(ProjectRegisterSubmitted) _then) = _$ProjectRegisterSubmittedCopyWithImpl;
@useResult
$Res call({
 RegisterProjectRequest request
});


$RegisterProjectRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$ProjectRegisterSubmittedCopyWithImpl<$Res>
    implements $ProjectRegisterSubmittedCopyWith<$Res> {
  _$ProjectRegisterSubmittedCopyWithImpl(this._self, this._then);

  final ProjectRegisterSubmitted _self;
  final $Res Function(ProjectRegisterSubmitted) _then;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,}) {
  return _then(ProjectRegisterSubmitted(
null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as RegisterProjectRequest,
  ));
}

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterProjectRequestCopyWith<$Res> get request {
  
  return $RegisterProjectRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

/// @nodoc


class ProjectDetailRequested implements ProjectsEvent {
  const ProjectDetailRequested(this.id);
  

 final  String id;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectDetailRequestedCopyWith<ProjectDetailRequested> get copyWith => _$ProjectDetailRequestedCopyWithImpl<ProjectDetailRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectDetailRequested&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'ProjectsEvent.detailRequested(id: $id)';
}


}

/// @nodoc
abstract mixin class $ProjectDetailRequestedCopyWith<$Res> implements $ProjectsEventCopyWith<$Res> {
  factory $ProjectDetailRequestedCopyWith(ProjectDetailRequested value, $Res Function(ProjectDetailRequested) _then) = _$ProjectDetailRequestedCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$ProjectDetailRequestedCopyWithImpl<$Res>
    implements $ProjectDetailRequestedCopyWith<$Res> {
  _$ProjectDetailRequestedCopyWithImpl(this._self, this._then);

  final ProjectDetailRequested _self;
  final $Res Function(ProjectDetailRequested) _then;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(ProjectDetailRequested(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProjectDetailRefreshed implements ProjectsEvent {
  const ProjectDetailRefreshed(this.id);
  

 final  String id;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectDetailRefreshedCopyWith<ProjectDetailRefreshed> get copyWith => _$ProjectDetailRefreshedCopyWithImpl<ProjectDetailRefreshed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectDetailRefreshed&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'ProjectsEvent.detailRefreshed(id: $id)';
}


}

/// @nodoc
abstract mixin class $ProjectDetailRefreshedCopyWith<$Res> implements $ProjectsEventCopyWith<$Res> {
  factory $ProjectDetailRefreshedCopyWith(ProjectDetailRefreshed value, $Res Function(ProjectDetailRefreshed) _then) = _$ProjectDetailRefreshedCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$ProjectDetailRefreshedCopyWithImpl<$Res>
    implements $ProjectDetailRefreshedCopyWith<$Res> {
  _$ProjectDetailRefreshedCopyWithImpl(this._self, this._then);

  final ProjectDetailRefreshed _self;
  final $Res Function(ProjectDetailRefreshed) _then;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(ProjectDetailRefreshed(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProjectPatchSubmitted implements ProjectsEvent {
  const ProjectPatchSubmitted({required this.id, required this.request});
  

 final  String id;
 final  PatchProjectRequest request;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectPatchSubmittedCopyWith<ProjectPatchSubmitted> get copyWith => _$ProjectPatchSubmittedCopyWithImpl<ProjectPatchSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectPatchSubmitted&&(identical(other.id, id) || other.id == id)&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,id,request);

@override
String toString() {
  return 'ProjectsEvent.patchSubmitted(id: $id, request: $request)';
}


}

/// @nodoc
abstract mixin class $ProjectPatchSubmittedCopyWith<$Res> implements $ProjectsEventCopyWith<$Res> {
  factory $ProjectPatchSubmittedCopyWith(ProjectPatchSubmitted value, $Res Function(ProjectPatchSubmitted) _then) = _$ProjectPatchSubmittedCopyWithImpl;
@useResult
$Res call({
 String id, PatchProjectRequest request
});




}
/// @nodoc
class _$ProjectPatchSubmittedCopyWithImpl<$Res>
    implements $ProjectPatchSubmittedCopyWith<$Res> {
  _$ProjectPatchSubmittedCopyWithImpl(this._self, this._then);

  final ProjectPatchSubmitted _self;
  final $Res Function(ProjectPatchSubmitted) _then;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? request = null,}) {
  return _then(ProjectPatchSubmitted(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as PatchProjectRequest,
  ));
}


}

/// @nodoc


class ProjectStageChangeSubmitted implements ProjectsEvent {
  const ProjectStageChangeSubmitted({required this.id, required this.request});
  

 final  String id;
 final  ChangeStageRequest request;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectStageChangeSubmittedCopyWith<ProjectStageChangeSubmitted> get copyWith => _$ProjectStageChangeSubmittedCopyWithImpl<ProjectStageChangeSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectStageChangeSubmitted&&(identical(other.id, id) || other.id == id)&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,id,request);

@override
String toString() {
  return 'ProjectsEvent.stageChangeSubmitted(id: $id, request: $request)';
}


}

/// @nodoc
abstract mixin class $ProjectStageChangeSubmittedCopyWith<$Res> implements $ProjectsEventCopyWith<$Res> {
  factory $ProjectStageChangeSubmittedCopyWith(ProjectStageChangeSubmitted value, $Res Function(ProjectStageChangeSubmitted) _then) = _$ProjectStageChangeSubmittedCopyWithImpl;
@useResult
$Res call({
 String id, ChangeStageRequest request
});


$ChangeStageRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$ProjectStageChangeSubmittedCopyWithImpl<$Res>
    implements $ProjectStageChangeSubmittedCopyWith<$Res> {
  _$ProjectStageChangeSubmittedCopyWithImpl(this._self, this._then);

  final ProjectStageChangeSubmitted _self;
  final $Res Function(ProjectStageChangeSubmitted) _then;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? request = null,}) {
  return _then(ProjectStageChangeSubmitted(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as ChangeStageRequest,
  ));
}

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChangeStageRequestCopyWith<$Res> get request {
  
  return $ChangeStageRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

/// @nodoc


class ProjectStatusChangeSubmitted implements ProjectsEvent {
  const ProjectStatusChangeSubmitted({required this.id, required this.request});
  

 final  String id;
 final  ChangeStatusRequest request;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectStatusChangeSubmittedCopyWith<ProjectStatusChangeSubmitted> get copyWith => _$ProjectStatusChangeSubmittedCopyWithImpl<ProjectStatusChangeSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectStatusChangeSubmitted&&(identical(other.id, id) || other.id == id)&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,id,request);

@override
String toString() {
  return 'ProjectsEvent.statusChangeSubmitted(id: $id, request: $request)';
}


}

/// @nodoc
abstract mixin class $ProjectStatusChangeSubmittedCopyWith<$Res> implements $ProjectsEventCopyWith<$Res> {
  factory $ProjectStatusChangeSubmittedCopyWith(ProjectStatusChangeSubmitted value, $Res Function(ProjectStatusChangeSubmitted) _then) = _$ProjectStatusChangeSubmittedCopyWithImpl;
@useResult
$Res call({
 String id, ChangeStatusRequest request
});


$ChangeStatusRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$ProjectStatusChangeSubmittedCopyWithImpl<$Res>
    implements $ProjectStatusChangeSubmittedCopyWith<$Res> {
  _$ProjectStatusChangeSubmittedCopyWithImpl(this._self, this._then);

  final ProjectStatusChangeSubmitted _self;
  final $Res Function(ProjectStatusChangeSubmitted) _then;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? request = null,}) {
  return _then(ProjectStatusChangeSubmitted(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as ChangeStatusRequest,
  ));
}

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChangeStatusRequestCopyWith<$Res> get request {
  
  return $ChangeStatusRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

/// @nodoc


class ProjectLocationChangeSubmitted implements ProjectsEvent {
  const ProjectLocationChangeSubmitted({required this.id, required this.request});
  

 final  String id;
 final  ChangeLocationRequest request;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectLocationChangeSubmittedCopyWith<ProjectLocationChangeSubmitted> get copyWith => _$ProjectLocationChangeSubmittedCopyWithImpl<ProjectLocationChangeSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectLocationChangeSubmitted&&(identical(other.id, id) || other.id == id)&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,id,request);

@override
String toString() {
  return 'ProjectsEvent.locationChangeSubmitted(id: $id, request: $request)';
}


}

/// @nodoc
abstract mixin class $ProjectLocationChangeSubmittedCopyWith<$Res> implements $ProjectsEventCopyWith<$Res> {
  factory $ProjectLocationChangeSubmittedCopyWith(ProjectLocationChangeSubmitted value, $Res Function(ProjectLocationChangeSubmitted) _then) = _$ProjectLocationChangeSubmittedCopyWithImpl;
@useResult
$Res call({
 String id, ChangeLocationRequest request
});




}
/// @nodoc
class _$ProjectLocationChangeSubmittedCopyWithImpl<$Res>
    implements $ProjectLocationChangeSubmittedCopyWith<$Res> {
  _$ProjectLocationChangeSubmittedCopyWithImpl(this._self, this._then);

  final ProjectLocationChangeSubmitted _self;
  final $Res Function(ProjectLocationChangeSubmitted) _then;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? request = null,}) {
  return _then(ProjectLocationChangeSubmitted(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as ChangeLocationRequest,
  ));
}


}

/// @nodoc


class ProjectHistoryRequested implements ProjectsEvent {
  const ProjectHistoryRequested(this.id);
  

 final  String id;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectHistoryRequestedCopyWith<ProjectHistoryRequested> get copyWith => _$ProjectHistoryRequestedCopyWithImpl<ProjectHistoryRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectHistoryRequested&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'ProjectsEvent.historyRequested(id: $id)';
}


}

/// @nodoc
abstract mixin class $ProjectHistoryRequestedCopyWith<$Res> implements $ProjectsEventCopyWith<$Res> {
  factory $ProjectHistoryRequestedCopyWith(ProjectHistoryRequested value, $Res Function(ProjectHistoryRequested) _then) = _$ProjectHistoryRequestedCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$ProjectHistoryRequestedCopyWithImpl<$Res>
    implements $ProjectHistoryRequestedCopyWith<$Res> {
  _$ProjectHistoryRequestedCopyWithImpl(this._self, this._then);

  final ProjectHistoryRequested _self;
  final $Res Function(ProjectHistoryRequested) _then;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(ProjectHistoryRequested(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProjectHistoryNextPageRequested implements ProjectsEvent {
  const ProjectHistoryNextPageRequested(this.id);
  

 final  String id;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectHistoryNextPageRequestedCopyWith<ProjectHistoryNextPageRequested> get copyWith => _$ProjectHistoryNextPageRequestedCopyWithImpl<ProjectHistoryNextPageRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectHistoryNextPageRequested&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'ProjectsEvent.historyNextPageRequested(id: $id)';
}


}

/// @nodoc
abstract mixin class $ProjectHistoryNextPageRequestedCopyWith<$Res> implements $ProjectsEventCopyWith<$Res> {
  factory $ProjectHistoryNextPageRequestedCopyWith(ProjectHistoryNextPageRequested value, $Res Function(ProjectHistoryNextPageRequested) _then) = _$ProjectHistoryNextPageRequestedCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$ProjectHistoryNextPageRequestedCopyWithImpl<$Res>
    implements $ProjectHistoryNextPageRequestedCopyWith<$Res> {
  _$ProjectHistoryNextPageRequestedCopyWithImpl(this._self, this._then);

  final ProjectHistoryNextPageRequested _self;
  final $Res Function(ProjectHistoryNextPageRequested) _then;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(ProjectHistoryNextPageRequested(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProjectImagesAddSubmitted implements ProjectsEvent {
  const ProjectImagesAddSubmitted({required this.id, required final  List<ProjectFileRefDto> files}): _files = files;
  

 final  String id;
 final  List<ProjectFileRefDto> _files;
 List<ProjectFileRefDto> get files {
  if (_files is EqualUnmodifiableListView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_files);
}


/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectImagesAddSubmittedCopyWith<ProjectImagesAddSubmitted> get copyWith => _$ProjectImagesAddSubmittedCopyWithImpl<ProjectImagesAddSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectImagesAddSubmitted&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._files, _files));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_files));

@override
String toString() {
  return 'ProjectsEvent.imagesAddSubmitted(id: $id, files: $files)';
}


}

/// @nodoc
abstract mixin class $ProjectImagesAddSubmittedCopyWith<$Res> implements $ProjectsEventCopyWith<$Res> {
  factory $ProjectImagesAddSubmittedCopyWith(ProjectImagesAddSubmitted value, $Res Function(ProjectImagesAddSubmitted) _then) = _$ProjectImagesAddSubmittedCopyWithImpl;
@useResult
$Res call({
 String id, List<ProjectFileRefDto> files
});




}
/// @nodoc
class _$ProjectImagesAddSubmittedCopyWithImpl<$Res>
    implements $ProjectImagesAddSubmittedCopyWith<$Res> {
  _$ProjectImagesAddSubmittedCopyWithImpl(this._self, this._then);

  final ProjectImagesAddSubmitted _self;
  final $Res Function(ProjectImagesAddSubmitted) _then;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? files = null,}) {
  return _then(ProjectImagesAddSubmitted(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,files: null == files ? _self._files : files // ignore: cast_nullable_to_non_nullable
as List<ProjectFileRefDto>,
  ));
}


}

/// @nodoc


class ProjectImageRemoveSubmitted implements ProjectsEvent {
  const ProjectImageRemoveSubmitted({required this.id, required this.imageId});
  

 final  String id;
 final  String imageId;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectImageRemoveSubmittedCopyWith<ProjectImageRemoveSubmitted> get copyWith => _$ProjectImageRemoveSubmittedCopyWithImpl<ProjectImageRemoveSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectImageRemoveSubmitted&&(identical(other.id, id) || other.id == id)&&(identical(other.imageId, imageId) || other.imageId == imageId));
}


@override
int get hashCode => Object.hash(runtimeType,id,imageId);

@override
String toString() {
  return 'ProjectsEvent.imageRemoveSubmitted(id: $id, imageId: $imageId)';
}


}

/// @nodoc
abstract mixin class $ProjectImageRemoveSubmittedCopyWith<$Res> implements $ProjectsEventCopyWith<$Res> {
  factory $ProjectImageRemoveSubmittedCopyWith(ProjectImageRemoveSubmitted value, $Res Function(ProjectImageRemoveSubmitted) _then) = _$ProjectImageRemoveSubmittedCopyWithImpl;
@useResult
$Res call({
 String id, String imageId
});




}
/// @nodoc
class _$ProjectImageRemoveSubmittedCopyWithImpl<$Res>
    implements $ProjectImageRemoveSubmittedCopyWith<$Res> {
  _$ProjectImageRemoveSubmittedCopyWithImpl(this._self, this._then);

  final ProjectImageRemoveSubmitted _self;
  final $Res Function(ProjectImageRemoveSubmitted) _then;

/// Create a copy of ProjectsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? imageId = null,}) {
  return _then(ProjectImageRemoveSubmitted(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,imageId: null == imageId ? _self.imageId : imageId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProjectRetryRequested implements ProjectsEvent {
  const ProjectRetryRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectRetryRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectsEvent.retryRequested()';
}


}




// dart format on
