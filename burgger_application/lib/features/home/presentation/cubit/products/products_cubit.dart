import 'package:bloc/bloc.dart';

import '../../../../../core/networking/api_result.dart';
import '../../../domain/use_cases/get_products_use_case.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
 final GetProductsUseCase _getProductsUseCase;
  ProductsCubit(this._getProductsUseCase) : super(const ProductsState.initial());

  void getProduct() async {
    emit(const ProductsState.loading());

    final response = await _getProductsUseCase();
    if (isClosed) return;
    response.when(
      success: (productsEntityList) {
        if (isClosed) return; 
        emit(ProductsState.success(productsEntityList));
      },
      failure: (error) {
        emit(ProductsState.error(error));
      },
    );
  }


}
