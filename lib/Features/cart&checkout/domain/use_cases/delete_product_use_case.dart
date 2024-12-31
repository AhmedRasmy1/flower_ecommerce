import '../repos/cart_repo.dart';
import '../../../../core/common/api_result.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteProductUseCase {
  final CartRepo _cartRepo;

  DeleteProductUseCase(this._cartRepo);

  Future<Result<bool>> invoke(
    String productId,
  ) async {
    return await _cartRepo.deleteProduct(productId);
  }
}
