
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../entities/user_orders_response_entity.dart';
import '../reposiroeies/user_orders_repo.dart';
@injectable
class UserOrdersUseCase {
  UserOrdersRepo userOrdersRepo;

  UserOrdersUseCase(this.userOrdersRepo);

  Future<Result<UserOrdersResponseEntity?>> invoke(String token) {
    return userOrdersRepo.getUserOrders(token);
  }
}
