import 'package:flower_ecommerce/Features/notifications_list/presentation/view_model/notfications_list_state.dart';
import 'package:flower_ecommerce/Features/notifications_list/presentation/view_model/notifictions_list_cubit.dart';
import 'package:flower_ecommerce/Features/notifications_list/presentation/widgets/notification_item.dart';
import 'package:flower_ecommerce/core/di/di.dart';
import 'package:flower_ecommerce/core/utils/cashed_data_shared_preferences.dart';
import 'package:flower_ecommerce/core/widgets/custom_app_bar.dart';
import 'package:flower_ecommerce/core/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationsListView extends StatefulWidget {
  const NotificationsListView({super.key});

  @override
  State<NotificationsListView> createState() => _NotificationsListViewState();
}

class _NotificationsListViewState extends State<NotificationsListView> {
  late NotificationsListViewModel viewModel;

  @override
  void initState() {
    viewModel = getIt.get<NotificationsListViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel
        ..getAllNotifications(
          "Bearer"
          " ${CacheService.getData(key: CacheConstants.userToken)}",
        ),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 10),
                child: CustomAppBar(
                  title: AppLocalizations.of(context)!.notification,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
              BlocBuilder<NotificationsListViewModel, NotificationsListState>(
                  builder: (context, state) {
                if (state is LoadingNotificationsState) {
                  return LoadingIndicator();
                } else if (state is ErrorNotificationsState) {
                  return const Center(child: Text("something went wrong"));
                } else if (state is SuccessNotificationsListState) {
                  return Expanded(
                      child: ListView.builder(
                    itemCount:
                        state.notificationsListEntity.notifications!.length,
                    itemBuilder: (context, index) => NotificationItem(
                        notificationsEntity: state
                            .notificationsListEntity.notifications![index]),
                  ));
                } else {
                  return const SizedBox();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
