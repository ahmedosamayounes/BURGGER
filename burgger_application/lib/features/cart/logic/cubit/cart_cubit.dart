import 'package:bloc/bloc.dart';
import 'package:burgger_application/core/networking/api_result.dart';
import 'package:burgger_application/features/cart/data/models/cart_request_model.dart';
import 'package:burgger_application/features/cart/data/repo/cart_repo.dart';
import 'package:burgger_application/features/cart/logic/cubit/cart_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;
  CartCubit(this.cartRepo) : super(CartState.initial());



  void addToCart(CartRequestModel model) async {

  final response = await cartRepo.addToCart(model);

  response.when(
    success: (_) {
      getCart(); // 🔥 أهم سطر هنا
    },
    failure: (error) {
      emit(CartState.cartError(
        error: error.apiErrorModel.message ?? '',
      ));
    },
  );
}

  void getCart() async {
  emit(const CartState.cartLoading());

  final response = await cartRepo.getCart();

  response.when(
    success: (data) {
      emit(CartState.cartSuccess(data));
    },
    failure: (error) {
      emit(CartState.cartError(
        error: error.apiErrorModel.message ?? '',
      ));
    },
  );
}
}
