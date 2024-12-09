import 'package:flower_ecommerce/Features/add_address/data/models/request/add_address_model.dart';
import 'package:flower_ecommerce/Features/add_address/domain/entities/add_address_entity.dart';
import 'package:flower_ecommerce/Features/add_address/domain/repositories/add_address_repo.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:injectable/injectable.dart';


@injectable
class AddAddressUseCase {
  final AddAddressRepo _addAddressRepo;

  AddAddressUseCase(this._addAddressRepo);

  Future<Result<AddAddressEntity?>> addAddress(String city ,String phone ,String street) async {
    return await _addAddressRepo.addAddressRepo(city, phone, street);
  }
}