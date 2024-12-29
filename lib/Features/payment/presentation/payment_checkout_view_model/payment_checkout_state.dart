
import 'package:flower_ecommerce/Features/payment/data/model/response/checkout_session_response/Paymernt_checkout_response.dart';

sealed class PaymentCheckoutState {}

class PaymentCheckoutInitialState extends PaymentCheckoutState {}

class PaymentCheckoutLoadingState extends PaymentCheckoutState {}

class PaymentCheckoutErrorState extends PaymentCheckoutState {
  Exception? exception;
  PaymentCheckoutErrorState(this.exception);
}

class PaymentCheckoutSuccessState extends PaymentCheckoutState {
  PaymentCheckoutResponse? response;
  PaymentCheckoutSuccessState(this.response);
}
