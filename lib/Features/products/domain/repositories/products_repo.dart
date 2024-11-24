import '../entities/products_entities.dart';

import '../../../../core/common/api_result.dart';

abstract class ProductsRepo {
  Future<Result<AllProductsEntities?>> getAllProducts();
}
