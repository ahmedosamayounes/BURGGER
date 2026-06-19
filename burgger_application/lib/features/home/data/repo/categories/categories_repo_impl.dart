import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/web_service.dart';
import '../../../domain/entities/category_entity.dart';
import '../../../domain/repositories/categories_repository.dart';

class CategoriesRepoImpl implements CategoriesRepository {
  final WebService webService;
  CategoriesRepoImpl(this.webService);

  @override
  Future<ApiResult<List<CategoryEntity>>> getCategories() async {
    try {
      final response = await webService.getCategories();
      final categoriesList =
          response.data
              ?.map(
                (categoryData) => CategoryEntity(
                  id: categoryData.id ?? 0,
                  name: categoryData.name ?? '',
                ),
              )
              .toList() ??
          [];
      return ApiResult.success(categoriesList);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
