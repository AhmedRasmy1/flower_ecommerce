import '../../../../core/common/api_result.dart';
import '../entities/add_address_entity.dart';

abstract class AddAddressRepo {
  Future<Result<AddAddressEntity?>> addAddressRepo(
      String city, String phone, String street);
}
