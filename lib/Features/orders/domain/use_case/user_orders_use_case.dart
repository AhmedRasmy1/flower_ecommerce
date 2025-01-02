
import 'package:flower_ecommerce/Features/orders/domain/entities/orders_response_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/common/api_result.dart';
import '../reposiroeies/user_orders_repo.dart';
@injectable
class UserOrdersUseCase {
  UserOrdersRepo userOrdersRepo;

  UserOrdersUseCase(this.userOrdersRepo);

  Future<Result<OrdersResponseEntity?>> invoke(String token) {
    return userOrdersRepo.getUserOrders(token);
  }
}
