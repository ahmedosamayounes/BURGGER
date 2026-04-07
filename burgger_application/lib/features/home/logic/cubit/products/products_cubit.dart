import 'package:bloc/bloc.dart';
import 'package:burgger_application/core/networking/api_error_handler.dart';
import 'package:burgger_application/core/networking/api_result.dart';
import 'package:burgger_application/features/home/data/models/products/products_model.dart';
import 'package:burgger_application/features/home/data/repo/products/products_repo.dart';
import 'package:burgger_application/features/home/logic/cubit/categories/categories_state.dart';
import 'package:burgger_application/features/home/logic/cubit/products/products_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepo productsRepo;
  ProductsCubit(this.productsRepo) : super(ProductsState.initial());

  void getProduct() async {
    emit(const ProductsState.loading());

    final response = await productsRepo.getProducts();
    response.when(
      success: (productsModel) {
        emit(ProductsState.success(productsModel.data));
      },
      failure: (error) {
        emit(ProductsState.error(error));
      },
    );
    

    
  }
}
