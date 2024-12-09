import '../../../../core/common/api_result.dart';
import '../../domain/entities/add_address_entity.dart';

abstract class AddAddressDataSourceRepo {
  Future<Result<AddAddressEntity?>> addAddressRepo(
      String city, String phone, String street);
}
