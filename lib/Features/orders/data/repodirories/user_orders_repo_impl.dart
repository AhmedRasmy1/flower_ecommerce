import 'package:flower_ecommerce/Features/orders/domain/entities/orders_response_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../../core/common/api_result.dart';
import '../../domain/reposiroeies/user_orders_repo.dart';
import '../data_source/user_orders_online_data_source.dart';


@Injectable(as: UserOrdersRepo)
class UserOrdersRepoImpl implements UserOrdersRepo {
  UserOrdersOnlineDataSource userOrdersOnLineDataSource;

  UserOrdersRepoImpl(
    this.userOrdersOnLineDataSource,
  );

  @override
  Future<Result<OrdersResponseEntity?>> getUserOrders(String token) {
    return userOrdersOnLineDataSource.getUserOrders(token);
  }
}
