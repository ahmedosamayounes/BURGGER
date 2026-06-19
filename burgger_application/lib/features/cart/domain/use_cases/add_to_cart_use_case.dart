import '../../../../core/networking/api_result.dart';
import '../entities/cart_request_entity.dart';
import '../repositories/cart_repository.dart';

class AddToCartUseCase {
  final CartRepository repository;

  AddToCartUseCase(this.repository);

  Future<ApiResult<void>> call(CartRequestEntity request) async {
    return await repository.addToCart(request);
  }
}
