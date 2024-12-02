import 'package:flower_ecommerce/Features/cart&checkout/data/models/request/update_quantity_request.dart';
import 'package:flower_ecommerce/Features/cart&checkout/domain/entities/cart_item_entity.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';

abstract class CartRepo {
  Future<Result<List<CartItemEntity>?>> fetchUserCart();
  Future<Result<bool>> updateQuantity({
    required UpdateQuantityRequest updateQuantityRequest,
    required String productId,
  });
  Future<Result<bool>> deleteProduct(String productId);
}
