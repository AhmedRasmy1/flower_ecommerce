import '../entities/response/address_entity.dart';
import '../repositories/address_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/common/api_result.dart';

@injectable
class AddressUseCases {
  AddressRepo addressRepo;

  AddressUseCases(this.addressRepo);

  Future<Result<AllAddressEntity>> getAddresses(String token) {
    return addressRepo.getAddresses(token);
  }

  Future<Result<AllAddressEntity>> removeAddress(
      String token, String addressId) {
    return addressRepo.removeAddress(token, addressId);
  }
}
