import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/cart_entity.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;

  const factory CartState.cartLoading() = CartLoading;

  const factory CartState.cartSuccess(CartEntity  data) = CartSuccess;

  const factory CartState.cartError({required String error}) = CartError;
}
