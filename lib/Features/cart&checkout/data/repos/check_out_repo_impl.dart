import '../models/response/checkout/address_response.dart';
import '../../../../core/common/api_result.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repos/checkout_repo.dart';
import '../contracts/checkout_online_datasource.dart';

@Injectable(as: CheckoutRepo)
class CheckoutRepoImpl implements CheckoutRepo {
  final CheckoutOnlineDataSource _checkoutOnlineDataSource;

  CheckoutRepoImpl(this._checkoutOnlineDataSource);

  @override
  Future<Result<AddressResponse?>> getUserAddresses(String token) async {
    return await _checkoutOnlineDataSource.getUserAddresses(token);
  }
}
