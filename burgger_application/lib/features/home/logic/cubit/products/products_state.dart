
import 'package:burgger_application/core/networking/api_error_handler.dart';
import 'package:burgger_application/features/home/data/models/products/products_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_state.freezed.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState.initial() = _Initial;

  const factory ProductsState.loading() = ProductsStateLoading;
  const factory ProductsState.success(List<ProductData?>? productsDataList) = ProductsStateSuccess;
  const factory ProductsState.error(ErrorHandler errorHandler) = ProductsStateError;
}
