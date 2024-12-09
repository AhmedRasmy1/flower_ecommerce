import 'package:flower_ecommerce/Features/add_address/data/models/request/add_address_model.dart';

import '../../../../core/common/api_result.dart';
import '../entities/add_address_entity.dart';

abstract class AddAddressRepo {
  Future<Result<AddAddressEntity?>> addAddressRepo(
      String city ,String phone ,String street);
}
