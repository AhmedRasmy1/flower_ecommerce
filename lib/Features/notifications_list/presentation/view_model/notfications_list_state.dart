       import 'package:flower_ecommerce/Features/notifications_list/domain/entities/notifications_list_entity.dart';


sealed class NotificationsListState {}

class InitialState extends NotificationsListState {}

class SuccessNotificationsListState extends NotificationsListState {
  final NotificationsListEntity notificationsListEntity;

  SuccessNotificationsListState(this.notificationsListEntity);
}

class LoadingNotificationsState extends NotificationsListState {}

class ErrorNotificationsState extends NotificationsListState {
  Exception? exception;

  ErrorNotificationsState(this.exception);
}
