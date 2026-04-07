import 'package:burgger_application/core/networking/api_error_handler.dart';
import 'package:burgger_application/features/home/data/models/categories/categories_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_state.freezed.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial() = _Initial;

  const factory CategoriesState.loading() = CategoriesStateLoading;
  const factory CategoriesState.success(List<CategoryData?>? categoriesDataList) = CategoriesStateSuccess;
  const factory CategoriesState.error(ErrorHandler errorHandler) = CategoriesStateError;
}
