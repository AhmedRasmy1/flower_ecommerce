import '../../data/models/request/update_quantity_request.dart';
import '../repos/cart_repo.dart';
import '../../../../core/common/api_result.dart';
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
