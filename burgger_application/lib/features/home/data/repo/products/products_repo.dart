import 'package:burgger_application/core/networking/api_error_handler.dart';
import 'package:burgger_application/core/networking/api_result.dart';
import 'package:burgger_application/core/networking/web_service.dart';
import 'package:burgger_application/features/home/data/models/products/products_model.dart';

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
