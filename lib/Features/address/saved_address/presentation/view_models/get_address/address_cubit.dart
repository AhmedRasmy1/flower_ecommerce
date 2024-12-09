import 'package:bloc/bloc.dart';
import '../../../domain/entities/response/address_entity.dart';
import '../../../domain/use_cases/address_use_cases.dart';
import 'address_state.dart';
import '../../../../../../core/common/api_result.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddressViewModel extends Cubit<AddressState> {
  final AddressUseCases addressUseCases;

  AddressViewModel(this.addressUseCases) : super(InitialState());

  Future<void> getAddress(String token) async {
    emit(LoadingAddressState());
    print("=======================================");
    print("Fetching addresses with token: $token");

    var result = await addressUseCases.getAddresses(token);

    print("API Result: $result");
    print("=======================================");

    switch (result) {
      case Success<AllAddressEntity>():
        print("=======================================");
        print(AllAddressEntity);
        emit(SuccessAddressState(result.data));
        print(result.data.addresses);
      case Fail<AllAddressEntity>():
        emit(ErrorAddressState(result.exception));
        print("=======================================");
        print("Error Occurred: ${result.exception}");
    }
  }

  Future<void> removeAddress(String token, String addressId) async {
    emit(LoadingAddressState());
    print("=======================================");
    print("Fetching addresses with token: $token");

    var result = await addressUseCases.removeAddress(token, addressId);

    print("API Result: $result");
    print("=======================================");

    switch (result) {
      case Success<AllAddressEntity>():
        print("=======================================");
        print(AllAddressEntity);
        emit(SuccessAddressState(result.data));
        print(result.data.addresses);
      case Fail<AllAddressEntity>():
        emit(ErrorAddressState(result.exception));
        print("=======================================");
        print("Error Occurred: ${result.exception}");
    }
  }
}
