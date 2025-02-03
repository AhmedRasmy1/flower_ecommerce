import 'package:bloc/bloc.dart';
import '../../data/model/request/payment_checkout_request.dart';
import '../../data/model/response/checkout_session_response/Paymernt_checkout_response.dart';
import 'payment_checkout_state.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../../domain/use_case/payment_checkout_use_case.dart';

@injectable
class PaymentCheckoutViewModel extends Cubit<PaymentCheckoutState> {
  PaymentCheckoutUseCase paymentCheckoutUseCase;
  PaymentCheckoutViewModel(this.paymentCheckoutUseCase)
      : super(PaymentCheckoutInitialState());

  Future<void> getPaymentCheckout(
      PaymentCheckoutRequest paymentRequest, String token) async {
    emit(PaymentCheckoutLoadingState());

    var result = await paymentCheckoutUseCase.invoke(paymentRequest, token);

    switch (result) {
      case Success<PaymentCheckoutResponse?>():
        emit(PaymentCheckoutSuccessState(result.data));
      case Fail<PaymentCheckoutResponse?>():
        emit(PaymentCheckoutErrorState(result.exception));
    }
  }
}
