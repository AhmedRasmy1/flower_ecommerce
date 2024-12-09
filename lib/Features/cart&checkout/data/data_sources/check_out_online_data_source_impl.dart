import '../models/response/checkout/address_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager/api_manager.dart';
import '../../../../core/common/api_result.dart';
import '../contracts/checkout_online_datasource.dart';

@Injectable(as: CheckoutOnlineDataSource)
class CheckoutOnlineDataSourceImpl implements CheckoutOnlineDataSource {
  final ApiService _apiService;

  CheckoutOnlineDataSourceImpl(this._apiService);
  @override
  Future<Result<AddressResponse?>> getUserAddresses(String token) async {
    return executeApi(() async {
      var response = await _apiService.getUserAddresses(token);
      return response;
    });
  }
}
