import '../../../../core/networking/api_result.dart';
import '../repositories/cart_repository.dart';

class DeleteFromCartUseCase {
  final CartRepository repository;

  DeleteFromCartUseCase(this.repository);

  Future<ApiResult<void>> call(int cartId) async {
    return await repository.deleteFromCart(cartId);
  }
}