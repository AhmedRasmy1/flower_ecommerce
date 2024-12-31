import 'package:bloc/bloc.dart';
import 'package:flower_ecommerce/Features/notifications_list/domain/entities/notifications_list_entity.dart';
import 'package:flower_ecommerce/Features/notifications_list/domain/use_cases/notifications_list_use_case.dart';
import 'package:flower_ecommerce/Features/notifications_list/presentation/view_model/notfications_list_state.dart';
import '../../../../../../core/common/api_result.dart';
import 'package:injectable/injectable.dart';

@injectable
class NotificationsListViewModel extends Cubit<NotificationsListState> {
  final NotificationsListUseCases notificationsListUseCases;

  NotificationsListViewModel(this.notificationsListUseCases)
      : super(InitialState());

  Future<void> getAllNotifications(String token) async {
    emit(LoadingNotificationsState());

    var result = await notificationsListUseCases.getAllNotificationsList(token);

    switch (result) {
      case Success<NotificationsListEntity>():
        print(NotificationsListEntity);
        emit(SuccessNotificationsListState(result.data));
        print(result.data.notifications);
      case Fail<NotificationsListEntity>():
        emit(ErrorNotificationsState(result.exception));
        print("Error Occurred: ${result.exception}");
    }
  }

  int get notificationsCount {
    if (state is SuccessNotificationsListState) {
      return (state as SuccessNotificationsListState)
              .notificationsListEntity
              .notifications
              ?.length ??
          0;
    }
    return 0;
  }
}
