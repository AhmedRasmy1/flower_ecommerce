


import '../../../../core/common/api_result.dart';
import '../../domain/entities/add_address_entity.dart';
import '../models/request/add_address_model.dart';

abstract class AddAddressDataSourceRepo {

  Future<Result<AddAddressEntity?>> addAddressRepo(
      String city ,String phone ,String street);
}
