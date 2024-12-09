import 'package:bloc/bloc.dart';
import '../../../domain/entities/response/address_entity.dart';
import '../../../domain/use_cases/address_use_cases.dart';
import 'remove_state.dart';
import '../../../../../../core/common/api_result.dart';
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
