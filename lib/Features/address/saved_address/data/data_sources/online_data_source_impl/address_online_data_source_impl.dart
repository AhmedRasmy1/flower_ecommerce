import '../../../domain/entities/response/address_entity.dart';
import '../../../../../../core/api/api_extentions.dart';
import '../../../../../../core/api/api_manager/api_manager.dart';
import '../../../../../../core/common/api_result.dart';
import 'package:injectable/injectable.dart';
import '../online_data_source/address_online_data_source.dart';

@Injectable(as: AddressOnlineDataSource)
class AddressOnlineDataSourceImpl extends AddressOnlineDataSource {
  final ApiService _addressRetrofit;

  AddressOnlineDataSourceImpl(this._addressRetrofit);

  @override
  Future<Result<AllAddressEntity>> getAddresses(String token) {
    return executeApi(() async {
      var response = await _addressRetrofit.getAddresses(token);
      return response.toAllAddressesEntity();
    });
  }

  @override
  Future<Result<AllAddressEntity>> removeAddress(
      String token, String addressId) {
    return executeApi(() async {
      var response = await _addressRetrofit.removeAddress(token, addressId);
      return response.toAllAddressesEntity();
    });
  }
}
