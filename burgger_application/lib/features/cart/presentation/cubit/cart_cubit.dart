import 'package:bloc/bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../domain/entities/cart_request_entity.dart';
import '../../domain/use_cases/add_to_cart_use_case.dart';
import '../../domain/use_cases/delete_from_cart_use_case.dart';
import '../../domain/use_cases/get_cart_use_case.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final AddToCartUseCase _addToCartUseCase;
  final GetCartUseCase _getCartUseCase;
  final DeleteFromCartUseCase _deleteFromCartUseCase;

  CartCubit(
    this._addToCartUseCase,
    this._getCartUseCase,
    this._deleteFromCartUseCase,
  ) : super(CartState.initial());

  void addToCart(CartRequestEntity request) async {
    final response = await _addToCartUseCase(request);
    if (isClosed) return;

    response.when(
      success: (_) {
        if (isClosed) return;
        getCart();
      },
      failure: (error) {
        if (isClosed) return;
        emit(CartState.cartError(
          error: error.apiErrorModel.message ?? '',
        ));
      },
    );
  }

  void getCart() async {
    emit(const CartState.cartLoading());

    final response = await _getCartUseCase();
    if (isClosed) return;

    response.when(
      success: (cartEntity) {
        if (isClosed) return;
        emit(CartState.cartSuccess(cartEntity));
      },
      failure: (error) {
        if (isClosed) return;
        emit(CartState.cartError(
          error: error.apiErrorModel.message ?? '',
        ));
      },
    );
  }

  void deleteFromCart(int cartId) async {
    emit(const CartState.cartLoading());

    final response = await _deleteFromCartUseCase(cartId);
    if (isClosed) return;

    response.when(
      success: (_) {
        if (isClosed) return;
        getCart();
      },
      failure: (error) {
        if (isClosed) return;
        emit(CartState.cartError(
          error: error.apiErrorModel.message ?? '',
        ));
      },
    );
  }
}