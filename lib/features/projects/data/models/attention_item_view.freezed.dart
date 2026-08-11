// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attention_item_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AttentionItemView {

 String get projectId; String get name; AttentionReason get reason; String get message; DateTime? get dueAt; int get daysWaiting;
/// Create a copy of AttentionItemView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttentionItemViewCopyWith<AttentionItemView> get copyWith => _$AttentionItemViewCopyWithImpl<AttentionItemView>(this as AttentionItemView, _$identity);

  /// Serializes this AttentionItemView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttentionItemView&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.name, name) || other.name == name)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.message, message) || other.message == message)&&(identical(other.dueAt, dueAt) || other.dueAt == dueAt)&&(identical(other.daysWaiting, daysWaiting) || other.daysWaiting == daysWaiting));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,projectId,name,reason,message,dueAt,daysWaiting);

@override
String toString() {
  return 'AttentionItemView(projectId: $projectId, name: $name, reason: $reason, message: $message, dueAt: $dueAt, daysWaiting: $daysWaiting)';
}


}

/// @nodoc
abstract mixin class $AttentionItemViewCopyWith<$Res>  {
  factory $AttentionItemViewCopyWith(AttentionItemView value, $Res Function(AttentionItemView) _then) = _$AttentionItemViewCopyWithImpl;
@useResult
$Res call({
 String projectId, String name, AttentionReason reason, String message, DateTime? dueAt, int daysWaiting
});




}
/// @nodoc
class _$AttentionItemViewCopyWithImpl<$Res>
    implements $AttentionItemViewCopyWith<$Res> {
  _$AttentionItemViewCopyWithImpl(this._self, this._then);

  final AttentionItemView _self;
  final $Res Function(AttentionItemView) _then;

/// Create a copy of AttentionItemView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? projectId = null,Object? name = null,Object? reason = null,Object? message = null,Object? dueAt = freezed,Object? daysWaiting = null,}) {
  return _then(_self.copyWith(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as AttentionReason,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,dueAt: freezed == dueAt ? _self.dueAt : dueAt // ignore: cast_nullable_to_non_nullable
as DateTime?,daysWaiting: null == daysWaiting ? _self.daysWaiting : daysWaiting // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AttentionItemView].
extension AttentionItemViewPatterns on AttentionItemView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttentionItemView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttentionItemView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttentionItemView value)  $default,){
final _that = this;
switch (_that) {
case _AttentionItemView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttentionItemView value)?  $default,){
final _that = this;
switch (_that) {
case _AttentionItemView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String projectId,  String name,  AttentionReason reason,  String message,  DateTime? dueAt,  int daysWaiting)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttentionItemView() when $default != null:
return $default(_that.projectId,_that.name,_that.reason,_that.message,_that.dueAt,_that.daysWaiting);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String projectId,  String name,  AttentionReason reason,  String message,  DateTime? dueAt,  int daysWaiting)  $default,) {final _that = this;
switch (_that) {
case _AttentionItemView():
return $default(_that.projectId,_that.name,_that.reason,_that.message,_that.dueAt,_that.daysWaiting);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String projectId,  String name,  AttentionReason reason,  String message,  DateTime? dueAt,  int daysWaiting)?  $default,) {final _that = this;
switch (_that) {
case _AttentionItemView() when $default != null:
return $default(_that.projectId,_that.name,_that.reason,_that.message,_that.dueAt,_that.daysWaiting);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttentionItemView implements AttentionItemView {
  const _AttentionItemView({required this.projectId, required this.name, required this.reason, required this.message, this.dueAt, required this.daysWaiting});
  factory _AttentionItemView.fromJson(Map<String, dynamic> json) => _$AttentionItemViewFromJson(json);

@override final  String projectId;
@override final  String name;
@override final  AttentionReason reason;
@override final  String message;
@override final  DateTime? dueAt;
@override final  int daysWaiting;

/// Create a copy of AttentionItemView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttentionItemViewCopyWith<_AttentionItemView> get copyWith => __$AttentionItemViewCopyWithImpl<_AttentionItemView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttentionItemViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttentionItemView&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.name, name) || other.name == name)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.message, message) || other.message == message)&&(identical(other.dueAt, dueAt) || other.dueAt == dueAt)&&(identical(other.daysWaiting, daysWaiting) || other.daysWaiting == daysWaiting));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,projectId,name,reason,message,dueAt,daysWaiting);

@override
String toString() {
  return 'AttentionItemView(projectId: $projectId, name: $name, reason: $reason, message: $message, dueAt: $dueAt, daysWaiting: $daysWaiting)';
}


}

/// @nodoc
abstract mixin class _$AttentionItemViewCopyWith<$Res> implements $AttentionItemViewCopyWith<$Res> {
  factory _$AttentionItemViewCopyWith(_AttentionItemView value, $Res Function(_AttentionItemView) _then) = __$AttentionItemViewCopyWithImpl;
@override @useResult
$Res call({
 String projectId, String name, AttentionReason reason, String message, DateTime? dueAt, int daysWaiting
});




}
/// @nodoc
class __$AttentionItemViewCopyWithImpl<$Res>
    implements _$AttentionItemViewCopyWith<$Res> {
  __$AttentionItemViewCopyWithImpl(this._self, this._then);

  final _AttentionItemView _self;
  final $Res Function(_AttentionItemView) _then;

/// Create a copy of AttentionItemView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projectId = null,Object? name = null,Object? reason = null,Object? message = null,Object? dueAt = freezed,Object? daysWaiting = null,}) {
  return _then(_AttentionItemView(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as AttentionReason,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,dueAt: freezed == dueAt ? _self.dueAt : dueAt // ignore: cast_nullable_to_non_nullable
as DateTime?,daysWaiting: null == daysWaiting ? _self.daysWaiting : daysWaiting // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
