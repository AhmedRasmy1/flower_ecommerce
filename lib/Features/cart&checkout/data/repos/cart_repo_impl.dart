import 'package:flower_ecommerce/Features/cart&checkout/data/contracts/cart_online_data_source.dart';
import 'package:flower_ecommerce/Features/cart&checkout/data/models/request/update_quantity_request.dart';
import 'package:flower_ecommerce/Features/cart&checkout/domain/entities/cart_item_entity.dart';
import 'package:flower_ecommerce/Features/cart&checkout/domain/repos/cart_repo.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepo)
class CartRepoImpl implements CartRepo {
  final CartOnlineDataSource _cartOnlineDataSource;

  CartRepoImpl(this._cartOnlineDataSource);
  @override
  Future<Result<List<CartItemEntity>?>> fetchUserCart() async {
    return await _cartOnlineDataSource.fetchUserCart();
  }

  @override
  Future<Result<bool>> updateQuantity(
      {required UpdateQuantityRequest updateQuantityRequest,
      required String productId}) async {
    return await _cartOnlineDataSource.updateQuantity(
      updateQuantityRequest: updateQuantityRequest,
      productId: productId,
    );
  }

  @override
  Future<Result<bool>> deleteProduct(String productId) async {
    return await _cartOnlineDataSource.deleteProduct(productId);
  }
}
