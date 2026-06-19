import 'package:hive/hive.dart';

import '../models/products/products_model.dart';

class ProductsLocalDataSource {
  final Box _homeBox;
  final String _cacheKey = 'cached_products_list';

  ProductsLocalDataSource(this._homeBox);

  Future<void> cacheProducts(List<ProductData> products) async {
    await _homeBox.put(_cacheKey, products);
  } 

  List<ProductData>? getCachedProducts() {
    final List<dynamic>? rawData = _homeBox.get(_cacheKey);
    if (rawData != null) {
      return List<ProductData>.from(rawData);
    }
    return null;
  }
}