import '../models/cart_request_model.dart' as model;
import '../../domain/entities/cart_entity.dart';
import '../../domain/entities/cart_request_entity.dart';
import '../../domain/repositories/cart_repository.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/web_service.dart';


class CartRepoImpl implements CartRepository {
  final WebService webService;

  CartRepoImpl(this.webService);
// add the order to db
  @override
  Future<ApiResult<void>> addToCart(
    CartRequestEntity request,
  ) async {
  try {
      final requestModel = model.CartRequestModel(
        items: request.items
            .map((item) => model.CartItem(
                  productId: item.productId,
                  quantity: item.quantity,
                  spicy: item.spicy,
                  toppings: item.toppings,
                  sideOptions: item.sideOptions,
                ))
            .toList(),
      );
      await webService.addToCart(requestModel);
      return const ApiResult.success(null);
    }catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
 // get the orders from db 
@override
  Future<ApiResult<CartEntity>> getCart() async {
    try {
      final response = await webService.getCart();
      final cartData = response.data;
      
      final cartEntity = CartEntity(
        id: cartData?.id ?? 0,
        totalPrice: double.tryParse(cartData?.totalPrice ?? '') ?? 0.0,
        items: cartData?.items?.map((item) => CartItemEntity(
                  itemId: item.itemId ?? 0,
                  productId: item.productId ?? 0,
                  name: item.name ?? '',
                  image: item.image ?? '',
                  quantity: item.quantity ?? 0,
                  price: double.tryParse(item.price ?? '') ?? 0.0,
                  spicy: item.spicy ?? '',
                  toppings: item.toppings?.map((opt) => CartOptionEntity(
                            id: opt.id ?? 0,
                            name: opt.name ?? '',
                            image: opt.image ?? '',
                          )).toList() ?? [],
                  sideOptions: item.sideOptions?.map((opt) => CartOptionEntity(
                            id: opt.id ?? 0,
                            name: opt.name ?? '',
                            image: opt.image ?? '',
                          )).toList() ?? [],
                )).toList() ?? [],
      );
      return ApiResult.success(cartEntity);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  // delete cart
@override
  Future<ApiResult<void>> deleteFromCart(int cartId) async {
    try {
      await webService.deleteFromCart(cartId);
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
