import '../../domain/entities/response/address_entity.dart';
import '../../domain/repositories/address_repo.dart';
import '../../../../../core/common/api_result.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/online_data_source/address_online_data_source.dart';

@Injectable(as: AddressRepo)
class AddressRepoImpl extends AddressRepo {
  AddressOnlineDataSource onLineDataSource;

  AddressRepoImpl(
    this.onLineDataSource,
  );

  @override
  Future<Result<AllAddressEntity>> getAddresses(String token) {
    return onLineDataSource.getAddresses(token);
  }

  @override
  Future<Result<AllAddressEntity>> removeAddress(
      String token, String addressId) {
    return onLineDataSource.removeAddress(token, addressId);
  }
}
