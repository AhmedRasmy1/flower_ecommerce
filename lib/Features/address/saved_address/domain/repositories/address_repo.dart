import '../entities/response/address_entity.dart';
import '../../../../../core/common/api_result.dart';

abstract class AddressRepo {
  Future<Result<AllAddressEntity>> getAddresses(String token);

  Future<Result<AllAddressEntity>> removeAddress(
      String token, String addressId);
}
