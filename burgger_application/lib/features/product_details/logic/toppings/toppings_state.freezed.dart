// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'toppings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ToppingsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToppingsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ToppingsState()';
}


}

/// @nodoc
class $ToppingsStateCopyWith<$Res>  {
$ToppingsStateCopyWith(ToppingsState _, $Res Function(ToppingsState) __);
}


/// Adds pattern-matching-related methods to [ToppingsState].
extension ToppingsStatePatterns on ToppingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( ToppingsStateLoading value)?  loading,TResult Function( ToppingsStateSuccess value)?  success,TResult Function( ToppingsStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case ToppingsStateLoading() when loading != null:
return loading(_that);case ToppingsStateSuccess() when success != null:
return success(_that);case ToppingsStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( ToppingsStateLoading value)  loading,required TResult Function( ToppingsStateSuccess value)  success,required TResult Function( ToppingsStateError value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case ToppingsStateLoading():
return loading(_that);case ToppingsStateSuccess():
return success(_that);case ToppingsStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( ToppingsStateLoading value)?  loading,TResult? Function( ToppingsStateSuccess value)?  success,TResult? Function( ToppingsStateError value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case ToppingsStateLoading() when loading != null:
return loading(_that);case ToppingsStateSuccess() when success != null:
return success(_that);case ToppingsStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<OptionData?>? toppingsList)?  success,TResult Function( ErrorHandler error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case ToppingsStateLoading() when loading != null:
return loading();case ToppingsStateSuccess() when success != null:
return success(_that.toppingsList);case ToppingsStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<OptionData?>? toppingsList)  success,required TResult Function( ErrorHandler error)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case ToppingsStateLoading():
return loading();case ToppingsStateSuccess():
return success(_that.toppingsList);case ToppingsStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<OptionData?>? toppingsList)?  success,TResult? Function( ErrorHandler error)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case ToppingsStateLoading() when loading != null:
return loading();case ToppingsStateSuccess() when success != null:
return success(_that.toppingsList);case ToppingsStateError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ToppingsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ToppingsState.initial()';
}


}




/// @nodoc


class ToppingsStateLoading implements ToppingsState {
  const ToppingsStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToppingsStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ToppingsState.loading()';
}


}




/// @nodoc


class ToppingsStateSuccess implements ToppingsState {
  const ToppingsStateSuccess(final  List<OptionData?>? toppingsList): _toppingsList = toppingsList;
  

 final  List<OptionData?>? _toppingsList;
 List<OptionData?>? get toppingsList {
  final value = _toppingsList;
  if (value == null) return null;
  if (_toppingsList is EqualUnmodifiableListView) return _toppingsList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ToppingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToppingsStateSuccessCopyWith<ToppingsStateSuccess> get copyWith => _$ToppingsStateSuccessCopyWithImpl<ToppingsStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToppingsStateSuccess&&const DeepCollectionEquality().equals(other._toppingsList, _toppingsList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_toppingsList));

@override
String toString() {
  return 'ToppingsState.success(toppingsList: $toppingsList)';
}


}

/// @nodoc
abstract mixin class $ToppingsStateSuccessCopyWith<$Res> implements $ToppingsStateCopyWith<$Res> {
  factory $ToppingsStateSuccessCopyWith(ToppingsStateSuccess value, $Res Function(ToppingsStateSuccess) _then) = _$ToppingsStateSuccessCopyWithImpl;
@useResult
$Res call({
 List<OptionData?>? toppingsList
});




}
/// @nodoc
class _$ToppingsStateSuccessCopyWithImpl<$Res>
    implements $ToppingsStateSuccessCopyWith<$Res> {
  _$ToppingsStateSuccessCopyWithImpl(this._self, this._then);

  final ToppingsStateSuccess _self;
  final $Res Function(ToppingsStateSuccess) _then;

/// Create a copy of ToppingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? toppingsList = freezed,}) {
  return _then(ToppingsStateSuccess(
freezed == toppingsList ? _self._toppingsList : toppingsList // ignore: cast_nullable_to_non_nullable
as List<OptionData?>?,
  ));
}


}

/// @nodoc


class ToppingsStateError implements ToppingsState {
  const ToppingsStateError(this.error);
  

 final  ErrorHandler error;

/// Create a copy of ToppingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToppingsStateErrorCopyWith<ToppingsStateError> get copyWith => _$ToppingsStateErrorCopyWithImpl<ToppingsStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToppingsStateError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'ToppingsState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ToppingsStateErrorCopyWith<$Res> implements $ToppingsStateCopyWith<$Res> {
  factory $ToppingsStateErrorCopyWith(ToppingsStateError value, $Res Function(ToppingsStateError) _then) = _$ToppingsStateErrorCopyWithImpl;
@useResult
$Res call({
 ErrorHandler error
});




}
/// @nodoc
class _$ToppingsStateErrorCopyWithImpl<$Res>
    implements $ToppingsStateErrorCopyWith<$Res> {
  _$ToppingsStateErrorCopyWithImpl(this._self, this._then);

  final ToppingsStateError _self;
  final $Res Function(ToppingsStateError) _then;

/// Create a copy of ToppingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ToppingsStateError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ErrorHandler,
  ));
}


}

// dart format on
