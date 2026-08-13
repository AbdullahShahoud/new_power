// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState()';
}


}

/// @nodoc
class $LoginStateCopyWith<$Res>  {
$LoginStateCopyWith(LoginState _, $Res Function(LoginState) __);
}


/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns on LoginState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,TResult Function( _OtpRequired value)?  otpRequired,TResult Function( _PendingApproval value)?  pendingApproval,TResult Function( _RoleNotAllowed value)?  roleNotAllowed,TResult Function( _TwoFactorSetupRequired value)?  twoFactorSetupRequired,TResult Function( _TwoFactorRequired value)?  twoFactorRequired,TResult Function( _RateLimited value)?  rateLimited,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _OtpRequired() when otpRequired != null:
return otpRequired(_that);case _PendingApproval() when pendingApproval != null:
return pendingApproval(_that);case _RoleNotAllowed() when roleNotAllowed != null:
return roleNotAllowed(_that);case _TwoFactorSetupRequired() when twoFactorSetupRequired != null:
return twoFactorSetupRequired(_that);case _TwoFactorRequired() when twoFactorRequired != null:
return twoFactorRequired(_that);case _RateLimited() when rateLimited != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,required TResult Function( _OtpRequired value)  otpRequired,required TResult Function( _PendingApproval value)  pendingApproval,required TResult Function( _RoleNotAllowed value)  roleNotAllowed,required TResult Function( _TwoFactorSetupRequired value)  twoFactorSetupRequired,required TResult Function( _TwoFactorRequired value)  twoFactorRequired,required TResult Function( _RateLimited value)  rateLimited,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Success():
return success(_that);case _OtpRequired():
return otpRequired(_that);case _PendingApproval():
return pendingApproval(_that);case _RoleNotAllowed():
return roleNotAllowed(_that);case _TwoFactorSetupRequired():
return twoFactorSetupRequired(_that);case _TwoFactorRequired():
return twoFactorRequired(_that);case _RateLimited():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,TResult? Function( _OtpRequired value)?  otpRequired,TResult? Function( _PendingApproval value)?  pendingApproval,TResult? Function( _RoleNotAllowed value)?  roleNotAllowed,TResult? Function( _TwoFactorSetupRequired value)?  twoFactorSetupRequired,TResult? Function( _TwoFactorRequired value)?  twoFactorRequired,TResult? Function( _RateLimited value)?  rateLimited,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _OtpRequired() when otpRequired != null:
return otpRequired(_that);case _PendingApproval() when pendingApproval != null:
return pendingApproval(_that);case _RoleNotAllowed() when roleNotAllowed != null:
return roleNotAllowed(_that);case _TwoFactorSetupRequired() when twoFactorSetupRequired != null:
return twoFactorSetupRequired(_that);case _TwoFactorRequired() when twoFactorRequired != null:
return twoFactorRequired(_that);case _RateLimited() when rateLimited != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String? role)?  success,TResult Function( String verificationId)?  otpRequired,TResult Function()?  pendingApproval,TResult Function()?  roleNotAllowed,TResult Function()?  twoFactorSetupRequired,TResult Function( String verificationId)?  twoFactorRequired,TResult Function( int seconds)?  rateLimited,TResult Function( String error,  String? errorCode)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.role);case _OtpRequired() when otpRequired != null:
return otpRequired(_that.verificationId);case _PendingApproval() when pendingApproval != null:
return pendingApproval();case _RoleNotAllowed() when roleNotAllowed != null:
return roleNotAllowed();case _TwoFactorSetupRequired() when twoFactorSetupRequired != null:
return twoFactorSetupRequired();case _TwoFactorRequired() when twoFactorRequired != null:
return twoFactorRequired(_that.verificationId);case _RateLimited() when rateLimited != null:
return rateLimited(_that.seconds);case _Error() when error != null:
return error(_that.error,_that.errorCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String? role)  success,required TResult Function( String verificationId)  otpRequired,required TResult Function()  pendingApproval,required TResult Function()  roleNotAllowed,required TResult Function()  twoFactorSetupRequired,required TResult Function( String verificationId)  twoFactorRequired,required TResult Function( int seconds)  rateLimited,required TResult Function( String error,  String? errorCode)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Success():
return success(_that.role);case _OtpRequired():
return otpRequired(_that.verificationId);case _PendingApproval():
return pendingApproval();case _RoleNotAllowed():
return roleNotAllowed();case _TwoFactorSetupRequired():
return twoFactorSetupRequired();case _TwoFactorRequired():
return twoFactorRequired(_that.verificationId);case _RateLimited():
return rateLimited(_that.seconds);case _Error():
return error(_that.error,_that.errorCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String? role)?  success,TResult? Function( String verificationId)?  otpRequired,TResult? Function()?  pendingApproval,TResult? Function()?  roleNotAllowed,TResult? Function()?  twoFactorSetupRequired,TResult? Function( String verificationId)?  twoFactorRequired,TResult? Function( int seconds)?  rateLimited,TResult? Function( String error,  String? errorCode)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.role);case _OtpRequired() when otpRequired != null:
return otpRequired(_that.verificationId);case _PendingApproval() when pendingApproval != null:
return pendingApproval();case _RoleNotAllowed() when roleNotAllowed != null:
return roleNotAllowed();case _TwoFactorSetupRequired() when twoFactorSetupRequired != null:
return twoFactorSetupRequired();case _TwoFactorRequired() when twoFactorRequired != null:
return twoFactorRequired(_that.verificationId);case _RateLimited() when rateLimited != null:
return rateLimited(_that.seconds);case _Error() when error != null:
return error(_that.error,_that.errorCode);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements LoginState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.initial()';
}


}




/// @nodoc


class _Loading implements LoginState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.loading()';
}


}




/// @nodoc


class _Success implements LoginState {
  const _Success({required this.role});
  

 final  String? role;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.role, role) || other.role == role));
}


@override
int get hashCode => Object.hash(runtimeType,role);

@override
String toString() {
  return 'LoginState.success(role: $role)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 String? role
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? role = freezed,}) {
  return _then(_Success(
role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _OtpRequired implements LoginState {
  const _OtpRequired({required this.verificationId});
  

 final  String verificationId;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OtpRequiredCopyWith<_OtpRequired> get copyWith => __$OtpRequiredCopyWithImpl<_OtpRequired>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtpRequired&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId));
}


@override
int get hashCode => Object.hash(runtimeType,verificationId);

@override
String toString() {
  return 'LoginState.otpRequired(verificationId: $verificationId)';
}


}

/// @nodoc
abstract mixin class _$OtpRequiredCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$OtpRequiredCopyWith(_OtpRequired value, $Res Function(_OtpRequired) _then) = __$OtpRequiredCopyWithImpl;
@useResult
$Res call({
 String verificationId
});




}
/// @nodoc
class __$OtpRequiredCopyWithImpl<$Res>
    implements _$OtpRequiredCopyWith<$Res> {
  __$OtpRequiredCopyWithImpl(this._self, this._then);

  final _OtpRequired _self;
  final $Res Function(_OtpRequired) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? verificationId = null,}) {
  return _then(_OtpRequired(
verificationId: null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _PendingApproval implements LoginState {
  const _PendingApproval();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PendingApproval);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.pendingApproval()';
}


}




/// @nodoc


class _RoleNotAllowed implements LoginState {
  const _RoleNotAllowed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoleNotAllowed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.roleNotAllowed()';
}


}




/// @nodoc


class _TwoFactorSetupRequired implements LoginState {
  const _TwoFactorSetupRequired();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TwoFactorSetupRequired);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.twoFactorSetupRequired()';
}


}




/// @nodoc


class _TwoFactorRequired implements LoginState {
  const _TwoFactorRequired({required this.verificationId});
  

 final  String verificationId;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TwoFactorRequiredCopyWith<_TwoFactorRequired> get copyWith => __$TwoFactorRequiredCopyWithImpl<_TwoFactorRequired>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TwoFactorRequired&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId));
}


@override
int get hashCode => Object.hash(runtimeType,verificationId);

@override
String toString() {
  return 'LoginState.twoFactorRequired(verificationId: $verificationId)';
}


}

/// @nodoc
abstract mixin class _$TwoFactorRequiredCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$TwoFactorRequiredCopyWith(_TwoFactorRequired value, $Res Function(_TwoFactorRequired) _then) = __$TwoFactorRequiredCopyWithImpl;
@useResult
$Res call({
 String verificationId
});




}
/// @nodoc
class __$TwoFactorRequiredCopyWithImpl<$Res>
    implements _$TwoFactorRequiredCopyWith<$Res> {
  __$TwoFactorRequiredCopyWithImpl(this._self, this._then);

  final _TwoFactorRequired _self;
  final $Res Function(_TwoFactorRequired) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? verificationId = null,}) {
  return _then(_TwoFactorRequired(
verificationId: null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _RateLimited implements LoginState {
  const _RateLimited({required this.seconds});
  

 final  int seconds;

/// Create a copy of LoginState
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
  return 'LoginState.rateLimited(seconds: $seconds)';
}


}

/// @nodoc
abstract mixin class _$RateLimitedCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
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

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? seconds = null,}) {
  return _then(_RateLimited(
seconds: null == seconds ? _self.seconds : seconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Error implements LoginState {
  const _Error(this.error, {this.errorCode});
  

 final  String error;
 final  String? errorCode;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.error, error) || other.error == error)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode));
}


@override
int get hashCode => Object.hash(runtimeType,error,errorCode);

@override
String toString() {
  return 'LoginState.error(error: $error, errorCode: $errorCode)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String error, String? errorCode
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? errorCode = freezed,}) {
  return _then(_Error(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
