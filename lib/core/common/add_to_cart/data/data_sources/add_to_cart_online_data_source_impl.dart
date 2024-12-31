import '../../../../api/api_extentions.dart';
import '../../../../api/api_manager/api_manager.dart';
import '../contracts/add_to_cart_online_data_source.dart';
import '../models/request/add_to_cart_req_body.dart';
import '../../../api_result.dart';
import '../../../../utils/cashed_data_shared_preferences.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddToCartOnlineDataSource)
class AddToCartOnlineDataSourceImpl implements AddToCartOnlineDataSource {
  final ApiService _apiService;

  AddToCartOnlineDataSourceImpl(this._apiService);

  @override
  Future<Result<bool>> addProductToCart(AddToCartReqBody addToCartBody) async {
    return await executeApi<bool>(
      () async {
        final cachedToken = CacheService.getData(key: CacheConstants.userToken);
        final addResponse = await _apiService.addProductToCart(
          addToCartBody,
          "Bearer $cachedToken",
        );
        return addResponse?.message == "success";
      },
    );
  }
}
