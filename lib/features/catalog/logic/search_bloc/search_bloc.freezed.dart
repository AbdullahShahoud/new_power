// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchEvent()';
}


}

/// @nodoc
class $SearchEventCopyWith<$Res>  {
$SearchEventCopyWith(SearchEvent _, $Res Function(SearchEvent) __);
}


/// Adds pattern-matching-related methods to [SearchEvent].
extension SearchEventPatterns on SearchEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SearchTermChanged value)?  termChanged,TResult Function( SearchCleared value)?  cleared,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SearchTermChanged() when termChanged != null:
return termChanged(_that);case SearchCleared() when cleared != null:
return cleared(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SearchTermChanged value)  termChanged,required TResult Function( SearchCleared value)  cleared,}){
final _that = this;
switch (_that) {
case SearchTermChanged():
return termChanged(_that);case SearchCleared():
return cleared(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SearchTermChanged value)?  termChanged,TResult? Function( SearchCleared value)?  cleared,}){
final _that = this;
switch (_that) {
case SearchTermChanged() when termChanged != null:
return termChanged(_that);case SearchCleared() when cleared != null:
return cleared(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String term)?  termChanged,TResult Function()?  cleared,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SearchTermChanged() when termChanged != null:
return termChanged(_that.term);case SearchCleared() when cleared != null:
return cleared();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String term)  termChanged,required TResult Function()  cleared,}) {final _that = this;
switch (_that) {
case SearchTermChanged():
return termChanged(_that.term);case SearchCleared():
return cleared();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String term)?  termChanged,TResult? Function()?  cleared,}) {final _that = this;
switch (_that) {
case SearchTermChanged() when termChanged != null:
return termChanged(_that.term);case SearchCleared() when cleared != null:
return cleared();case _:
  return null;

}
}

}

/// @nodoc


class SearchTermChanged implements SearchEvent {
  const SearchTermChanged(this.term);
  

 final  String term;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchTermChangedCopyWith<SearchTermChanged> get copyWith => _$SearchTermChangedCopyWithImpl<SearchTermChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchTermChanged&&(identical(other.term, term) || other.term == term));
}


@override
int get hashCode => Object.hash(runtimeType,term);

@override
String toString() {
  return 'SearchEvent.termChanged(term: $term)';
}


}

/// @nodoc
abstract mixin class $SearchTermChangedCopyWith<$Res> implements $SearchEventCopyWith<$Res> {
  factory $SearchTermChangedCopyWith(SearchTermChanged value, $Res Function(SearchTermChanged) _then) = _$SearchTermChangedCopyWithImpl;
@useResult
$Res call({
 String term
});




}
/// @nodoc
class _$SearchTermChangedCopyWithImpl<$Res>
    implements $SearchTermChangedCopyWith<$Res> {
  _$SearchTermChangedCopyWithImpl(this._self, this._then);

  final SearchTermChanged _self;
  final $Res Function(SearchTermChanged) _then;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? term = null,}) {
  return _then(SearchTermChanged(
null == term ? _self.term : term // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SearchCleared implements SearchEvent {
  const SearchCleared();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchCleared);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchEvent.cleared()';
}


}




/// @nodoc
mixin _$SearchState {

 String get term; SuggestStatus get status; List<SuggestionView> get suggestions;
/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchStateCopyWith<SearchState> get copyWith => _$SearchStateCopyWithImpl<SearchState>(this as SearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchState&&(identical(other.term, term) || other.term == term)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.suggestions, suggestions));
}


@override
int get hashCode => Object.hash(runtimeType,term,status,const DeepCollectionEquality().hash(suggestions));

@override
String toString() {
  return 'SearchState(term: $term, status: $status, suggestions: $suggestions)';
}


}

/// @nodoc
abstract mixin class $SearchStateCopyWith<$Res>  {
  factory $SearchStateCopyWith(SearchState value, $Res Function(SearchState) _then) = _$SearchStateCopyWithImpl;
@useResult
$Res call({
 String term, SuggestStatus status, List<SuggestionView> suggestions
});




}
/// @nodoc
class _$SearchStateCopyWithImpl<$Res>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._self, this._then);

  final SearchState _self;
  final $Res Function(SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? term = null,Object? status = null,Object? suggestions = null,}) {
  return _then(_self.copyWith(
term: null == term ? _self.term : term // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SuggestStatus,suggestions: null == suggestions ? _self.suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<SuggestionView>,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchState value)  $default,){
final _that = this;
switch (_that) {
case _SearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchState value)?  $default,){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String term,  SuggestStatus status,  List<SuggestionView> suggestions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.term,_that.status,_that.suggestions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String term,  SuggestStatus status,  List<SuggestionView> suggestions)  $default,) {final _that = this;
switch (_that) {
case _SearchState():
return $default(_that.term,_that.status,_that.suggestions);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String term,  SuggestStatus status,  List<SuggestionView> suggestions)?  $default,) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.term,_that.status,_that.suggestions);case _:
  return null;

}
}

}

/// @nodoc


class _SearchState implements SearchState {
  const _SearchState({this.term = '', this.status = SuggestStatus.idle, final  List<SuggestionView> suggestions = const <SuggestionView>[]}): _suggestions = suggestions;
  

@override@JsonKey() final  String term;
@override@JsonKey() final  SuggestStatus status;
 final  List<SuggestionView> _suggestions;
@override@JsonKey() List<SuggestionView> get suggestions {
  if (_suggestions is EqualUnmodifiableListView) return _suggestions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_suggestions);
}


/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchStateCopyWith<_SearchState> get copyWith => __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchState&&(identical(other.term, term) || other.term == term)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._suggestions, _suggestions));
}


@override
int get hashCode => Object.hash(runtimeType,term,status,const DeepCollectionEquality().hash(_suggestions));

@override
String toString() {
  return 'SearchState(term: $term, status: $status, suggestions: $suggestions)';
}


}

/// @nodoc
abstract mixin class _$SearchStateCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(_SearchState value, $Res Function(_SearchState) _then) = __$SearchStateCopyWithImpl;
@override @useResult
$Res call({
 String term, SuggestStatus status, List<SuggestionView> suggestions
});




}
/// @nodoc
class __$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(this._self, this._then);

  final _SearchState _self;
  final $Res Function(_SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? term = null,Object? status = null,Object? suggestions = null,}) {
  return _then(_SearchState(
term: null == term ? _self.term : term // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SuggestStatus,suggestions: null == suggestions ? _self._suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<SuggestionView>,
  ));
}


}

// dart format on
