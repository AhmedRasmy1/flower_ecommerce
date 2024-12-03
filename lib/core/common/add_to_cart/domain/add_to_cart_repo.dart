import 'package:flower_ecommerce/core/common/add_to_cart/data/models/request/add_to_cart_req_body.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';

abstract class AddToCartRepo {
  Future<Result<bool>> addProductToCart(AddToCartReqBody addToCartBody);
}
