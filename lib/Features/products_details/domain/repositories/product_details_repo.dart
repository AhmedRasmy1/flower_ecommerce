import 'package:flower_ecommerce/Features/products_details/domain/entities/product_details_entity.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';

abstract class ProductDetailsRepo {
  Future<Result<ProductDetailsEntity>> getProductDetails(String productId);
}
