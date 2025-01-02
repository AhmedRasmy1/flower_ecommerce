
import 'package:flower_ecommerce/Features/orders/data/data_source/user_orders_online_data_source.dart';
import 'package:flower_ecommerce/Features/orders/domain/entities/orders_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager/api_manager.dart';
import '../../../../core/common/api_result.dart';


@Injectable(as: UserOrdersOnlineDataSource)
class UserOrdersOnlineDataSourceImpl implements UserOrdersOnlineDataSource {
  final ApiService _homeRetrofit;

  UserOrdersOnlineDataSourceImpl(this._homeRetrofit);

  @override
  Future<Result<OrdersResponseEntity?>> getUserOrders(String token) {
    return executeApi(() async {
      var response = await _homeRetrofit.getUserOrders(token);
      OrdersResponseEntity ordersResponseEntity=response.toOrdersResponseEntity();
      return ordersResponseEntity;
    });
  }
}
