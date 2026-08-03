// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ForgotPasswordState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPasswordState()';
}


}

/// @nodoc
class $ForgotPasswordStateCopyWith<$Res>  {
$ForgotPasswordStateCopyWith(ForgotPasswordState _, $Res Function(ForgotPasswordState) __);
}


/// Adds pattern-matching-related methods to [ForgotPasswordState].
extension ForgotPasswordStatePatterns on ForgotPasswordState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _SendingCode value)?  sendingCode,TResult Function( _CodeSent value)?  codeSent,TResult Function( _ResettingPassword value)?  resettingPassword,TResult Function( _PasswordReset value)?  passwordReset,TResult Function( _RateLimited value)?  rateLimited,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _SendingCode() when sendingCode != null:
return sendingCode(_that);case _CodeSent() when codeSent != null:
return codeSent(_that);case _ResettingPassword() when resettingPassword != null:
return resettingPassword(_that);case _PasswordReset() when passwordReset != null:
return passwordReset(_that);case _RateLimited() when rateLimited != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _SendingCode value)  sendingCode,required TResult Function( _CodeSent value)  codeSent,required TResult Function( _ResettingPassword value)  resettingPassword,required TResult Function( _PasswordReset value)  passwordReset,required TResult Function( _RateLimited value)  rateLimited,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _SendingCode():
return sendingCode(_that);case _CodeSent():
return codeSent(_that);case _ResettingPassword():
return resettingPassword(_that);case _PasswordReset():
return passwordReset(_that);case _RateLimited():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _SendingCode value)?  sendingCode,TResult? Function( _CodeSent value)?  codeSent,TResult? Function( _ResettingPassword value)?  resettingPassword,TResult? Function( _PasswordReset value)?  passwordReset,TResult? Function( _RateLimited value)?  rateLimited,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _SendingCode() when sendingCode != null:
return sendingCode(_that);case _CodeSent() when codeSent != null:
return codeSent(_that);case _ResettingPassword() when resettingPassword != null:
return resettingPassword(_that);case _PasswordReset() when passwordReset != null:
return passwordReset(_that);case _RateLimited() when rateLimited != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  sendingCode,TResult Function( String message)?  codeSent,TResult Function()?  resettingPassword,TResult Function( String message)?  passwordReset,TResult Function( int seconds)?  rateLimited,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _SendingCode() when sendingCode != null:
return sendingCode();case _CodeSent() when codeSent != null:
return codeSent(_that.message);case _ResettingPassword() when resettingPassword != null:
return resettingPassword();case _PasswordReset() when passwordReset != null:
return passwordReset(_that.message);case _RateLimited() when rateLimited != null:
return rateLimited(_that.seconds);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  sendingCode,required TResult Function( String message)  codeSent,required TResult Function()  resettingPassword,required TResult Function( String message)  passwordReset,required TResult Function( int seconds)  rateLimited,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _SendingCode():
return sendingCode();case _CodeSent():
return codeSent(_that.message);case _ResettingPassword():
return resettingPassword();case _PasswordReset():
return passwordReset(_that.message);case _RateLimited():
return rateLimited(_that.seconds);case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  sendingCode,TResult? Function( String message)?  codeSent,TResult? Function()?  resettingPassword,TResult? Function( String message)?  passwordReset,TResult? Function( int seconds)?  rateLimited,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _SendingCode() when sendingCode != null:
return sendingCode();case _CodeSent() when codeSent != null:
return codeSent(_that.message);case _ResettingPassword() when resettingPassword != null:
return resettingPassword();case _PasswordReset() when passwordReset != null:
return passwordReset(_that.message);case _RateLimited() when rateLimited != null:
return rateLimited(_that.seconds);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ForgotPasswordState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPasswordState.initial()';
}


}




/// @nodoc


class _SendingCode implements ForgotPasswordState {
  const _SendingCode();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendingCode);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPasswordState.sendingCode()';
}


}




/// @nodoc


class _CodeSent implements ForgotPasswordState {
  const _CodeSent({required this.message});
  

 final  String message;

/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CodeSentCopyWith<_CodeSent> get copyWith => __$CodeSentCopyWithImpl<_CodeSent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CodeSent&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ForgotPasswordState.codeSent(message: $message)';
}


}

/// @nodoc
abstract mixin class _$CodeSentCopyWith<$Res> implements $ForgotPasswordStateCopyWith<$Res> {
  factory _$CodeSentCopyWith(_CodeSent value, $Res Function(_CodeSent) _then) = __$CodeSentCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$CodeSentCopyWithImpl<$Res>
    implements _$CodeSentCopyWith<$Res> {
  __$CodeSentCopyWithImpl(this._self, this._then);

  final _CodeSent _self;
  final $Res Function(_CodeSent) _then;

/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_CodeSent(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ResettingPassword implements ForgotPasswordState {
  const _ResettingPassword();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResettingPassword);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgotPasswordState.resettingPassword()';
}


}




/// @nodoc


class _PasswordReset implements ForgotPasswordState {
  const _PasswordReset({required this.message});
  

 final  String message;

/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PasswordResetCopyWith<_PasswordReset> get copyWith => __$PasswordResetCopyWithImpl<_PasswordReset>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PasswordReset&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ForgotPasswordState.passwordReset(message: $message)';
}


}

/// @nodoc
abstract mixin class _$PasswordResetCopyWith<$Res> implements $ForgotPasswordStateCopyWith<$Res> {
  factory _$PasswordResetCopyWith(_PasswordReset value, $Res Function(_PasswordReset) _then) = __$PasswordResetCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$PasswordResetCopyWithImpl<$Res>
    implements _$PasswordResetCopyWith<$Res> {
  __$PasswordResetCopyWithImpl(this._self, this._then);

  final _PasswordReset _self;
  final $Res Function(_PasswordReset) _then;

/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_PasswordReset(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _RateLimited implements ForgotPasswordState {
  const _RateLimited({required this.seconds});
  

 final  int seconds;

/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RateLimitedCopyWith<_RateLimited> get copyWith => __$RateLimitedCopyWithImpl<_RateLimited>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RateLimited&&(identical(other.seconds, seconds) || other.seconds == seconds));
}


@override
int get hashCode => Object.hash(runtimeType,seconds);

@override
String toString() {
  return 'ForgotPasswordState.rateLimited(seconds: $seconds)';
}


}

/// @nodoc
abstract mixin class _$RateLimitedCopyWith<$Res> implements $ForgotPasswordStateCopyWith<$Res> {
  factory _$RateLimitedCopyWith(_RateLimited value, $Res Function(_RateLimited) _then) = __$RateLimitedCopyWithImpl;
@useResult
$Res call({
 int seconds
});




}
/// @nodoc
class __$RateLimitedCopyWithImpl<$Res>
    implements _$RateLimitedCopyWith<$Res> {
  __$RateLimitedCopyWithImpl(this._self, this._then);

  final _RateLimited _self;
  final $Res Function(_RateLimited) _then;

/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? seconds = null,}) {
  return _then(_RateLimited(
seconds: null == seconds ? _self.seconds : seconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Error implements ForgotPasswordState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of ForgotPasswordState
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
  return 'ForgotPasswordState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $ForgotPasswordStateCopyWith<$Res> {
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

/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
