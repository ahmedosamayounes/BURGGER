// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoriesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoriesState()';
}


}

/// @nodoc
class $CategoriesStateCopyWith<$Res>  {
$CategoriesStateCopyWith(CategoriesState _, $Res Function(CategoriesState) __);
}


/// Adds pattern-matching-related methods to [CategoriesState].
extension CategoriesStatePatterns on CategoriesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( CategoriesStateLoading value)?  loading,TResult Function( CategoriesStateSuccess value)?  success,TResult Function( CategoriesStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case CategoriesStateLoading() when loading != null:
return loading(_that);case CategoriesStateSuccess() when success != null:
return success(_that);case CategoriesStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( CategoriesStateLoading value)  loading,required TResult Function( CategoriesStateSuccess value)  success,required TResult Function( CategoriesStateError value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case CategoriesStateLoading():
return loading(_that);case CategoriesStateSuccess():
return success(_that);case CategoriesStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( CategoriesStateLoading value)?  loading,TResult? Function( CategoriesStateSuccess value)?  success,TResult? Function( CategoriesStateError value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case CategoriesStateLoading() when loading != null:
return loading(_that);case CategoriesStateSuccess() when success != null:
return success(_that);case CategoriesStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<CategoryData?>? categoriesDataList)?  success,TResult Function( ErrorHandler errorHandler)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case CategoriesStateLoading() when loading != null:
return loading();case CategoriesStateSuccess() when success != null:
return success(_that.categoriesDataList);case CategoriesStateError() when error != null:
return error(_that.errorHandler);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<CategoryData?>? categoriesDataList)  success,required TResult Function( ErrorHandler errorHandler)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case CategoriesStateLoading():
return loading();case CategoriesStateSuccess():
return success(_that.categoriesDataList);case CategoriesStateError():
return error(_that.errorHandler);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<CategoryData?>? categoriesDataList)?  success,TResult? Function( ErrorHandler errorHandler)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case CategoriesStateLoading() when loading != null:
return loading();case CategoriesStateSuccess() when success != null:
return success(_that.categoriesDataList);case CategoriesStateError() when error != null:
return error(_that.errorHandler);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CategoriesState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoriesState.initial()';
}


}




/// @nodoc


class CategoriesStateLoading implements CategoriesState {
  const CategoriesStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoriesState.loading()';
}


}




/// @nodoc


class CategoriesStateSuccess implements CategoriesState {
  const CategoriesStateSuccess(final  List<CategoryData?>? categoriesDataList): _categoriesDataList = categoriesDataList;
  

 final  List<CategoryData?>? _categoriesDataList;
 List<CategoryData?>? get categoriesDataList {
  final value = _categoriesDataList;
  if (value == null) return null;
  if (_categoriesDataList is EqualUnmodifiableListView) return _categoriesDataList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoriesStateSuccessCopyWith<CategoriesStateSuccess> get copyWith => _$CategoriesStateSuccessCopyWithImpl<CategoriesStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesStateSuccess&&const DeepCollectionEquality().equals(other._categoriesDataList, _categoriesDataList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categoriesDataList));

@override
String toString() {
  return 'CategoriesState.success(categoriesDataList: $categoriesDataList)';
}


}

/// @nodoc
abstract mixin class $CategoriesStateSuccessCopyWith<$Res> implements $CategoriesStateCopyWith<$Res> {
  factory $CategoriesStateSuccessCopyWith(CategoriesStateSuccess value, $Res Function(CategoriesStateSuccess) _then) = _$CategoriesStateSuccessCopyWithImpl;
@useResult
$Res call({
 List<CategoryData?>? categoriesDataList
});




}
/// @nodoc
class _$CategoriesStateSuccessCopyWithImpl<$Res>
    implements $CategoriesStateSuccessCopyWith<$Res> {
  _$CategoriesStateSuccessCopyWithImpl(this._self, this._then);

  final CategoriesStateSuccess _self;
  final $Res Function(CategoriesStateSuccess) _then;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoriesDataList = freezed,}) {
  return _then(CategoriesStateSuccess(
freezed == categoriesDataList ? _self._categoriesDataList : categoriesDataList // ignore: cast_nullable_to_non_nullable
as List<CategoryData?>?,
  ));
}


}

/// @nodoc


class CategoriesStateError implements CategoriesState {
  const CategoriesStateError(this.errorHandler);
  

 final  ErrorHandler errorHandler;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoriesStateErrorCopyWith<CategoriesStateError> get copyWith => _$CategoriesStateErrorCopyWithImpl<CategoriesStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesStateError&&(identical(other.errorHandler, errorHandler) || other.errorHandler == errorHandler));
}


@override
int get hashCode => Object.hash(runtimeType,errorHandler);

@override
String toString() {
  return 'CategoriesState.error(errorHandler: $errorHandler)';
}


}

/// @nodoc
abstract mixin class $CategoriesStateErrorCopyWith<$Res> implements $CategoriesStateCopyWith<$Res> {
  factory $CategoriesStateErrorCopyWith(CategoriesStateError value, $Res Function(CategoriesStateError) _then) = _$CategoriesStateErrorCopyWithImpl;
@useResult
$Res call({
 ErrorHandler errorHandler
});




}
/// @nodoc
class _$CategoriesStateErrorCopyWithImpl<$Res>
    implements $CategoriesStateErrorCopyWith<$Res> {
  _$CategoriesStateErrorCopyWithImpl(this._self, this._then);

  final CategoriesStateError _self;
  final $Res Function(CategoriesStateError) _then;

/// Create a copy of CategoriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorHandler = null,}) {
  return _then(CategoriesStateError(
null == errorHandler ? _self.errorHandler : errorHandler // ignore: cast_nullable_to_non_nullable
as ErrorHandler,
  ));
}


}

// dart format on
