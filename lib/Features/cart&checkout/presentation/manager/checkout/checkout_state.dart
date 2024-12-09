import '../../../data/models/response/checkout/address_response.dart';

sealed class CheckoutState {}

class InitialState extends CheckoutState {}

class SuccessCheckoutState extends CheckoutState {
  AddressResponse? addressResponse;

  SuccessCheckoutState(this.addressResponse);
}

class LoadingCheckoutState extends CheckoutState {}

class ErrorCheckoutState extends CheckoutState {
  Exception? exception;

  ErrorCheckoutState(this.exception);
}
