import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/web_service.dart';
import '../models/product_option/product_option_model.dart';

class SideOptionsRepo {
  final WebService webService;
  SideOptionsRepo(this.webService);

  Future<ApiResult<ProductOptionModel>> getSideOptions() async {
    try {
      final response = await webService.getSideOptions();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}