

import '../../../../core/common/api_result.dart';
import '../../domain/entities/user_orders_response_entity.dart';

abstract class UserOrdersOnlineDataSource {
  Future<Result<UserOrdersResponseEntity?>> getUserOrders(String token);
}
