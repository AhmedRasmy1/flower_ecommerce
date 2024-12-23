import 'package:flower_ecommerce/Features/notifications_list/domain/entities/notifications_list_entity.dart';
import 'package:flower_ecommerce/Features/notifications_list/domain/repositories/notifications_list_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/common/api_result.dart';

@injectable
class NotificationsListUseCases {
  NotificationsListRepo notificationsListRepo;

  NotificationsListUseCases(this.notificationsListRepo);

  Future<Result<NotificationsListEntity>> getAllNotificationsList(
      String token) {
    return notificationsListRepo.getAllNotifications(token);
  }
}
