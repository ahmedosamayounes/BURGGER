  import 'package:bloc/bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/models/cart_request_model.dart';
import '../../data/repo/cart_repo.dart';
import 'cart_state.dart';

  class CartCubit extends Cubit<CartState> {
    final CartRepo cartRepo;
    CartCubit(this.cartRepo) : super(CartState.initial());



    void addToCart(CartRequestModel model) async {

    final response = await cartRepo.addToCart(model);
    if (isClosed) return;

    response.when(
      success: (_) {
        if (isClosed) return;
        // data here 
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

    final response = await cartRepo.getCart();
    if (isClosed) return;

    response.when(
      success: (data) {
        if (isClosed) return;
        emit(CartState.cartSuccess(data));
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

      final response = await cartRepo.deleteFromCart(cartId);
  if (isClosed) return;
      response.when(
        success: (_) {
          if (isClosed) return;
          // return data after remove 
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
