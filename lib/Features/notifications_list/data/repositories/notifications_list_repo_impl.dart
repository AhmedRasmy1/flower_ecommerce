import 'package:flower_ecommerce/Features/notifications_list/domain/entities/notifications_list_entity.dart';
import 'package:flower_ecommerce/Features/notifications_list/domain/repositories/notifications_list_repo.dart';
import '../../../../../core/common/api_result.dart';
import 'package:injectable/injectable.dart';
import '../data_sources/online_data_source/notifications_list_online_data_source.dart';

@Injectable(as: NotificationsListRepo)
class NotificationsListRepoImpl extends NotificationsListRepo {
  NotificationsListOnlineDataSource onLineDataSource;

  NotificationsListRepoImpl(
    this.onLineDataSource,
  );

  @override
  Future<Result<NotificationsListEntity>> getAllNotifications(String token) {
    return onLineDataSource.getAllNotifications(token);
  }
}
