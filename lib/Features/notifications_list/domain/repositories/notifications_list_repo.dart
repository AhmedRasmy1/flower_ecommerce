import 'package:flower_ecommerce/Features/notifications_list/domain/entities/notifications_list_entity.dart';
import '../../../../../core/common/api_result.dart';

abstract class NotificationsListRepo {
  Future<Result<NotificationsListEntity>> getAllNotifications(String token);
}
