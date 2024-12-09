import '../data/models/request/add_to_cart_req_body.dart';
import 'add_to_cart_repo.dart';
import '../../api_result.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartUseCase {
  final AddToCartRepo _addToCartRepo;

  AddToCartUseCase(this._addToCartRepo);

  Future<Result<bool>> invoke(AddToCartReqBody addToCartBody) async {
    return await _addToCartRepo.addProductToCart(addToCartBody);
  }
}
