import '../entities/product_details_entity.dart';
import '../../../../core/common/api_result.dart';

abstract class ProductDetailsRepo {
  Future<Result<ProductDetailsEntity>> getProductDetails(String productId);
}
