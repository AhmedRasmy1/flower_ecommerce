
import 'package:flower_ecommerce/Features/payment/data/data_source/payment_checkout_online_data_source.dart';
import 'package:flower_ecommerce/Features/payment/data/model/request/payment_checkout_request.dart';
import 'package:flower_ecommerce/Features/payment/data/model/response/checkout_session_response/Paymernt_checkout_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager/api_manager.dart';
import '../../../../core/common/api_result.dart';

@Injectable(as: PaymentCheckoutOnLineDataSource)
class PaymentCheckoutOnLineDataSourceImpl implements PaymentCheckoutOnLineDataSource {
  final ApiService _homeRetrofit;

  PaymentCheckoutOnLineDataSourceImpl(this._homeRetrofit);

  @override
  Future<Result<PaymentCheckoutResponse?>> getPaymentCheckout(PaymentCheckoutRequest paymentRequest,String token) {
    return executeApi(() async {
      var response = await _homeRetrofit.getPaymentCheckout(paymentRequest,token);
      return response;
    });
  }
}
