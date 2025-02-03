import '../../data/model/user_orders.dart';
import '../utilties/active_or_complete.dart';

import '../utilties/my_order_details_to_view.dart';
import '../widgets/build_order_list.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/utils/cashed_data_shared_preferences.dart';
import '../../../products/presentation/widgets/skeleton_body.dart';
import '../../domain/entities/user_orders_response_entity.dart';
import '../view_model/orders_cubit.dart';
import '../view_model/orders_state.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage>
    with SingleTickerProviderStateMixin {
  late OrdersViewModel ordersViewModel;
  late TabController _tabController;

  @override
  void initState() {
    ordersViewModel = getIt.get<OrdersViewModel>();

    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    String savedToken = CacheService.getData(key: CacheConstants.userToken);
    String token = "Bearer $savedToken";
    ordersViewModel.getUserOrders(token);
  }

  @override
  Widget build(BuildContext context) {
    List<MyOrderDetailsToView> activeOrderDetails = [
      MyOrderDetailsToView(
          "Red roses", "EGP 600", 'order number#123456', "Track order"),
      MyOrderDetailsToView(
          "Red roses", "EGP 600", 'order number#123456', "Track order"),
    ];
    List<MyOrderDetailsToView> completeOrderDetails = [
      MyOrderDetailsToView(
          "Red roses", "EGP 600", "Delivered on 3 Sep 2024", "Reorder"),
      MyOrderDetailsToView(
          "Red roses", "EGP 600", "Delivered on 3 Sep 2024", "Reorder"),
      MyOrderDetailsToView(
          "Red roses", "EGP 600", "Delivered on 3 Sep 2024", "Reorder"),
    ];

    return BlocProvider(
      create: (context) => ordersViewModel,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.myOrders,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white,
          elevation: 1,
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: ColorManager.pink,
            labelColor: ColorManager.pink,
            unselectedLabelColor: Colors.grey,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            tabs: const [
              Tab(text: AppStrings.active),
              Tab(text: AppStrings.complete),
            ],
          ),
        ),
        body: BlocBuilder<OrdersViewModel, OrdersState>(
          builder: (context, state) {
            if (state is LoadingOrdersState) {
              return const Expanded(child: SkeletonBody());
            } else if (state is SuccessOrdersState) {
              UserOrdersResponseEntity? userOrders =
                  state.userOrdersResponseEntity;
              List<UserOrders>? listUserOrders = userOrders?.orders;
              if (listUserOrders != null) {
                List<UserOrders> activeOrders =
                    activeOrComplete(listUserOrders, "active");
                List<UserOrders> completedOrders =
                    activeOrComplete(listUserOrders, "completed");
                return TabBarView(
                  controller: _tabController,
                  children: [
                    // Active Orders
                    BuildOrderList(
                      orderDetailsList: activeOrders,
                    ),
                    // Completed Orders
                    BuildOrderList(
                      orderDetailsList: completedOrders,
                    ),
                  ],
                );
              } else {
                return Container();
              }
            } else if (state is ErrorOrdersState) {
              return Container(
                color: Colors.red,
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
