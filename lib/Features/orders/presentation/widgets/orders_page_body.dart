
import 'package:flower_ecommerce/Features/orders/presentation/widgets/skeleton_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/user_orders.dart';
import '../../domain/entities/user_orders_response_entity.dart';
import '../utilties/active_or_complete.dart';
import '../view_model/orders_cubit.dart';
import '../view_model/orders_state.dart';
import 'build_order_list.dart';

class MyOrdersPageBody extends StatelessWidget {
  const MyOrdersPageBody({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersViewModel, OrdersState>(
      builder: (context, state) {
        if (state is LoadingOrdersState) {
          return SkeletonOrder();
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
    );
  }
}