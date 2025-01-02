
import 'package:bloc/bloc.dart';
import 'package:flower_ecommerce/Features/payment/data/model/request/payment_checkout_request.dart';
import 'package:flower_ecommerce/Features/payment/data/model/response/checkout_session_response/Paymernt_checkout_response.dart';
import 'package:flower_ecommerce/Features/payment/presentation/payment_checkout_view_model/payment_checkout_state.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../../domain/use_case/payment_checkout_use_case.dart';


@injectable
class PaymentCheckoutViewModel extends Cubit<PaymentCheckoutState> {
  PaymentCheckoutUseCase paymentCheckoutUseCase;
  PaymentCheckoutViewModel(this.paymentCheckoutUseCase) : super(PaymentCheckoutInitialState());

  Future<void> getPaymentCheckout(PaymentCheckoutRequest paymentRequest,String token) async {
    emit(PaymentCheckoutLoadingState());

    var result = await paymentCheckoutUseCase.invoke(paymentRequest,token);

    switch (result) {
      case Success<PaymentCheckoutResponse?>():
        emit(PaymentCheckoutSuccessState(result.data));
      case Fail<PaymentCheckoutResponse?>():
        emit( PaymentCheckoutErrorState(result.exception));
    }
  }
}
