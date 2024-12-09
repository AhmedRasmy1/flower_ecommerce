import '../entities/cart_item_entity.dart';
import '../repos/cart_repo.dart';
import '../../../../core/common/api_result.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchUserCartUseCase {
  final CartRepo _cartRepo;

  FetchUserCartUseCase(this._cartRepo);

  Future<Result<List<CartItemEntity>?>> invoke() async {
    return await _cartRepo.fetchUserCart();
  }
}
