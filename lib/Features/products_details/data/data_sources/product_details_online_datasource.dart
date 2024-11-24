import '../../domain/entities/product_details_entity.dart';
import '../../../../core/common/api_result.dart';

abstract class ProductDetailsOnlineDataSource {
  Future<Result<ProductDetailsEntity>> getProductDetails(String productId);
}
