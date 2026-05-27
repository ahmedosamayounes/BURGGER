import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/web_service.dart';
import '../models/product_option/product_option_model.dart';

class ToppingsRepo {
  final WebService webService;
  ToppingsRepo(this.webService);

  Future<ApiResult<ProductOptionModel>> getToppings() async {
    try {
      final response = await webService.getToppings();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
