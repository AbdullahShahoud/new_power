// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'projects_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectsState {

// ── list ──────────────────────────────────────────────────────────
 PagedFeedStatus get listStatus; List<ProjectSummaryView> get projects; PaginationMeta? get pagination; ProjectsFilter get filter; String? get listErrorMessage;// ── nearby (free-standing "what's around me" scouting view) ────────
 PagedFeedStatus get nearbyStatus; List<NearbyProjectCardView> get nearby; String? get nearbyErrorMessage;// ── detail ───────────────────────────────────────────────────────
 ProjectDetailStatus get detailStatus; ProjectDetailView? get selectedProject; String? get detailErrorMessage;// ── history (rendered inside the detail screen) ─────────────────────
 PagedFeedStatus get historyStatus; List<ProjectHistoryEntryView> get history; PaginationMeta? get historyPagination; String? get historyErrorMessage;// ── mutation (register / patch / stage / status / location / images) ─
 ProjectMutationStatus get mutationStatus; ProjectView? get lastMutatedProject; RegisterProjectResult? get lastRegistrationResult; String? get mutationErrorMessage; List<String> get imagesNotUploadedKeys;
/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectsStateCopyWith<ProjectsState> get copyWith => _$ProjectsStateCopyWithImpl<ProjectsState>(this as ProjectsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectsState&&(identical(other.listStatus, listStatus) || other.listStatus == listStatus)&&const DeepCollectionEquality().equals(other.projects, projects)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.listErrorMessage, listErrorMessage) || other.listErrorMessage == listErrorMessage)&&(identical(other.nearbyStatus, nearbyStatus) || other.nearbyStatus == nearbyStatus)&&const DeepCollectionEquality().equals(other.nearby, nearby)&&(identical(other.nearbyErrorMessage, nearbyErrorMessage) || other.nearbyErrorMessage == nearbyErrorMessage)&&(identical(other.detailStatus, detailStatus) || other.detailStatus == detailStatus)&&(identical(other.selectedProject, selectedProject) || other.selectedProject == selectedProject)&&(identical(other.detailErrorMessage, detailErrorMessage) || other.detailErrorMessage == detailErrorMessage)&&(identical(other.historyStatus, historyStatus) || other.historyStatus == historyStatus)&&const DeepCollectionEquality().equals(other.history, history)&&(identical(other.historyPagination, historyPagination) || other.historyPagination == historyPagination)&&(identical(other.historyErrorMessage, historyErrorMessage) || other.historyErrorMessage == historyErrorMessage)&&(identical(other.mutationStatus, mutationStatus) || other.mutationStatus == mutationStatus)&&(identical(other.lastMutatedProject, lastMutatedProject) || other.lastMutatedProject == lastMutatedProject)&&(identical(other.lastRegistrationResult, lastRegistrationResult) || other.lastRegistrationResult == lastRegistrationResult)&&(identical(other.mutationErrorMessage, mutationErrorMessage) || other.mutationErrorMessage == mutationErrorMessage)&&const DeepCollectionEquality().equals(other.imagesNotUploadedKeys, imagesNotUploadedKeys));
}


@override
int get hashCode => Object.hashAll([runtimeType,listStatus,const DeepCollectionEquality().hash(projects),pagination,filter,listErrorMessage,nearbyStatus,const DeepCollectionEquality().hash(nearby),nearbyErrorMessage,detailStatus,selectedProject,detailErrorMessage,historyStatus,const DeepCollectionEquality().hash(history),historyPagination,historyErrorMessage,mutationStatus,lastMutatedProject,lastRegistrationResult,mutationErrorMessage,const DeepCollectionEquality().hash(imagesNotUploadedKeys)]);

@override
String toString() {
  return 'ProjectsState(listStatus: $listStatus, projects: $projects, pagination: $pagination, filter: $filter, listErrorMessage: $listErrorMessage, nearbyStatus: $nearbyStatus, nearby: $nearby, nearbyErrorMessage: $nearbyErrorMessage, detailStatus: $detailStatus, selectedProject: $selectedProject, detailErrorMessage: $detailErrorMessage, historyStatus: $historyStatus, history: $history, historyPagination: $historyPagination, historyErrorMessage: $historyErrorMessage, mutationStatus: $mutationStatus, lastMutatedProject: $lastMutatedProject, lastRegistrationResult: $lastRegistrationResult, mutationErrorMessage: $mutationErrorMessage, imagesNotUploadedKeys: $imagesNotUploadedKeys)';
}


}

/// @nodoc
abstract mixin class $ProjectsStateCopyWith<$Res>  {
  factory $ProjectsStateCopyWith(ProjectsState value, $Res Function(ProjectsState) _then) = _$ProjectsStateCopyWithImpl;
@useResult
$Res call({
 PagedFeedStatus listStatus, List<ProjectSummaryView> projects, PaginationMeta? pagination, ProjectsFilter filter, String? listErrorMessage, PagedFeedStatus nearbyStatus, List<NearbyProjectCardView> nearby, String? nearbyErrorMessage, ProjectDetailStatus detailStatus, ProjectDetailView? selectedProject, String? detailErrorMessage, PagedFeedStatus historyStatus, List<ProjectHistoryEntryView> history, PaginationMeta? historyPagination, String? historyErrorMessage, ProjectMutationStatus mutationStatus, ProjectView? lastMutatedProject, RegisterProjectResult? lastRegistrationResult, String? mutationErrorMessage, List<String> imagesNotUploadedKeys
});


$PaginationMetaCopyWith<$Res>? get pagination;$ProjectsFilterCopyWith<$Res> get filter;$ProjectDetailViewCopyWith<$Res>? get selectedProject;$PaginationMetaCopyWith<$Res>? get historyPagination;$ProjectViewCopyWith<$Res>? get lastMutatedProject;$RegisterProjectResultCopyWith<$Res>? get lastRegistrationResult;

}
/// @nodoc
class _$ProjectsStateCopyWithImpl<$Res>
    implements $ProjectsStateCopyWith<$Res> {
  _$ProjectsStateCopyWithImpl(this._self, this._then);

  final ProjectsState _self;
  final $Res Function(ProjectsState) _then;

/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? listStatus = null,Object? projects = null,Object? pagination = freezed,Object? filter = null,Object? listErrorMessage = freezed,Object? nearbyStatus = null,Object? nearby = null,Object? nearbyErrorMessage = freezed,Object? detailStatus = null,Object? selectedProject = freezed,Object? detailErrorMessage = freezed,Object? historyStatus = null,Object? history = null,Object? historyPagination = freezed,Object? historyErrorMessage = freezed,Object? mutationStatus = null,Object? lastMutatedProject = freezed,Object? lastRegistrationResult = freezed,Object? mutationErrorMessage = freezed,Object? imagesNotUploadedKeys = null,}) {
  return _then(_self.copyWith(
listStatus: null == listStatus ? _self.listStatus : listStatus // ignore: cast_nullable_to_non_nullable
as PagedFeedStatus,projects: null == projects ? _self.projects : projects // ignore: cast_nullable_to_non_nullable
as List<ProjectSummaryView>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationMeta?,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as ProjectsFilter,listErrorMessage: freezed == listErrorMessage ? _self.listErrorMessage : listErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,nearbyStatus: null == nearbyStatus ? _self.nearbyStatus : nearbyStatus // ignore: cast_nullable_to_non_nullable
as PagedFeedStatus,nearby: null == nearby ? _self.nearby : nearby // ignore: cast_nullable_to_non_nullable
as List<NearbyProjectCardView>,nearbyErrorMessage: freezed == nearbyErrorMessage ? _self.nearbyErrorMessage : nearbyErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,detailStatus: null == detailStatus ? _self.detailStatus : detailStatus // ignore: cast_nullable_to_non_nullable
as ProjectDetailStatus,selectedProject: freezed == selectedProject ? _self.selectedProject : selectedProject // ignore: cast_nullable_to_non_nullable
as ProjectDetailView?,detailErrorMessage: freezed == detailErrorMessage ? _self.detailErrorMessage : detailErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,historyStatus: null == historyStatus ? _self.historyStatus : historyStatus // ignore: cast_nullable_to_non_nullable
as PagedFeedStatus,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<ProjectHistoryEntryView>,historyPagination: freezed == historyPagination ? _self.historyPagination : historyPagination // ignore: cast_nullable_to_non_nullable
as PaginationMeta?,historyErrorMessage: freezed == historyErrorMessage ? _self.historyErrorMessage : historyErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,mutationStatus: null == mutationStatus ? _self.mutationStatus : mutationStatus // ignore: cast_nullable_to_non_nullable
as ProjectMutationStatus,lastMutatedProject: freezed == lastMutatedProject ? _self.lastMutatedProject : lastMutatedProject // ignore: cast_nullable_to_non_nullable
as ProjectView?,lastRegistrationResult: freezed == lastRegistrationResult ? _self.lastRegistrationResult : lastRegistrationResult // ignore: cast_nullable_to_non_nullable
as RegisterProjectResult?,mutationErrorMessage: freezed == mutationErrorMessage ? _self.mutationErrorMessage : mutationErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,imagesNotUploadedKeys: null == imagesNotUploadedKeys ? _self.imagesNotUploadedKeys : imagesNotUploadedKeys // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res>? get pagination {
    if (_self.pagination == null) {
    return null;
  }

  return $PaginationMetaCopyWith<$Res>(_self.pagination!, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectsFilterCopyWith<$Res> get filter {
  
  return $ProjectsFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectDetailViewCopyWith<$Res>? get selectedProject {
    if (_self.selectedProject == null) {
    return null;
  }

  return $ProjectDetailViewCopyWith<$Res>(_self.selectedProject!, (value) {
    return _then(_self.copyWith(selectedProject: value));
  });
}/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res>? get historyPagination {
    if (_self.historyPagination == null) {
    return null;
  }

  return $PaginationMetaCopyWith<$Res>(_self.historyPagination!, (value) {
    return _then(_self.copyWith(historyPagination: value));
  });
}/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectViewCopyWith<$Res>? get lastMutatedProject {
    if (_self.lastMutatedProject == null) {
    return null;
  }

  return $ProjectViewCopyWith<$Res>(_self.lastMutatedProject!, (value) {
    return _then(_self.copyWith(lastMutatedProject: value));
  });
}/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterProjectResultCopyWith<$Res>? get lastRegistrationResult {
    if (_self.lastRegistrationResult == null) {
    return null;
  }

  return $RegisterProjectResultCopyWith<$Res>(_self.lastRegistrationResult!, (value) {
    return _then(_self.copyWith(lastRegistrationResult: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProjectsState].
extension ProjectsStatePatterns on ProjectsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectsState value)  $default,){
final _that = this;
switch (_that) {
case _ProjectsState():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectsState value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PagedFeedStatus listStatus,  List<ProjectSummaryView> projects,  PaginationMeta? pagination,  ProjectsFilter filter,  String? listErrorMessage,  PagedFeedStatus nearbyStatus,  List<NearbyProjectCardView> nearby,  String? nearbyErrorMessage,  ProjectDetailStatus detailStatus,  ProjectDetailView? selectedProject,  String? detailErrorMessage,  PagedFeedStatus historyStatus,  List<ProjectHistoryEntryView> history,  PaginationMeta? historyPagination,  String? historyErrorMessage,  ProjectMutationStatus mutationStatus,  ProjectView? lastMutatedProject,  RegisterProjectResult? lastRegistrationResult,  String? mutationErrorMessage,  List<String> imagesNotUploadedKeys)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectsState() when $default != null:
return $default(_that.listStatus,_that.projects,_that.pagination,_that.filter,_that.listErrorMessage,_that.nearbyStatus,_that.nearby,_that.nearbyErrorMessage,_that.detailStatus,_that.selectedProject,_that.detailErrorMessage,_that.historyStatus,_that.history,_that.historyPagination,_that.historyErrorMessage,_that.mutationStatus,_that.lastMutatedProject,_that.lastRegistrationResult,_that.mutationErrorMessage,_that.imagesNotUploadedKeys);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PagedFeedStatus listStatus,  List<ProjectSummaryView> projects,  PaginationMeta? pagination,  ProjectsFilter filter,  String? listErrorMessage,  PagedFeedStatus nearbyStatus,  List<NearbyProjectCardView> nearby,  String? nearbyErrorMessage,  ProjectDetailStatus detailStatus,  ProjectDetailView? selectedProject,  String? detailErrorMessage,  PagedFeedStatus historyStatus,  List<ProjectHistoryEntryView> history,  PaginationMeta? historyPagination,  String? historyErrorMessage,  ProjectMutationStatus mutationStatus,  ProjectView? lastMutatedProject,  RegisterProjectResult? lastRegistrationResult,  String? mutationErrorMessage,  List<String> imagesNotUploadedKeys)  $default,) {final _that = this;
switch (_that) {
case _ProjectsState():
return $default(_that.listStatus,_that.projects,_that.pagination,_that.filter,_that.listErrorMessage,_that.nearbyStatus,_that.nearby,_that.nearbyErrorMessage,_that.detailStatus,_that.selectedProject,_that.detailErrorMessage,_that.historyStatus,_that.history,_that.historyPagination,_that.historyErrorMessage,_that.mutationStatus,_that.lastMutatedProject,_that.lastRegistrationResult,_that.mutationErrorMessage,_that.imagesNotUploadedKeys);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PagedFeedStatus listStatus,  List<ProjectSummaryView> projects,  PaginationMeta? pagination,  ProjectsFilter filter,  String? listErrorMessage,  PagedFeedStatus nearbyStatus,  List<NearbyProjectCardView> nearby,  String? nearbyErrorMessage,  ProjectDetailStatus detailStatus,  ProjectDetailView? selectedProject,  String? detailErrorMessage,  PagedFeedStatus historyStatus,  List<ProjectHistoryEntryView> history,  PaginationMeta? historyPagination,  String? historyErrorMessage,  ProjectMutationStatus mutationStatus,  ProjectView? lastMutatedProject,  RegisterProjectResult? lastRegistrationResult,  String? mutationErrorMessage,  List<String> imagesNotUploadedKeys)?  $default,) {final _that = this;
switch (_that) {
case _ProjectsState() when $default != null:
return $default(_that.listStatus,_that.projects,_that.pagination,_that.filter,_that.listErrorMessage,_that.nearbyStatus,_that.nearby,_that.nearbyErrorMessage,_that.detailStatus,_that.selectedProject,_that.detailErrorMessage,_that.historyStatus,_that.history,_that.historyPagination,_that.historyErrorMessage,_that.mutationStatus,_that.lastMutatedProject,_that.lastRegistrationResult,_that.mutationErrorMessage,_that.imagesNotUploadedKeys);case _:
  return null;

}
}

}

/// @nodoc


class _ProjectsState implements ProjectsState {
  const _ProjectsState({this.listStatus = PagedFeedStatus.initial, final  List<ProjectSummaryView> projects = const <ProjectSummaryView>[], this.pagination, this.filter = const ProjectsFilter(), this.listErrorMessage, this.nearbyStatus = PagedFeedStatus.initial, final  List<NearbyProjectCardView> nearby = const <NearbyProjectCardView>[], this.nearbyErrorMessage, this.detailStatus = ProjectDetailStatus.idle, this.selectedProject, this.detailErrorMessage, this.historyStatus = PagedFeedStatus.initial, final  List<ProjectHistoryEntryView> history = const <ProjectHistoryEntryView>[], this.historyPagination, this.historyErrorMessage, this.mutationStatus = ProjectMutationStatus.idle, this.lastMutatedProject, this.lastRegistrationResult, this.mutationErrorMessage, final  List<String> imagesNotUploadedKeys = const <String>[]}): _projects = projects,_nearby = nearby,_history = history,_imagesNotUploadedKeys = imagesNotUploadedKeys;
  

// ── list ──────────────────────────────────────────────────────────
@override@JsonKey() final  PagedFeedStatus listStatus;
 final  List<ProjectSummaryView> _projects;
@override@JsonKey() List<ProjectSummaryView> get projects {
  if (_projects is EqualUnmodifiableListView) return _projects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projects);
}

@override final  PaginationMeta? pagination;
@override@JsonKey() final  ProjectsFilter filter;
@override final  String? listErrorMessage;
// ── nearby (free-standing "what's around me" scouting view) ────────
@override@JsonKey() final  PagedFeedStatus nearbyStatus;
 final  List<NearbyProjectCardView> _nearby;
@override@JsonKey() List<NearbyProjectCardView> get nearby {
  if (_nearby is EqualUnmodifiableListView) return _nearby;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nearby);
}

@override final  String? nearbyErrorMessage;
// ── detail ───────────────────────────────────────────────────────
@override@JsonKey() final  ProjectDetailStatus detailStatus;
@override final  ProjectDetailView? selectedProject;
@override final  String? detailErrorMessage;
// ── history (rendered inside the detail screen) ─────────────────────
@override@JsonKey() final  PagedFeedStatus historyStatus;
 final  List<ProjectHistoryEntryView> _history;
@override@JsonKey() List<ProjectHistoryEntryView> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}

@override final  PaginationMeta? historyPagination;
@override final  String? historyErrorMessage;
// ── mutation (register / patch / stage / status / location / images) ─
@override@JsonKey() final  ProjectMutationStatus mutationStatus;
@override final  ProjectView? lastMutatedProject;
@override final  RegisterProjectResult? lastRegistrationResult;
@override final  String? mutationErrorMessage;
 final  List<String> _imagesNotUploadedKeys;
@override@JsonKey() List<String> get imagesNotUploadedKeys {
  if (_imagesNotUploadedKeys is EqualUnmodifiableListView) return _imagesNotUploadedKeys;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imagesNotUploadedKeys);
}


/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectsStateCopyWith<_ProjectsState> get copyWith => __$ProjectsStateCopyWithImpl<_ProjectsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectsState&&(identical(other.listStatus, listStatus) || other.listStatus == listStatus)&&const DeepCollectionEquality().equals(other._projects, _projects)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.listErrorMessage, listErrorMessage) || other.listErrorMessage == listErrorMessage)&&(identical(other.nearbyStatus, nearbyStatus) || other.nearbyStatus == nearbyStatus)&&const DeepCollectionEquality().equals(other._nearby, _nearby)&&(identical(other.nearbyErrorMessage, nearbyErrorMessage) || other.nearbyErrorMessage == nearbyErrorMessage)&&(identical(other.detailStatus, detailStatus) || other.detailStatus == detailStatus)&&(identical(other.selectedProject, selectedProject) || other.selectedProject == selectedProject)&&(identical(other.detailErrorMessage, detailErrorMessage) || other.detailErrorMessage == detailErrorMessage)&&(identical(other.historyStatus, historyStatus) || other.historyStatus == historyStatus)&&const DeepCollectionEquality().equals(other._history, _history)&&(identical(other.historyPagination, historyPagination) || other.historyPagination == historyPagination)&&(identical(other.historyErrorMessage, historyErrorMessage) || other.historyErrorMessage == historyErrorMessage)&&(identical(other.mutationStatus, mutationStatus) || other.mutationStatus == mutationStatus)&&(identical(other.lastMutatedProject, lastMutatedProject) || other.lastMutatedProject == lastMutatedProject)&&(identical(other.lastRegistrationResult, lastRegistrationResult) || other.lastRegistrationResult == lastRegistrationResult)&&(identical(other.mutationErrorMessage, mutationErrorMessage) || other.mutationErrorMessage == mutationErrorMessage)&&const DeepCollectionEquality().equals(other._imagesNotUploadedKeys, _imagesNotUploadedKeys));
}


@override
int get hashCode => Object.hashAll([runtimeType,listStatus,const DeepCollectionEquality().hash(_projects),pagination,filter,listErrorMessage,nearbyStatus,const DeepCollectionEquality().hash(_nearby),nearbyErrorMessage,detailStatus,selectedProject,detailErrorMessage,historyStatus,const DeepCollectionEquality().hash(_history),historyPagination,historyErrorMessage,mutationStatus,lastMutatedProject,lastRegistrationResult,mutationErrorMessage,const DeepCollectionEquality().hash(_imagesNotUploadedKeys)]);

@override
String toString() {
  return 'ProjectsState(listStatus: $listStatus, projects: $projects, pagination: $pagination, filter: $filter, listErrorMessage: $listErrorMessage, nearbyStatus: $nearbyStatus, nearby: $nearby, nearbyErrorMessage: $nearbyErrorMessage, detailStatus: $detailStatus, selectedProject: $selectedProject, detailErrorMessage: $detailErrorMessage, historyStatus: $historyStatus, history: $history, historyPagination: $historyPagination, historyErrorMessage: $historyErrorMessage, mutationStatus: $mutationStatus, lastMutatedProject: $lastMutatedProject, lastRegistrationResult: $lastRegistrationResult, mutationErrorMessage: $mutationErrorMessage, imagesNotUploadedKeys: $imagesNotUploadedKeys)';
}


}

/// @nodoc
abstract mixin class _$ProjectsStateCopyWith<$Res> implements $ProjectsStateCopyWith<$Res> {
  factory _$ProjectsStateCopyWith(_ProjectsState value, $Res Function(_ProjectsState) _then) = __$ProjectsStateCopyWithImpl;
@override @useResult
$Res call({
 PagedFeedStatus listStatus, List<ProjectSummaryView> projects, PaginationMeta? pagination, ProjectsFilter filter, String? listErrorMessage, PagedFeedStatus nearbyStatus, List<NearbyProjectCardView> nearby, String? nearbyErrorMessage, ProjectDetailStatus detailStatus, ProjectDetailView? selectedProject, String? detailErrorMessage, PagedFeedStatus historyStatus, List<ProjectHistoryEntryView> history, PaginationMeta? historyPagination, String? historyErrorMessage, ProjectMutationStatus mutationStatus, ProjectView? lastMutatedProject, RegisterProjectResult? lastRegistrationResult, String? mutationErrorMessage, List<String> imagesNotUploadedKeys
});


@override $PaginationMetaCopyWith<$Res>? get pagination;@override $ProjectsFilterCopyWith<$Res> get filter;@override $ProjectDetailViewCopyWith<$Res>? get selectedProject;@override $PaginationMetaCopyWith<$Res>? get historyPagination;@override $ProjectViewCopyWith<$Res>? get lastMutatedProject;@override $RegisterProjectResultCopyWith<$Res>? get lastRegistrationResult;

}
/// @nodoc
class __$ProjectsStateCopyWithImpl<$Res>
    implements _$ProjectsStateCopyWith<$Res> {
  __$ProjectsStateCopyWithImpl(this._self, this._then);

  final _ProjectsState _self;
  final $Res Function(_ProjectsState) _then;

/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? listStatus = null,Object? projects = null,Object? pagination = freezed,Object? filter = null,Object? listErrorMessage = freezed,Object? nearbyStatus = null,Object? nearby = null,Object? nearbyErrorMessage = freezed,Object? detailStatus = null,Object? selectedProject = freezed,Object? detailErrorMessage = freezed,Object? historyStatus = null,Object? history = null,Object? historyPagination = freezed,Object? historyErrorMessage = freezed,Object? mutationStatus = null,Object? lastMutatedProject = freezed,Object? lastRegistrationResult = freezed,Object? mutationErrorMessage = freezed,Object? imagesNotUploadedKeys = null,}) {
  return _then(_ProjectsState(
listStatus: null == listStatus ? _self.listStatus : listStatus // ignore: cast_nullable_to_non_nullable
as PagedFeedStatus,projects: null == projects ? _self._projects : projects // ignore: cast_nullable_to_non_nullable
as List<ProjectSummaryView>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationMeta?,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as ProjectsFilter,listErrorMessage: freezed == listErrorMessage ? _self.listErrorMessage : listErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,nearbyStatus: null == nearbyStatus ? _self.nearbyStatus : nearbyStatus // ignore: cast_nullable_to_non_nullable
as PagedFeedStatus,nearby: null == nearby ? _self._nearby : nearby // ignore: cast_nullable_to_non_nullable
as List<NearbyProjectCardView>,nearbyErrorMessage: freezed == nearbyErrorMessage ? _self.nearbyErrorMessage : nearbyErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,detailStatus: null == detailStatus ? _self.detailStatus : detailStatus // ignore: cast_nullable_to_non_nullable
as ProjectDetailStatus,selectedProject: freezed == selectedProject ? _self.selectedProject : selectedProject // ignore: cast_nullable_to_non_nullable
as ProjectDetailView?,detailErrorMessage: freezed == detailErrorMessage ? _self.detailErrorMessage : detailErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,historyStatus: null == historyStatus ? _self.historyStatus : historyStatus // ignore: cast_nullable_to_non_nullable
as PagedFeedStatus,history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<ProjectHistoryEntryView>,historyPagination: freezed == historyPagination ? _self.historyPagination : historyPagination // ignore: cast_nullable_to_non_nullable
as PaginationMeta?,historyErrorMessage: freezed == historyErrorMessage ? _self.historyErrorMessage : historyErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,mutationStatus: null == mutationStatus ? _self.mutationStatus : mutationStatus // ignore: cast_nullable_to_non_nullable
as ProjectMutationStatus,lastMutatedProject: freezed == lastMutatedProject ? _self.lastMutatedProject : lastMutatedProject // ignore: cast_nullable_to_non_nullable
as ProjectView?,lastRegistrationResult: freezed == lastRegistrationResult ? _self.lastRegistrationResult : lastRegistrationResult // ignore: cast_nullable_to_non_nullable
as RegisterProjectResult?,mutationErrorMessage: freezed == mutationErrorMessage ? _self.mutationErrorMessage : mutationErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,imagesNotUploadedKeys: null == imagesNotUploadedKeys ? _self._imagesNotUploadedKeys : imagesNotUploadedKeys // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res>? get pagination {
    if (_self.pagination == null) {
    return null;
  }

  return $PaginationMetaCopyWith<$Res>(_self.pagination!, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectsFilterCopyWith<$Res> get filter {
  
  return $ProjectsFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectDetailViewCopyWith<$Res>? get selectedProject {
    if (_self.selectedProject == null) {
    return null;
  }

  return $ProjectDetailViewCopyWith<$Res>(_self.selectedProject!, (value) {
    return _then(_self.copyWith(selectedProject: value));
  });
}/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res>? get historyPagination {
    if (_self.historyPagination == null) {
    return null;
  }

  return $PaginationMetaCopyWith<$Res>(_self.historyPagination!, (value) {
    return _then(_self.copyWith(historyPagination: value));
  });
}/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectViewCopyWith<$Res>? get lastMutatedProject {
    if (_self.lastMutatedProject == null) {
    return null;
  }

  return $ProjectViewCopyWith<$Res>(_self.lastMutatedProject!, (value) {
    return _then(_self.copyWith(lastMutatedProject: value));
  });
}/// Create a copy of ProjectsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterProjectResultCopyWith<$Res>? get lastRegistrationResult {
    if (_self.lastRegistrationResult == null) {
    return null;
  }

  return $RegisterProjectResultCopyWith<$Res>(_self.lastRegistrationResult!, (value) {
    return _then(_self.copyWith(lastRegistrationResult: value));
  });
}
}

// dart format on
