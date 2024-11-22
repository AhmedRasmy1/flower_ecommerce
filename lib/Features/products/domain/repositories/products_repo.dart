



import 'package:flower_ecommerce/Features/categories/domain/entities/categories_entities.dart';
import 'package:flower_ecommerce/Features/products/domain/entities/ProductsEntities.dart';

import '../../../../core/common/api_result.dart';

abstract class ProductsRepo{
  Future<Result<AllProductsEntities?>> getAllProducts();



}