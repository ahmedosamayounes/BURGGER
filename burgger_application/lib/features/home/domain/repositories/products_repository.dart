import '../../../../../core/networking/api_result.dart';
import '../entities/product_entity.dart';

abstract class ProductsRepository {
  Future<ApiResult<List<ProductEntity>>> getProducts();
}