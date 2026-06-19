import '../../../../core/networking/api_result.dart';
import '../entities/cart_entity.dart';
import '../entities/cart_request_entity.dart';

abstract class CartRepository {
  Future<ApiResult<void>> addToCart(CartRequestEntity request);
  Future<ApiResult<CartEntity>> getCart();
  Future<ApiResult<void>> deleteFromCart(int cartId);
}