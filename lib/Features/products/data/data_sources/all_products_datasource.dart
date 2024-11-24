import '../../domain/entities/products_entities.dart';

import '../../../../core/common/api_result.dart';

abstract class AllProductsDatasource {
  Future<Result<AllProductsEntities?>> getAllProducts();
}
