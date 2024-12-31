import '../../data/models/response/checkout/address_response.dart';

import '../../../../core/common/api_result.dart';

abstract class CheckoutRepo {
  Future<Result<AddressResponse?>> getUserAddresses(String token);
}
