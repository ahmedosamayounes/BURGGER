
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../domain/entities/product_entity.dart';

part 'products_state.freezed.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState.initial() = _Initial;

  const factory ProductsState.loading() = ProductsStateLoading;
  const factory ProductsState.success(List<ProductEntity> productsDataList) = ProductsStateSuccess;
  const factory ProductsState.error(ErrorHandler errorHandler) = ProductsStateError;
  const factory ProductsState.selectionChanged() = SelectionChanged;
}
