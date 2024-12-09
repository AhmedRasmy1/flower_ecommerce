import 'package:bloc/bloc.dart';
import 'package:flower_ecommerce/Features/address/saved_address/domain/entities/response/address_entity.dart';
import 'package:flower_ecommerce/Features/address/saved_address/domain/use_cases/address_use_cases.dart';
import 'package:flower_ecommerce/Features/address/saved_address/presentation/view_models/remove_address/remove_state.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveAddressViewModel extends Cubit<RemoveAddressState> {
  final AddressUseCases addressUseCases;

  RemoveAddressViewModel(this.addressUseCases) : super(InitialState());

  Future<void> removeAddress(String token, String addressId) async {
    emit(LoadingRemoveAddressState());
    print("=======================================");
    print("Fetching addresses with token: $token");

    var result = await addressUseCases.removeAddress(token, addressId);

    print("API Result: $result");
    print("=======================================");

    switch (result) {
      case Success<AllAddressEntity>():
        print("=======================================");
        print(AllAddressEntity);
        emit(SuccessRemoveAddressState(result.data));
        print(result.data.message);
        print(result.data.addresses);
      case Fail<AllAddressEntity>():
        emit(ErrorRemoveAddressState(result.exception));
        print("=======================================");
        print("Error Occurred: ${result.exception}");
    }
  }
}
