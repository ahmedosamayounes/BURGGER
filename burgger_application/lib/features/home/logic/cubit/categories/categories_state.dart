import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../data/models/categories/categories_model.dart';

part 'categories_state.freezed.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial() = _Initial;

  const factory CategoriesState.loading() = CategoriesStateLoading;
  const factory CategoriesState.success(List<CategoryData?>? categoriesDataList) = CategoriesStateSuccess;
  const factory CategoriesState.error(ErrorHandler errorHandler) = CategoriesStateError;
}
