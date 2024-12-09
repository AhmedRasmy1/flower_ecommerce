import 'package:bloc/bloc.dart';
import '../../../data/models/response/checkout/address_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/api_result.dart';
import '../../../domain/use_cases/checkout_usecase.dart';
import 'checkout_state.dart';

@injectable
class CheckoutViewModel extends Cubit<CheckoutState> {
  CheckoutUseCase checkoutUseCase;

  CheckoutViewModel(this.checkoutUseCase) : super(InitialState());

  void getUserAddresses(String token) async {
    emit(LoadingCheckoutState());

    var result = await checkoutUseCase.getUserAddresses(token);

    switch (result) {
      case Success<AddressResponse?>():
        emit(SuccessCheckoutState(result.data));
      case Fail<AddressResponse?>():
        emit(ErrorCheckoutState(result.exception));
    }
  }
}
