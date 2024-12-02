import 'package:flower_ecommerce/Features/cart&checkout/domain/entities/cart_item_entity.dart';
import 'package:flower_ecommerce/Features/cart&checkout/domain/repos/cart_repo.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchUserCartUseCase {
  final CartRepo _cartRepo;

  FetchUserCartUseCase(this._cartRepo);

  Future<Result<List<CartItemEntity>?>> invoke() async {
    return await _cartRepo.fetchUserCart();
  }
}
