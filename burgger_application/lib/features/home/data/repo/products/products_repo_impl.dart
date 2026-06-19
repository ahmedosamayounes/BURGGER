import '../../data_sources/products_local_data_source.dart';

import '../../../domain/entities/product_entity.dart';
import '../../../domain/repositories/products_repository.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/web_service.dart';

class ProductsRepoImpl implements ProductsRepository {
  final WebService webService;
  final ProductsLocalDataSource _productsLocalDataSource;
  ProductsRepoImpl(this.webService, this._productsLocalDataSource);
  // data from internet 
  @override
  Future<ApiResult<List<ProductEntity>>> getProducts() async {
    try {
      final response = await webService.getProducts();
      if (response.data != null && response.data!.isNotEmpty) {
        await _productsLocalDataSource.cacheProducts(response.data!);
      }
      final productsList =
          response.data
              ?.map(
                (productData) => ProductEntity(
                  id: productData.id ?? 0,
                  name: productData.name ?? '',
                  description: productData.description ?? '',
                  image: productData.image ?? '',
                  rating: productData.rating ?? '',
                  price: productData.price ?? '',
                ),
              )
              .toList() ??
          [];
      return ApiResult.success(productsList);
    } catch (error) {
      // data from local db
      final localProductsData = _productsLocalDataSource.getCachedProducts();

      if (localProductsData != null && localProductsData.isNotEmpty) {
        final cachedProductsList = localProductsData
            .map(
              (productData) => ProductEntity(
                id: productData.id ?? 0,
                name: productData.name ?? '',
                description: productData.description ?? '',
                image: productData.image ?? '',
                rating: productData.rating ?? '',
                price: productData.price ?? '',
              ),
            )
            .toList();

        return ApiResult.success(cachedProductsList);
      }

      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
