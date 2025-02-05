import 'package:flower_ecommerce/core/resources/style_manager.dart';

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

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //
  //   String savedToken = CacheService.getData(key: CacheConstants.userToken);
  //   String token = "Bearer $savedToken";
  //   ordersViewModel.getUserOrders(token);
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ordersViewModel
        ..getUserOrders(
            'Bearer ${CacheService.getData(key: CacheConstants.userToken)}'),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.myOrders,
            style: getSemiBoldStyle(fontSize: 20,),),
          backgroundColor: Colors.white,
          elevation: 1,
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: ColorManager.pink,
            labelColor: ColorManager.pink,
            unselectedLabelColor: Colors.grey,
            labelStyle: getSemiBoldStyle(fontSize: 16),
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
                List<UserOrders> newActiveOrders = activeOrders.reversed
                    .toList();
                List<UserOrders> completedOrders =
                activeOrComplete(listUserOrders, "completed");
                List<UserOrders> newCompletedOrders = completedOrders.reversed
                    .toList();
                return TabBarView(
                  controller: _tabController,
                  children: [
                    // Active Orders
                    BuildOrderList(
                      orderDetailsList: newActiveOrders,
                    ),
                    // Completed Orders
                    BuildOrderList(
                      orderDetailsList: newCompletedOrders,
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
