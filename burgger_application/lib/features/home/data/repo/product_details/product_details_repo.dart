import 'package:burgger_application/core/networking/api_error_handler.dart';
import 'package:burgger_application/core/networking/api_result.dart';
import 'package:burgger_application/core/networking/web_service.dart';
import 'package:burgger_application/features/home/data/models/products/products_model.dart';

class ProductDetailsRepo {
  final WebService webService;
  ProductDetailsRepo(this.webService);

  Future<ApiResult<ProductData>> getProductByid(int id) async {
    try {
      final response = await webService.getProductById(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
