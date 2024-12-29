import 'package:flower_ecommerce/Features/orders/domain/entities/orders_response_entity.dart';
import '../../../../core/common/api_result.dart';

abstract class UserOrdersRepo {
  Future<Result<OrdersResponseEntity?>> getUserOrders(String token);
}
