import '../../../../core/common/api_result.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/add_address_entity.dart';
import '../../domain/repositories/add_address_repo.dart';
import '../data_sources/add_address_data_source_repo.dart';

@Injectable(as: AddAddressRepo)
class AddAddressRepoImpl implements AddAddressRepo {
  AddAddressDataSourceRepo addressDataSourceRepo;
  AddAddressRepoImpl(this.addressDataSourceRepo);

  @override
  Future<Result<AddAddressEntity?>> addAddressRepo(
      String city, String phone,
      String street, String lat, String long, String username) async {
    return await addressDataSourceRepo.addAddressRepo(
        city, phone, street, lat, long, username);
  }
}
