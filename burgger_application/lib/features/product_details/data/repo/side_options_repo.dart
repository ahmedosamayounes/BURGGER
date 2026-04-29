import 'package:burgger_application/core/networking/api_error_handler.dart';
import 'package:burgger_application/core/networking/api_result.dart';
import 'package:burgger_application/core/networking/web_service.dart';
import 'package:burgger_application/features/product_details/data/models/product_option/product_option_model.dart';

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