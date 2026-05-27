
import '../../../../../core/networking/api_error_handler.dart';
import '../../../data/models/products/products_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_state.freezed.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState.initial() = _Initial;

  const factory ProductsState.loading() = ProductsStateLoading;
  const factory ProductsState.success(List<ProductData?>? productsDataList) = ProductsStateSuccess;
  const factory ProductsState.productDetailsSuccess(ProductData productData) = ProductDetailsSuccess;
  const factory ProductsState.error(ErrorHandler errorHandler) = ProductsStateError;
  const factory ProductsState.selectionChanged() = SelectionChanged;
}
