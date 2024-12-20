
import 'package:flower_ecommerce/Features/orders/presentation/widgets/build_order_list.dart';
import 'package:flower_ecommerce/core/resources/color_manager.dart';
import 'package:flower_ecommerce/core/resources/strings_manager.dart';
import 'package:flutter/material.dart';

import 'model/my_order_details.dart';


class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});

  @override
  _MyOrdersPageState createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
      ),
    );
  }


}