import '../../../../core/utils/cashed_data_shared_preferences.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager/api_manager.dart';
import '../../../../core/common/api_result.dart';
import '../../domain/entities/add_address_entity.dart';
import '../models/request/add_address_model.dart';
import 'add_address_data_source_repo.dart';

@Injectable(as: AddAddressDataSourceRepo)
class AddAddressDataSourceRepoImpl implements AddAddressDataSourceRepo {
  ApiService apiService;

  AddAddressDataSourceRepoImpl(this.apiService);

  @override
  Future<Result<AddAddressEntity?>> addAddressRepo(
      String city, String phone, String street) {
    final cachedToken = CacheService.getData(key: CacheConstants.userToken);
    print(' $cachedToken');
    print('zewin');
    return executeApi(() async {
      var response = await apiService.addAddress(
        AddAddressRequest(city: city, phone: phone, street: street),
        "Bearer $cachedToken",
      );

      return response?.toAddAddress();
    });
  }
}
