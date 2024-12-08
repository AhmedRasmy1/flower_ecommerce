import 'package:flower_ecommerce/Features/address/saved_address/domain/entities/response/address_entity.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';

abstract class AddressRepo {
  Future<Result<AllAddressEntity>> getAddresses(String token);

  Future<Result<AllAddressEntity>> removeAddress(
      String token, String addressId);
}
