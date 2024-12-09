import '../entities/add_address_entity.dart';
import '../repositories/add_address_repo.dart';
import '../../../../core/common/api_result.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddAddressUseCase {
  final AddAddressRepo _addAddressRepo;

  AddAddressUseCase(this._addAddressRepo);

  Future<Result<AddAddressEntity?>> addAddress(
      String city, String phone, String street) async {
    return await _addAddressRepo.addAddressRepo(city, phone, street);
  }
}
