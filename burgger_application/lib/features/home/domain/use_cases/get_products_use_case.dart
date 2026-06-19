import '../../../../../core/networking/api_result.dart';
import '../entities/product_entity.dart';
import '../repositories/products_repository.dart';

class GetProductsUseCase {
  final ProductsRepository repository;

  GetProductsUseCase(this.repository);

  Future<ApiResult<List<ProductEntity>>> call() async {
    return await repository.getProducts();
  }
}