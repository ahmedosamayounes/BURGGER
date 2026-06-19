import '../../../../../core/networking/api_result.dart';
import '../entities/category_entity.dart';
import '../repositories/categories_repository.dart';

class GetCategoriesUseCase {
  final CategoriesRepository repository;

  GetCategoriesUseCase(this.repository);

  Future<ApiResult<List<CategoryEntity>>> call() async {
    return await repository.getCategories();
  }
}