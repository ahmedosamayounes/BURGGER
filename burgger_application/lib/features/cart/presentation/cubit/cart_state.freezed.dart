// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CartState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartState()';
}


}

/// @nodoc
class $CartStateCopyWith<$Res>  {
$CartStateCopyWith(CartState _, $Res Function(CartState) __);
}


/// Adds pattern-matching-related methods to [CartState].
extension CartStatePatterns on CartState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( CartLoading value)?  cartLoading,TResult Function( CartSuccess value)?  cartSuccess,TResult Function( CartError value)?  cartError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case CartLoading() when cartLoading != null:
return cartLoading(_that);case CartSuccess() when cartSuccess != null:
return cartSuccess(_that);case CartError() when cartError != null:
return cartError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( CartLoading value)  cartLoading,required TResult Function( CartSuccess value)  cartSuccess,required TResult Function( CartError value)  cartError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case CartLoading():
return cartLoading(_that);case CartSuccess():
return cartSuccess(_that);case CartError():
return cartError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( CartLoading value)?  cartLoading,TResult? Function( CartSuccess value)?  cartSuccess,TResult? Function( CartError value)?  cartError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case CartLoading() when cartLoading != null:
return cartLoading(_that);case CartSuccess() when cartSuccess != null:
return cartSuccess(_that);case CartError() when cartError != null:
return cartError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  cartLoading,TResult Function( CartEntity data)?  cartSuccess,TResult Function( String error)?  cartError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case CartLoading() when cartLoading != null:
return cartLoading();case CartSuccess() when cartSuccess != null:
return cartSuccess(_that.data);case CartError() when cartError != null:
return cartError(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  cartLoading,required TResult Function( CartEntity data)  cartSuccess,required TResult Function( String error)  cartError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case CartLoading():
return cartLoading();case CartSuccess():
return cartSuccess(_that.data);case CartError():
return cartError(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  cartLoading,TResult? Function( CartEntity data)?  cartSuccess,TResult? Function( String error)?  cartError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case CartLoading() when cartLoading != null:
return cartLoading();case CartSuccess() when cartSuccess != null:
return cartSuccess(_that.data);case CartError() when cartError != null:
return cartError(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CartState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartState.initial()';
}


}




/// @nodoc


class CartLoading implements CartState {
  const CartLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartState.cartLoading()';
}


}




/// @nodoc


class CartSuccess implements CartState {
  const CartSuccess(this.data);
  

 final  CartEntity data;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartSuccessCopyWith<CartSuccess> get copyWith => _$CartSuccessCopyWithImpl<CartSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'CartState.cartSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $CartSuccessCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory $CartSuccessCopyWith(CartSuccess value, $Res Function(CartSuccess) _then) = _$CartSuccessCopyWithImpl;
@useResult
$Res call({
 CartEntity data
});




}
/// @nodoc
class _$CartSuccessCopyWithImpl<$Res>
    implements $CartSuccessCopyWith<$Res> {
  _$CartSuccessCopyWithImpl(this._self, this._then);

  final CartSuccess _self;
  final $Res Function(CartSuccess) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(CartSuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CartEntity,
  ));
}


}

/// @nodoc


class CartError implements CartState {
  const CartError({required this.error});
  

 final  String error;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartErrorCopyWith<CartError> get copyWith => _$CartErrorCopyWithImpl<CartError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'CartState.cartError(error: $error)';
}


}

/// @nodoc
abstract mixin class $CartErrorCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory $CartErrorCopyWith(CartError value, $Res Function(CartError) _then) = _$CartErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$CartErrorCopyWithImpl<$Res>
    implements $CartErrorCopyWith<$Res> {
  _$CartErrorCopyWithImpl(this._self, this._then);

  final CartError _self;
  final $Res Function(CartError) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(CartError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
