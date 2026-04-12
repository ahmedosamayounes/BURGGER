// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'side_options_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SideOptionsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SideOptionsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SideOptionsState()';
}


}

/// @nodoc
class $SideOptionsStateCopyWith<$Res>  {
$SideOptionsStateCopyWith(SideOptionsState _, $Res Function(SideOptionsState) __);
}


/// Adds pattern-matching-related methods to [SideOptionsState].
extension SideOptionsStatePatterns on SideOptionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( SideOptionsStateLoading value)?  loading,TResult Function( SideOptionsStateSuccess value)?  success,TResult Function( SideOptionsStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case SideOptionsStateLoading() when loading != null:
return loading(_that);case SideOptionsStateSuccess() when success != null:
return success(_that);case SideOptionsStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( SideOptionsStateLoading value)  loading,required TResult Function( SideOptionsStateSuccess value)  success,required TResult Function( SideOptionsStateError value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case SideOptionsStateLoading():
return loading(_that);case SideOptionsStateSuccess():
return success(_that);case SideOptionsStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( SideOptionsStateLoading value)?  loading,TResult? Function( SideOptionsStateSuccess value)?  success,TResult? Function( SideOptionsStateError value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case SideOptionsStateLoading() when loading != null:
return loading(_that);case SideOptionsStateSuccess() when success != null:
return success(_that);case SideOptionsStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<OptionData?>? sideOptionsList)?  success,TResult Function( ErrorHandler error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case SideOptionsStateLoading() when loading != null:
return loading();case SideOptionsStateSuccess() when success != null:
return success(_that.sideOptionsList);case SideOptionsStateError() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<OptionData?>? sideOptionsList)  success,required TResult Function( ErrorHandler error)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case SideOptionsStateLoading():
return loading();case SideOptionsStateSuccess():
return success(_that.sideOptionsList);case SideOptionsStateError():
return error(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<OptionData?>? sideOptionsList)?  success,TResult? Function( ErrorHandler error)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case SideOptionsStateLoading() when loading != null:
return loading();case SideOptionsStateSuccess() when success != null:
return success(_that.sideOptionsList);case SideOptionsStateError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements SideOptionsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SideOptionsState.initial()';
}


}




/// @nodoc


class SideOptionsStateLoading implements SideOptionsState {
  const SideOptionsStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SideOptionsStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SideOptionsState.loading()';
}


}




/// @nodoc


class SideOptionsStateSuccess implements SideOptionsState {
  const SideOptionsStateSuccess(final  List<OptionData?>? sideOptionsList): _sideOptionsList = sideOptionsList;
  

 final  List<OptionData?>? _sideOptionsList;
 List<OptionData?>? get sideOptionsList {
  final value = _sideOptionsList;
  if (value == null) return null;
  if (_sideOptionsList is EqualUnmodifiableListView) return _sideOptionsList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of SideOptionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SideOptionsStateSuccessCopyWith<SideOptionsStateSuccess> get copyWith => _$SideOptionsStateSuccessCopyWithImpl<SideOptionsStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SideOptionsStateSuccess&&const DeepCollectionEquality().equals(other._sideOptionsList, _sideOptionsList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sideOptionsList));

@override
String toString() {
  return 'SideOptionsState.success(sideOptionsList: $sideOptionsList)';
}


}

/// @nodoc
abstract mixin class $SideOptionsStateSuccessCopyWith<$Res> implements $SideOptionsStateCopyWith<$Res> {
  factory $SideOptionsStateSuccessCopyWith(SideOptionsStateSuccess value, $Res Function(SideOptionsStateSuccess) _then) = _$SideOptionsStateSuccessCopyWithImpl;
@useResult
$Res call({
 List<OptionData?>? sideOptionsList
});




}
/// @nodoc
class _$SideOptionsStateSuccessCopyWithImpl<$Res>
    implements $SideOptionsStateSuccessCopyWith<$Res> {
  _$SideOptionsStateSuccessCopyWithImpl(this._self, this._then);

  final SideOptionsStateSuccess _self;
  final $Res Function(SideOptionsStateSuccess) _then;

/// Create a copy of SideOptionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sideOptionsList = freezed,}) {
  return _then(SideOptionsStateSuccess(
freezed == sideOptionsList ? _self._sideOptionsList : sideOptionsList // ignore: cast_nullable_to_non_nullable
as List<OptionData?>?,
  ));
}


}

/// @nodoc


class SideOptionsStateError implements SideOptionsState {
  const SideOptionsStateError(this.error);
  

 final  ErrorHandler error;

/// Create a copy of SideOptionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SideOptionsStateErrorCopyWith<SideOptionsStateError> get copyWith => _$SideOptionsStateErrorCopyWithImpl<SideOptionsStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SideOptionsStateError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'SideOptionsState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $SideOptionsStateErrorCopyWith<$Res> implements $SideOptionsStateCopyWith<$Res> {
  factory $SideOptionsStateErrorCopyWith(SideOptionsStateError value, $Res Function(SideOptionsStateError) _then) = _$SideOptionsStateErrorCopyWithImpl;
@useResult
$Res call({
 ErrorHandler error
});




}
/// @nodoc
class _$SideOptionsStateErrorCopyWithImpl<$Res>
    implements $SideOptionsStateErrorCopyWith<$Res> {
  _$SideOptionsStateErrorCopyWithImpl(this._self, this._then);

  final SideOptionsStateError _self;
  final $Res Function(SideOptionsStateError) _then;

/// Create a copy of SideOptionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(SideOptionsStateError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ErrorHandler,
  ));
}


}

// dart format on
