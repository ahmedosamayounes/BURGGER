import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/web_service.dart';
import '../../models/categories/categories_model.dart';

class CategoriesRepo {
  final WebService webService;
  CategoriesRepo(this.webService);

  Future<ApiResult<CategoriesModel>> getCategories() async {
    try {
      final response = await webService.getCategories();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
