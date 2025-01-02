
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager/api_manager.dart';
import '../../../../core/common/api_result.dart';
import '../model/request/payment_checkout_request.dart';
import '../model/response/cash_order_response/cash_order_response.dart';
import 'cash_order_online_data_source.dart';

@Injectable(as: CashOrderOnLineDataSource)
class CashOrderOnLineDataSourceImpl implements CashOrderOnLineDataSource {
  final ApiService _homeRetrofit;

  CashOrderOnLineDataSourceImpl(this._homeRetrofit);

  @override
  Future<Result<CashOrderResponse?>> getCashOrder(PaymentCheckoutRequest paymentRequest,String token) {
    return executeApi(() async {
      var response = await _homeRetrofit.getCashOrder(paymentRequest,token);
      return response;
    });
  }
}
