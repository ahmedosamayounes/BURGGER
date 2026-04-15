import 'package:burgger_application/core/networking/api_result.dart';
import 'package:burgger_application/features/home/data/repo/product_details/product_details_repo.dart';
import 'package:burgger_application/features/home/logic/cubit/products/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDeatliesCubit extends Cubit<ProductsState> {
  final ProductDetailsRepo productDeatliesRepo;
  List<int> selectedToppings = [];
  List<int> selectedSides = [];
  void toggleTopping(int topping) {
    if (selectedToppings.contains(topping)) {
      selectedToppings.remove(topping);
    } else {
      selectedToppings.add(topping);
    }
  emit(state); // ده كفاية


  }

  void clearSelections() {
    selectedToppings.clear();
    selectedSides.clear();
  }

  ProductDeatliesCubit(this.productDeatliesRepo)
    : super(const ProductsState.initial());

  void getProductById(int id) async {
    emit(const ProductsState.loading());

    final response = await productDeatliesRepo.getProductByid(id);
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
