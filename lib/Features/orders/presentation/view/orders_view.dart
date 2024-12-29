
import 'package:flower_ecommerce/Features/orders/presentation/useful_classes/my_order_details.dart';
import 'package:flower_ecommerce/Features/orders/presentation/widgets/build_order_list.dart';
import 'package:flower_ecommerce/Features/payment/data/model/response/cash_order_response/OrderItems.dart';
import 'package:flower_ecommerce/core/resources/color_manager.dart';
import 'package:flower_ecommerce/core/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/utils/cashed_data_shared_preferences.dart';
import '../../../products/presentation/widgets/skeleton_body.dart';
import '../../data/model/user_order_items.dart';
import '../view_model/orders_cubit.dart';
import '../view_model/orders_state.dart';



class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage>
    with SingleTickerProviderStateMixin {
 // late OrdersViewModel ordersViewModel;
  late TabController _tabController;

  @override
  void initState() {
   // ordersViewModel = getIt.get<OrdersViewModel>();

    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    String savedToken = CacheService.getData(key: CacheConstants.userToken);
    String token = "Bearer $savedToken";

   // ordersViewModel.getUserOrders(token);
  }

  @override
  Widget build(BuildContext context) {
    List<MyOrderDetails> activeOrderDetails=[
      MyOrderDetails("Red roses","EGP 600",'order number#123456',"Track order"),
      MyOrderDetails("Red roses","EGP 600",'order number#123456',"Track order"),

    ];

    List<MyOrderDetails> completeOrderDetails=[
      MyOrderDetails("Red roses","EGP 600","Delivered on 3 Sep 2024","Reorder"),
      MyOrderDetails("Red roses","EGP 600","Delivered on 3 Sep 2024","Reorder"),
      MyOrderDetails("Red roses","EGP 600","Delivered on 3 Sep 2024","Reorder"),

     ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.myOrders,
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
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
            Tab(text:AppStrings.complete),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Active Orders
          BuildOrderList(orderDetailsList: activeOrderDetails,
          ),
          // Completed Orders
          BuildOrderList(orderDetailsList: completeOrderDetails,
          ),
        ],
      )


    );
  }


}