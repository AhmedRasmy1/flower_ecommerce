import '../data/models/request/add_to_cart_req_body.dart';
import '../../api_result.dart';

abstract class AddToCartRepo {
  Future<Result<bool>> addProductToCart(AddToCartReqBody addToCartBody);
}
