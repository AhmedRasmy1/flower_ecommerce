import '../models/request/add_to_cart_req_body.dart';
import '../../../api_result.dart';

abstract class AddToCartOnlineDataSource {
  Future<Result<bool>> addProductToCart(AddToCartReqBody addToCartBody);
}
