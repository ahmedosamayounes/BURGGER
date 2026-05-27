import 'package:bloc/bloc.dart';

import '../../../../../core/networking/api_result.dart';
import '../../../data/repo/products/products_repo.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepo productsRepo;
  ProductsCubit(this.productsRepo) : super(ProductsState.initial());

  void getProduct() async {
    emit(const ProductsState.loading());

    final response = await productsRepo.getProducts();
    if (isClosed) return;
    response.when(
      success: (productsModel) {
        if (isClosed) return; 
        emit(ProductsState.success(productsModel.data));
      },
      failure: (error) {
        emit(ProductsState.error(error));
      },
    );
  }


}
