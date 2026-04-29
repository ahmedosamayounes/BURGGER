// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductsState()';
}


}

/// @nodoc
class $ProductsStateCopyWith<$Res>  {
$ProductsStateCopyWith(ProductsState _, $Res Function(ProductsState) __);
}


/// Adds pattern-matching-related methods to [ProductsState].
extension ProductsStatePatterns on ProductsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( ProductsStateLoading value)?  loading,TResult Function( ProductsStateSuccess value)?  success,TResult Function( ProductDetailsSuccess value)?  productDetailsSuccess,TResult Function( ProductsStateError value)?  error,TResult Function( SelectionChanged value)?  selectionChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case ProductsStateLoading() when loading != null:
return loading(_that);case ProductsStateSuccess() when success != null:
return success(_that);case ProductDetailsSuccess() when productDetailsSuccess != null:
return productDetailsSuccess(_that);case ProductsStateError() when error != null:
return error(_that);case SelectionChanged() when selectionChanged != null:
return selectionChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( ProductsStateLoading value)  loading,required TResult Function( ProductsStateSuccess value)  success,required TResult Function( ProductDetailsSuccess value)  productDetailsSuccess,required TResult Function( ProductsStateError value)  error,required TResult Function( SelectionChanged value)  selectionChanged,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case ProductsStateLoading():
return loading(_that);case ProductsStateSuccess():
return success(_that);case ProductDetailsSuccess():
return productDetailsSuccess(_that);case ProductsStateError():
return error(_that);case SelectionChanged():
return selectionChanged(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( ProductsStateLoading value)?  loading,TResult? Function( ProductsStateSuccess value)?  success,TResult? Function( ProductDetailsSuccess value)?  productDetailsSuccess,TResult? Function( ProductsStateError value)?  error,TResult? Function( SelectionChanged value)?  selectionChanged,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case ProductsStateLoading() when loading != null:
return loading(_that);case ProductsStateSuccess() when success != null:
return success(_that);case ProductDetailsSuccess() when productDetailsSuccess != null:
return productDetailsSuccess(_that);case ProductsStateError() when error != null:
return error(_that);case SelectionChanged() when selectionChanged != null:
return selectionChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ProductData?>? productsDataList)?  success,TResult Function( ProductData productData)?  productDetailsSuccess,TResult Function( ErrorHandler errorHandler)?  error,TResult Function()?  selectionChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case ProductsStateLoading() when loading != null:
return loading();case ProductsStateSuccess() when success != null:
return success(_that.productsDataList);case ProductDetailsSuccess() when productDetailsSuccess != null:
return productDetailsSuccess(_that.productData);case ProductsStateError() when error != null:
return error(_that.errorHandler);case SelectionChanged() when selectionChanged != null:
return selectionChanged();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ProductData?>? productsDataList)  success,required TResult Function( ProductData productData)  productDetailsSuccess,required TResult Function( ErrorHandler errorHandler)  error,required TResult Function()  selectionChanged,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case ProductsStateLoading():
return loading();case ProductsStateSuccess():
return success(_that.productsDataList);case ProductDetailsSuccess():
return productDetailsSuccess(_that.productData);case ProductsStateError():
return error(_that.errorHandler);case SelectionChanged():
return selectionChanged();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ProductData?>? productsDataList)?  success,TResult? Function( ProductData productData)?  productDetailsSuccess,TResult? Function( ErrorHandler errorHandler)?  error,TResult? Function()?  selectionChanged,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case ProductsStateLoading() when loading != null:
return loading();case ProductsStateSuccess() when success != null:
return success(_that.productsDataList);case ProductDetailsSuccess() when productDetailsSuccess != null:
return productDetailsSuccess(_that.productData);case ProductsStateError() when error != null:
return error(_that.errorHandler);case SelectionChanged() when selectionChanged != null:
return selectionChanged();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ProductsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductsState.initial()';
}


}




/// @nodoc


class ProductsStateLoading implements ProductsState {
  const ProductsStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductsState.loading()';
}


}




/// @nodoc


class ProductsStateSuccess implements ProductsState {
  const ProductsStateSuccess(final  List<ProductData?>? productsDataList): _productsDataList = productsDataList;
  

 final  List<ProductData?>? _productsDataList;
 List<ProductData?>? get productsDataList {
  final value = _productsDataList;
  if (value == null) return null;
  if (_productsDataList is EqualUnmodifiableListView) return _productsDataList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsStateSuccessCopyWith<ProductsStateSuccess> get copyWith => _$ProductsStateSuccessCopyWithImpl<ProductsStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsStateSuccess&&const DeepCollectionEquality().equals(other._productsDataList, _productsDataList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_productsDataList));

@override
String toString() {
  return 'ProductsState.success(productsDataList: $productsDataList)';
}


}

/// @nodoc
abstract mixin class $ProductsStateSuccessCopyWith<$Res> implements $ProductsStateCopyWith<$Res> {
  factory $ProductsStateSuccessCopyWith(ProductsStateSuccess value, $Res Function(ProductsStateSuccess) _then) = _$ProductsStateSuccessCopyWithImpl;
@useResult
$Res call({
 List<ProductData?>? productsDataList
});




}
/// @nodoc
class _$ProductsStateSuccessCopyWithImpl<$Res>
    implements $ProductsStateSuccessCopyWith<$Res> {
  _$ProductsStateSuccessCopyWithImpl(this._self, this._then);

  final ProductsStateSuccess _self;
  final $Res Function(ProductsStateSuccess) _then;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productsDataList = freezed,}) {
  return _then(ProductsStateSuccess(
freezed == productsDataList ? _self._productsDataList : productsDataList // ignore: cast_nullable_to_non_nullable
as List<ProductData?>?,
  ));
}


}

/// @nodoc


class ProductDetailsSuccess implements ProductsState {
  const ProductDetailsSuccess(this.productData);
  

 final  ProductData productData;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDetailsSuccessCopyWith<ProductDetailsSuccess> get copyWith => _$ProductDetailsSuccessCopyWithImpl<ProductDetailsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailsSuccess&&(identical(other.productData, productData) || other.productData == productData));
}


@override
int get hashCode => Object.hash(runtimeType,productData);

@override
String toString() {
  return 'ProductsState.productDetailsSuccess(productData: $productData)';
}


}

/// @nodoc
abstract mixin class $ProductDetailsSuccessCopyWith<$Res> implements $ProductsStateCopyWith<$Res> {
  factory $ProductDetailsSuccessCopyWith(ProductDetailsSuccess value, $Res Function(ProductDetailsSuccess) _then) = _$ProductDetailsSuccessCopyWithImpl;
@useResult
$Res call({
 ProductData productData
});




}
/// @nodoc
class _$ProductDetailsSuccessCopyWithImpl<$Res>
    implements $ProductDetailsSuccessCopyWith<$Res> {
  _$ProductDetailsSuccessCopyWithImpl(this._self, this._then);

  final ProductDetailsSuccess _self;
  final $Res Function(ProductDetailsSuccess) _then;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productData = null,}) {
  return _then(ProductDetailsSuccess(
null == productData ? _self.productData : productData // ignore: cast_nullable_to_non_nullable
as ProductData,
  ));
}


}

/// @nodoc


class ProductsStateError implements ProductsState {
  const ProductsStateError(this.errorHandler);
  

 final  ErrorHandler errorHandler;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsStateErrorCopyWith<ProductsStateError> get copyWith => _$ProductsStateErrorCopyWithImpl<ProductsStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsStateError&&(identical(other.errorHandler, errorHandler) || other.errorHandler == errorHandler));
}


@override
int get hashCode => Object.hash(runtimeType,errorHandler);

@override
String toString() {
  return 'ProductsState.error(errorHandler: $errorHandler)';
}


}

/// @nodoc
abstract mixin class $ProductsStateErrorCopyWith<$Res> implements $ProductsStateCopyWith<$Res> {
  factory $ProductsStateErrorCopyWith(ProductsStateError value, $Res Function(ProductsStateError) _then) = _$ProductsStateErrorCopyWithImpl;
@useResult
$Res call({
 ErrorHandler errorHandler
});




}
/// @nodoc
class _$ProductsStateErrorCopyWithImpl<$Res>
    implements $ProductsStateErrorCopyWith<$Res> {
  _$ProductsStateErrorCopyWithImpl(this._self, this._then);

  final ProductsStateError _self;
  final $Res Function(ProductsStateError) _then;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorHandler = null,}) {
  return _then(ProductsStateError(
null == errorHandler ? _self.errorHandler : errorHandler // ignore: cast_nullable_to_non_nullable
as ErrorHandler,
  ));
}


}

/// @nodoc


class SelectionChanged implements ProductsState {
  const SelectionChanged();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectionChanged);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductsState.selectionChanged()';
}


}




// dart format on
