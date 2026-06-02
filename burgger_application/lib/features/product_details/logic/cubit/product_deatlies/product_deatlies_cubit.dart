import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/networking/api_result.dart';
import '../../../../home/data/repo/product_details/product_details_repo.dart';
import '../../../../home/logic/cubit/products/products_state.dart';

class ProductDetailsCubit extends Cubit<ProductsState> {
  final ProductDetailsRepo productDetailssRepo;
  List<int> selectedToppings = [];
  List<int> selectedSides = [];
  void toggleTopping(int toppingId) {
    final newList = List<int>.from(selectedToppings);

    if (newList.contains(toppingId)) {
      newList.remove(toppingId);
    } else {
      newList.add(toppingId);
    }

    selectedToppings = newList;
    if (isClosed) return;
    state.maybeWhen(
      productDetailsSuccess: (data) {
        emit(ProductsState.productDetailsSuccess(data));
      },
      orElse: () {},
    );
  }

  void sideOptionToggle(int sideOptionId) {
    final newList = List<int>.from(selectedSides);

    if (newList.contains(sideOptionId)) {
      newList.remove(sideOptionId);
    } else {
      newList.add(sideOptionId);
    }

    selectedSides = newList;
    if (isClosed) return;
    state.maybeWhen(
      productDetailsSuccess: (data) {
        emit(ProductsState.productDetailsSuccess(data));
      },
      orElse: () {},
    );
  }

  void clearSelections() {
    selectedToppings.clear();
    selectedSides.clear();
  }

  ProductDetailsCubit(this.productDetailssRepo)
    : super(const ProductsState.initial());

  void getProductById(int id) async {
    emit(const ProductsState.loading());

    final response = await productDetailssRepo.getProductByid(id);
    if (isClosed) return;
    response.when(
      success: (productsModel) {
        emit(ProductsState.productDetailsSuccess(productsModel));
      },
      failure: (error) {
        emit(ProductsState.error(error));
      },
    );
  }
}
