import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/web_service.dart';
import '../../models/products/products_model.dart';

class ProductsRepo {
  final WebService webService;
  ProductsRepo(this.webService);

  Future<ApiResult<ProductsModel>> getProducts() async {
    try {
      final response = await webService.getProducts();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  



}
