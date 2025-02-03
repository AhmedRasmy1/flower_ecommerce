
import 'package:flower_ecommerce/Features/orders/data/data_source/user_orders_online_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager/api_manager.dart';
import '../../../../core/common/api_result.dart';
import '../../domain/entities/user_orders_response_entity.dart';


@Injectable(as: UserOrdersOnlineDataSource)
class UserOrdersOnlineDataSourceImpl implements UserOrdersOnlineDataSource {
  final ApiService _homeRetrofit;

  UserOrdersOnlineDataSourceImpl(this._homeRetrofit);

  @override
  Future<Result<UserOrdersResponseEntity?>> getUserOrders(String token) {
    return executeApi(() async {
      var response = await _homeRetrofit.getUserOrders(token);
      UserOrdersResponseEntity ordersResponseEntity=response.toUserOrderResponseEntity();
      return ordersResponseEntity;
    });
  }
}
