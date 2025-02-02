
import '../../../../core/common/api_result.dart';
import '../entities/user_orders_response_entity.dart';

abstract class UserOrdersRepo {
  Future<Result<UserOrdersResponseEntity?>> getUserOrders(String token);
}
