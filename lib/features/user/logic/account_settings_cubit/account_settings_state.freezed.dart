// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AccountSettingsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountSettingsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccountSettingsState()';
}


}

/// @nodoc
class $AccountSettingsStateCopyWith<$Res>  {
$AccountSettingsStateCopyWith(AccountSettingsState _, $Res Function(AccountSettingsState) __);
}


/// Adds pattern-matching-related methods to [AccountSettingsState].
extension AccountSettingsStatePatterns on AccountSettingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,TResult Function( _IncorrectPassword value)?  incorrectPassword,TResult Function( _SamePassword value)?  samePassword,TResult Function( _UsernameTaken value)?  usernameTaken,TResult Function( _UsernameAlreadyChanged value)?  usernameAlreadyChanged,TResult Function( _RateLimited value)?  rateLimited,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _IncorrectPassword() when incorrectPassword != null:
return incorrectPassword(_that);case _SamePassword() when samePassword != null:
return samePassword(_that);case _UsernameTaken() when usernameTaken != null:
return usernameTaken(_that);case _UsernameAlreadyChanged() when usernameAlreadyChanged != null:
return usernameAlreadyChanged(_that);case _RateLimited() when rateLimited != null:
return rateLimited(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,required TResult Function( _IncorrectPassword value)  incorrectPassword,required TResult Function( _SamePassword value)  samePassword,required TResult Function( _UsernameTaken value)  usernameTaken,required TResult Function( _UsernameAlreadyChanged value)  usernameAlreadyChanged,required TResult Function( _RateLimited value)  rateLimited,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Success():
return success(_that);case _IncorrectPassword():
return incorrectPassword(_that);case _SamePassword():
return samePassword(_that);case _UsernameTaken():
return usernameTaken(_that);case _UsernameAlreadyChanged():
return usernameAlreadyChanged(_that);case _RateLimited():
return rateLimited(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,TResult? Function( _IncorrectPassword value)?  incorrectPassword,TResult? Function( _SamePassword value)?  samePassword,TResult? Function( _UsernameTaken value)?  usernameTaken,TResult? Function( _UsernameAlreadyChanged value)?  usernameAlreadyChanged,TResult? Function( _RateLimited value)?  rateLimited,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _IncorrectPassword() when incorrectPassword != null:
return incorrectPassword(_that);case _SamePassword() when samePassword != null:
return samePassword(_that);case _UsernameTaken() when usernameTaken != null:
return usernameTaken(_that);case _UsernameAlreadyChanged() when usernameAlreadyChanged != null:
return usernameAlreadyChanged(_that);case _RateLimited() when rateLimited != null:
return rateLimited(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String? message)?  success,TResult Function()?  incorrectPassword,TResult Function()?  samePassword,TResult Function()?  usernameTaken,TResult Function()?  usernameAlreadyChanged,TResult Function( int? retryAfterSeconds)?  rateLimited,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.message);case _IncorrectPassword() when incorrectPassword != null:
return incorrectPassword();case _SamePassword() when samePassword != null:
return samePassword();case _UsernameTaken() when usernameTaken != null:
return usernameTaken();case _UsernameAlreadyChanged() when usernameAlreadyChanged != null:
return usernameAlreadyChanged();case _RateLimited() when rateLimited != null:
return rateLimited(_that.retryAfterSeconds);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String? message)  success,required TResult Function()  incorrectPassword,required TResult Function()  samePassword,required TResult Function()  usernameTaken,required TResult Function()  usernameAlreadyChanged,required TResult Function( int? retryAfterSeconds)  rateLimited,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Success():
return success(_that.message);case _IncorrectPassword():
return incorrectPassword();case _SamePassword():
return samePassword();case _UsernameTaken():
return usernameTaken();case _UsernameAlreadyChanged():
return usernameAlreadyChanged();case _RateLimited():
return rateLimited(_that.retryAfterSeconds);case _Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String? message)?  success,TResult? Function()?  incorrectPassword,TResult? Function()?  samePassword,TResult? Function()?  usernameTaken,TResult? Function()?  usernameAlreadyChanged,TResult? Function( int? retryAfterSeconds)?  rateLimited,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.message);case _IncorrectPassword() when incorrectPassword != null:
return incorrectPassword();case _SamePassword() when samePassword != null:
return samePassword();case _UsernameTaken() when usernameTaken != null:
return usernameTaken();case _UsernameAlreadyChanged() when usernameAlreadyChanged != null:
return usernameAlreadyChanged();case _RateLimited() when rateLimited != null:
return rateLimited(_that.retryAfterSeconds);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AccountSettingsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccountSettingsState.initial()';
}


}




/// @nodoc


class _Loading implements AccountSettingsState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccountSettingsState.loading()';
}


}




/// @nodoc


class _Success implements AccountSettingsState {
  const _Success({this.message});
  

 final  String? message;

/// Create a copy of AccountSettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AccountSettingsState.success(message: $message)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $AccountSettingsStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of AccountSettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_Success(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _IncorrectPassword implements AccountSettingsState {
  const _IncorrectPassword();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncorrectPassword);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccountSettingsState.incorrectPassword()';
}


}




/// @nodoc


class _SamePassword implements AccountSettingsState {
  const _SamePassword();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SamePassword);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccountSettingsState.samePassword()';
}


}




/// @nodoc


class _UsernameTaken implements AccountSettingsState {
  const _UsernameTaken();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsernameTaken);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccountSettingsState.usernameTaken()';
}


}




/// @nodoc


class _UsernameAlreadyChanged implements AccountSettingsState {
  const _UsernameAlreadyChanged();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsernameAlreadyChanged);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccountSettingsState.usernameAlreadyChanged()';
}


}




/// @nodoc


class _RateLimited implements AccountSettingsState {
  const _RateLimited({this.retryAfterSeconds});
  

 final  int? retryAfterSeconds;

/// Create a copy of AccountSettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RateLimitedCopyWith<_RateLimited> get copyWith => __$RateLimitedCopyWithImpl<_RateLimited>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RateLimited&&(identical(other.retryAfterSeconds, retryAfterSeconds) || other.retryAfterSeconds == retryAfterSeconds));
}


@override
int get hashCode => Object.hash(runtimeType,retryAfterSeconds);

@override
String toString() {
  return 'AccountSettingsState.rateLimited(retryAfterSeconds: $retryAfterSeconds)';
}


}

/// @nodoc
abstract mixin class _$RateLimitedCopyWith<$Res> implements $AccountSettingsStateCopyWith<$Res> {
  factory _$RateLimitedCopyWith(_RateLimited value, $Res Function(_RateLimited) _then) = __$RateLimitedCopyWithImpl;
@useResult
$Res call({
 int? retryAfterSeconds
});




}
/// @nodoc
class __$RateLimitedCopyWithImpl<$Res>
    implements _$RateLimitedCopyWith<$Res> {
  __$RateLimitedCopyWithImpl(this._self, this._then);

  final _RateLimited _self;
  final $Res Function(_RateLimited) _then;

/// Create a copy of AccountSettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? retryAfterSeconds = freezed,}) {
  return _then(_RateLimited(
retryAfterSeconds: freezed == retryAfterSeconds ? _self.retryAfterSeconds : retryAfterSeconds // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _Error implements AccountSettingsState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of AccountSettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AccountSettingsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $AccountSettingsStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of AccountSettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
