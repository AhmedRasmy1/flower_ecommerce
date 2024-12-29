import 'package:flower_ecommerce/Features/payment/data/model/response/checkout_session_response/Paymernt_checkout_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../../data/model/request/payment_checkout_request.dart';
import '../repositories/payment_checkout_repo.dart';

@injectable
class PaymentCheckoutUseCase {
  PaymentCheckoutRepo paymentCheckoutRepo;

  PaymentCheckoutUseCase(this.paymentCheckoutRepo);

  Future<Result<PaymentCheckoutResponse?>> invoke(PaymentCheckoutRequest paymentRequest,String token) {
    return paymentCheckoutRepo.getPaymentCheckout(paymentRequest,token);
  }
}
