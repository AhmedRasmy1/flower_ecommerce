import 'package:flower_ecommerce/Features/payment/data/model/response/checkout_session_response/Paymernt_checkout_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../../domain/repositories/payment_checkout_repo.dart';
import '../data_source/payment_checkout_online_data_source.dart';
import '../model/request/payment_checkout_request.dart';

@Injectable(as: PaymentCheckoutRepo)
class PaymentCheckoutRepoImpl implements PaymentCheckoutRepo {
  PaymentCheckoutOnLineDataSource paymentCheckoutOnLineDataSource;

  PaymentCheckoutRepoImpl(
      this.paymentCheckoutOnLineDataSource,
      );

  @override
  Future<Result<PaymentCheckoutResponse?>> getPaymentCheckout(PaymentCheckoutRequest paymentRequest,String token) {
    return paymentCheckoutOnLineDataSource.getPaymentCheckout(paymentRequest,token);
  }
}
