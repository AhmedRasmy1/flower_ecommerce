import '../contracts/add_to_cart_online_data_source.dart';
import '../models/request/add_to_cart_req_body.dart';
import '../../domain/add_to_cart_repo.dart';
import '../../../api_result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddToCartRepo)
class AddToCartRepoImpl implements AddToCartRepo {
  final AddToCartOnlineDataSource _addToCartOnlineDataSource;

  AddToCartRepoImpl(this._addToCartOnlineDataSource);

  @override
  Future<Result<bool>> addProductToCart(AddToCartReqBody addToCartBody) async {
    return await _addToCartOnlineDataSource.addProductToCart(addToCartBody);
  }
}
