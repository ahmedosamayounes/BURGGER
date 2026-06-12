import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/web_service.dart';
import '../models/add_cart_response_model.dart';
import '../models/cart_request_model.dart';
import '../models/cart_response_model.dart';

class CartRepo {
  final WebService webService;

  CartRepo(this.webService);
// add the order to db
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
 // get the orders from db 
  Future<ApiResult<CartResponseModel>> getCart() async {
    try {
      final response = await webService.getCart();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  // delete cart
  Future<ApiResult<void>> deleteFromCart(int cartId) async {
    try {
      await webService.deleteFromCart(cartId);
      return ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
