import '../../data/models/response/checkout/address_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../repos/checkout_repo.dart';

@injectable
class CheckoutUseCase {
  CheckoutRepo checkoutRepo;

  CheckoutUseCase(this.checkoutRepo);

  Future<Result<AddressResponse?>> getUserAddresses(String token) {
    return checkoutRepo.getUserAddresses(token);
  }
}
