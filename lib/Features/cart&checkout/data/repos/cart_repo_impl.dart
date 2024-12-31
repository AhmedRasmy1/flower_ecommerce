import '../contracts/cart_online_data_source.dart';
import '../models/request/update_quantity_request.dart';
import '../../domain/entities/cart_item_entity.dart';
import '../../domain/repos/cart_repo.dart';
import '../../../../core/common/api_result.dart';
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
