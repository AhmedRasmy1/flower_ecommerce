import '../../data/models/request/update_quantity_request.dart';
import '../entities/cart_item_entity.dart';
import '../../../../core/common/api_result.dart';

abstract class CartRepo {
  Future<Result<List<CartItemEntity>?>> fetchUserCart();
  Future<Result<bool>> updateQuantity({
    required UpdateQuantityRequest updateQuantityRequest,
    required String productId,
  });
  Future<Result<bool>> deleteProduct(String productId);
}
