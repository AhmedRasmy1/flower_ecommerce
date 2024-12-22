import 'package:flower_ecommerce/Features/notifications_list/domain/entities/notifications_list_entity.dart';
import '../../../../../../core/api/api_extentions.dart';
import '../../../../../../core/api/api_manager/api_manager.dart';
import '../../../../../../core/common/api_result.dart';
import 'package:injectable/injectable.dart';

import '../online_data_source/notifications_list_online_data_source.dart';

@Injectable(as: NotificationsListOnlineDataSource)
class NotificationsListOnlineDataSourceImpl
    extends NotificationsListOnlineDataSource {
  final ApiService _notificationsListRetrofit;

  NotificationsListOnlineDataSourceImpl(this._notificationsListRetrofit);

  @override
  Future<Result<NotificationsListEntity>> getAllNotifications(String token) {
    return executeApi(() async {
      var response =
          await _notificationsListRetrofit.getAllNotifications(token);
      return response.toNotificationsListEntity();
    });
  }
}
