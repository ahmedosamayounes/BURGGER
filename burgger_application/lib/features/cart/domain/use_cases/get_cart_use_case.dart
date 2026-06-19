import '../../../../core/networking/api_result.dart';
import '../entities/cart_entity.dart';
import '../repositories/cart_repository.dart';

class GetCartUseCase {
  final CartRepository repository;

  GetCartUseCase(this.repository);

  Future<ApiResult<CartEntity>> call() async {
    return await repository.getCart();
  }
}