import 'package:burgger_application/core/networking/api_result.dart';
import 'package:burgger_application/features/home/data/repo/product_details/product_details_repo.dart';
import 'package:burgger_application/features/home/logic/cubit/products/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDeatliesCubit extends Cubit<ProductsState> {
  final ProductDetailsRepo productDeatliesRepo;
  List<int> selectedToppings = [];
  List<int> selectedSides = [];
  void toggleTopping(int toppingId) {
    // ❌ الطريقة دي غلط (بتعدل في نفس المكان في الذاكرة)
    // selectedToppings.add(toppingId);

    // ✅ الطريقة دي صح (بتعمل قائمة جديدة تماماً)
    final newList = List<int>.from(selectedToppings);

    if (newList.contains(toppingId)) {
      newList.remove(toppingId);
    } else {
      newList.add(toppingId);
    }

    selectedToppings = newList; // بنحدث المتغير الأصلي بالنسخة الجديدة

    // 🔥 هنا بنعمل emit لحالة جديدة
    state.maybeWhen(
      productDetailsSuccess: (data) {
        // إرسال الحالة من جديد بيخلي context.watch() تحس بالتغيير
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
