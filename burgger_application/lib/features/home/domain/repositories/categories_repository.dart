import '../../../../../core/networking/api_result.dart';
import '../entities/category_entity.dart';

abstract class CategoriesRepository {
  Future<ApiResult<List<CategoryEntity>>> getCategories();
}