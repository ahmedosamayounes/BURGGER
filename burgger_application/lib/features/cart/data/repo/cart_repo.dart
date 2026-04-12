import 'package:burgger_application/core/networking/api_error_handler.dart';
import 'package:burgger_application/core/networking/api_result.dart';
import 'package:burgger_application/core/networking/web_service.dart';
import 'package:burgger_application/features/cart/data/models/cart_request_model.dart';
import 'package:burgger_application/features/cart/data/models/cart_response_model.dart';

class CartRepo {
  final WebService webService;

  CartRepo(this.webService);

  Future<ApiResult<AddCartResponseModel>> addToCart(
    CartRequestModel cartRequestModel,
  ) async {
    try {
      final response = await webService.addToCart(cartRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
