import 'package:burgger_application/features/cart/data/models/cart_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;

  const factory CartState.cartLoading() = CartLoading;

  const factory CartState.cartSuccess(CartResponseModel  data) = CartSuccess;

  const factory CartState.cartError({required String error}) = CartError;
}
