// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activities_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActivitiesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivitiesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActivitiesEvent()';
}


}

/// @nodoc
class $ActivitiesEventCopyWith<$Res>  {
$ActivitiesEventCopyWith(ActivitiesEvent _, $Res Function(ActivitiesEvent) __);
}


/// Adds pattern-matching-related methods to [ActivitiesEvent].
extension ActivitiesEventPatterns on ActivitiesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AttentionListRequested value)?  attentionListRequested,TResult Function( ActivityLogSubmitted value)?  logSubmitted,TResult Function( ActivitiesListRequested value)?  listRequested,TResult Function( ActivitiesNextPageRequested value)?  nextPageRequested,TResult Function( ActivityDetailRequested value)?  detailRequested,TResult Function( ActivityEditSubmitted value)?  editSubmitted,TResult Function( ActivityRetryRequested value)?  retryRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AttentionListRequested() when attentionListRequested != null:
return attentionListRequested(_that);case ActivityLogSubmitted() when logSubmitted != null:
return logSubmitted(_that);case ActivitiesListRequested() when listRequested != null:
return listRequested(_that);case ActivitiesNextPageRequested() when nextPageRequested != null:
return nextPageRequested(_that);case ActivityDetailRequested() when detailRequested != null:
return detailRequested(_that);case ActivityEditSubmitted() when editSubmitted != null:
return editSubmitted(_that);case ActivityRetryRequested() when retryRequested != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AttentionListRequested value)  attentionListRequested,required TResult Function( ActivityLogSubmitted value)  logSubmitted,required TResult Function( ActivitiesListRequested value)  listRequested,required TResult Function( ActivitiesNextPageRequested value)  nextPageRequested,required TResult Function( ActivityDetailRequested value)  detailRequested,required TResult Function( ActivityEditSubmitted value)  editSubmitted,required TResult Function( ActivityRetryRequested value)  retryRequested,}){
final _that = this;
switch (_that) {
case AttentionListRequested():
return attentionListRequested(_that);case ActivityLogSubmitted():
return logSubmitted(_that);case ActivitiesListRequested():
return listRequested(_that);case ActivitiesNextPageRequested():
return nextPageRequested(_that);case ActivityDetailRequested():
return detailRequested(_that);case ActivityEditSubmitted():
return editSubmitted(_that);case ActivityRetryRequested():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AttentionListRequested value)?  attentionListRequested,TResult? Function( ActivityLogSubmitted value)?  logSubmitted,TResult? Function( ActivitiesListRequested value)?  listRequested,TResult? Function( ActivitiesNextPageRequested value)?  nextPageRequested,TResult? Function( ActivityDetailRequested value)?  detailRequested,TResult? Function( ActivityEditSubmitted value)?  editSubmitted,TResult? Function( ActivityRetryRequested value)?  retryRequested,}){
final _that = this;
switch (_that) {
case AttentionListRequested() when attentionListRequested != null:
return attentionListRequested(_that);case ActivityLogSubmitted() when logSubmitted != null:
return logSubmitted(_that);case ActivitiesListRequested() when listRequested != null:
return listRequested(_that);case ActivitiesNextPageRequested() when nextPageRequested != null:
return nextPageRequested(_that);case ActivityDetailRequested() when detailRequested != null:
return detailRequested(_that);case ActivityEditSubmitted() when editSubmitted != null:
return editSubmitted(_that);case ActivityRetryRequested() when retryRequested != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  attentionListRequested,TResult Function( String projectId,  LogActivityRequest request)?  logSubmitted,TResult Function( ActivitiesFilter filter)?  listRequested,TResult Function()?  nextPageRequested,TResult Function( String id)?  detailRequested,TResult Function( String id,  PatchActivityRequest request)?  editSubmitted,TResult Function()?  retryRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AttentionListRequested() when attentionListRequested != null:
return attentionListRequested();case ActivityLogSubmitted() when logSubmitted != null:
return logSubmitted(_that.projectId,_that.request);case ActivitiesListRequested() when listRequested != null:
return listRequested(_that.filter);case ActivitiesNextPageRequested() when nextPageRequested != null:
return nextPageRequested();case ActivityDetailRequested() when detailRequested != null:
return detailRequested(_that.id);case ActivityEditSubmitted() when editSubmitted != null:
return editSubmitted(_that.id,_that.request);case ActivityRetryRequested() when retryRequested != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  attentionListRequested,required TResult Function( String projectId,  LogActivityRequest request)  logSubmitted,required TResult Function( ActivitiesFilter filter)  listRequested,required TResult Function()  nextPageRequested,required TResult Function( String id)  detailRequested,required TResult Function( String id,  PatchActivityRequest request)  editSubmitted,required TResult Function()  retryRequested,}) {final _that = this;
switch (_that) {
case AttentionListRequested():
return attentionListRequested();case ActivityLogSubmitted():
return logSubmitted(_that.projectId,_that.request);case ActivitiesListRequested():
return listRequested(_that.filter);case ActivitiesNextPageRequested():
return nextPageRequested();case ActivityDetailRequested():
return detailRequested(_that.id);case ActivityEditSubmitted():
return editSubmitted(_that.id,_that.request);case ActivityRetryRequested():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  attentionListRequested,TResult? Function( String projectId,  LogActivityRequest request)?  logSubmitted,TResult? Function( ActivitiesFilter filter)?  listRequested,TResult? Function()?  nextPageRequested,TResult? Function( String id)?  detailRequested,TResult? Function( String id,  PatchActivityRequest request)?  editSubmitted,TResult? Function()?  retryRequested,}) {final _that = this;
switch (_that) {
case AttentionListRequested() when attentionListRequested != null:
return attentionListRequested();case ActivityLogSubmitted() when logSubmitted != null:
return logSubmitted(_that.projectId,_that.request);case ActivitiesListRequested() when listRequested != null:
return listRequested(_that.filter);case ActivitiesNextPageRequested() when nextPageRequested != null:
return nextPageRequested();case ActivityDetailRequested() when detailRequested != null:
return detailRequested(_that.id);case ActivityEditSubmitted() when editSubmitted != null:
return editSubmitted(_that.id,_that.request);case ActivityRetryRequested() when retryRequested != null:
return retryRequested();case _:
  return null;

}
}

}

/// @nodoc


class AttentionListRequested implements ActivitiesEvent {
  const AttentionListRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttentionListRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActivitiesEvent.attentionListRequested()';
}


}




/// @nodoc


class ActivityLogSubmitted implements ActivitiesEvent {
  const ActivityLogSubmitted({required this.projectId, required this.request});
  

 final  String projectId;
 final  LogActivityRequest request;

/// Create a copy of ActivitiesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityLogSubmittedCopyWith<ActivityLogSubmitted> get copyWith => _$ActivityLogSubmittedCopyWithImpl<ActivityLogSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityLogSubmitted&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,projectId,request);

@override
String toString() {
  return 'ActivitiesEvent.logSubmitted(projectId: $projectId, request: $request)';
}


}

/// @nodoc
abstract mixin class $ActivityLogSubmittedCopyWith<$Res> implements $ActivitiesEventCopyWith<$Res> {
  factory $ActivityLogSubmittedCopyWith(ActivityLogSubmitted value, $Res Function(ActivityLogSubmitted) _then) = _$ActivityLogSubmittedCopyWithImpl;
@useResult
$Res call({
 String projectId, LogActivityRequest request
});


$LogActivityRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$ActivityLogSubmittedCopyWithImpl<$Res>
    implements $ActivityLogSubmittedCopyWith<$Res> {
  _$ActivityLogSubmittedCopyWithImpl(this._self, this._then);

  final ActivityLogSubmitted _self;
  final $Res Function(ActivityLogSubmitted) _then;

/// Create a copy of ActivitiesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectId = null,Object? request = null,}) {
  return _then(ActivityLogSubmitted(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as LogActivityRequest,
  ));
}

/// Create a copy of ActivitiesEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LogActivityRequestCopyWith<$Res> get request {
  
  return $LogActivityRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

/// @nodoc


class ActivitiesListRequested implements ActivitiesEvent {
  const ActivitiesListRequested(this.filter);
  

 final  ActivitiesFilter filter;

/// Create a copy of ActivitiesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivitiesListRequestedCopyWith<ActivitiesListRequested> get copyWith => _$ActivitiesListRequestedCopyWithImpl<ActivitiesListRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivitiesListRequested&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'ActivitiesEvent.listRequested(filter: $filter)';
}


}

/// @nodoc
abstract mixin class $ActivitiesListRequestedCopyWith<$Res> implements $ActivitiesEventCopyWith<$Res> {
  factory $ActivitiesListRequestedCopyWith(ActivitiesListRequested value, $Res Function(ActivitiesListRequested) _then) = _$ActivitiesListRequestedCopyWithImpl;
@useResult
$Res call({
 ActivitiesFilter filter
});


$ActivitiesFilterCopyWith<$Res> get filter;

}
/// @nodoc
class _$ActivitiesListRequestedCopyWithImpl<$Res>
    implements $ActivitiesListRequestedCopyWith<$Res> {
  _$ActivitiesListRequestedCopyWithImpl(this._self, this._then);

  final ActivitiesListRequested _self;
  final $Res Function(ActivitiesListRequested) _then;

/// Create a copy of ActivitiesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(ActivitiesListRequested(
null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as ActivitiesFilter,
  ));
}

/// Create a copy of ActivitiesEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActivitiesFilterCopyWith<$Res> get filter {
  
  return $ActivitiesFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}

/// @nodoc


class ActivitiesNextPageRequested implements ActivitiesEvent {
  const ActivitiesNextPageRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivitiesNextPageRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActivitiesEvent.nextPageRequested()';
}


}




/// @nodoc


class ActivityDetailRequested implements ActivitiesEvent {
  const ActivityDetailRequested(this.id);
  

 final  String id;

/// Create a copy of ActivitiesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityDetailRequestedCopyWith<ActivityDetailRequested> get copyWith => _$ActivityDetailRequestedCopyWithImpl<ActivityDetailRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityDetailRequested&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'ActivitiesEvent.detailRequested(id: $id)';
}


}

/// @nodoc
abstract mixin class $ActivityDetailRequestedCopyWith<$Res> implements $ActivitiesEventCopyWith<$Res> {
  factory $ActivityDetailRequestedCopyWith(ActivityDetailRequested value, $Res Function(ActivityDetailRequested) _then) = _$ActivityDetailRequestedCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$ActivityDetailRequestedCopyWithImpl<$Res>
    implements $ActivityDetailRequestedCopyWith<$Res> {
  _$ActivityDetailRequestedCopyWithImpl(this._self, this._then);

  final ActivityDetailRequested _self;
  final $Res Function(ActivityDetailRequested) _then;

/// Create a copy of ActivitiesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(ActivityDetailRequested(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ActivityEditSubmitted implements ActivitiesEvent {
  const ActivityEditSubmitted({required this.id, required this.request});
  

 final  String id;
 final  PatchActivityRequest request;

/// Create a copy of ActivitiesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityEditSubmittedCopyWith<ActivityEditSubmitted> get copyWith => _$ActivityEditSubmittedCopyWithImpl<ActivityEditSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityEditSubmitted&&(identical(other.id, id) || other.id == id)&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,id,request);

@override
String toString() {
  return 'ActivitiesEvent.editSubmitted(id: $id, request: $request)';
}


}

/// @nodoc
abstract mixin class $ActivityEditSubmittedCopyWith<$Res> implements $ActivitiesEventCopyWith<$Res> {
  factory $ActivityEditSubmittedCopyWith(ActivityEditSubmitted value, $Res Function(ActivityEditSubmitted) _then) = _$ActivityEditSubmittedCopyWithImpl;
@useResult
$Res call({
 String id, PatchActivityRequest request
});




}
/// @nodoc
class _$ActivityEditSubmittedCopyWithImpl<$Res>
    implements $ActivityEditSubmittedCopyWith<$Res> {
  _$ActivityEditSubmittedCopyWithImpl(this._self, this._then);

  final ActivityEditSubmitted _self;
  final $Res Function(ActivityEditSubmitted) _then;

/// Create a copy of ActivitiesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? request = null,}) {
  return _then(ActivityEditSubmitted(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as PatchActivityRequest,
  ));
}


}

/// @nodoc


class ActivityRetryRequested implements ActivitiesEvent {
  const ActivityRetryRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityRetryRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActivitiesEvent.retryRequested()';
}


}




// dart format on
