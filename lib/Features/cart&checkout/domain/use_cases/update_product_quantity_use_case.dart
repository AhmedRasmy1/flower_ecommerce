import 'package:flower_ecommerce/Features/cart&checkout/data/models/request/update_quantity_request.dart';
import 'package:flower_ecommerce/Features/cart&checkout/domain/repos/cart_repo.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateProductQuantityUseCase {
  final CartRepo _cartRepo;

  UpdateProductQuantityUseCase(this._cartRepo);

  Future<Result<bool>> invoke({
    required UpdateQuantityRequest updateQuantityRequest,
    required String productId,
  }) async {
    return await _cartRepo.updateQuantity(
      updateQuantityRequest: updateQuantityRequest,
      productId: productId,
    );
  }
}
