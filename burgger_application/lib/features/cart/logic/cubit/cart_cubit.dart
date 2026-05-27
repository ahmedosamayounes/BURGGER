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
      getCart(); // 🔥 أهم سطر هنا
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
        getCart(); // 🔥 إعادة جلب بيانات الكارت بعد الحذف
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
