import 'package:flower_ecommerce/Features/orders/presentation/utilties/my_order_details_to_view.dart';
import 'package:flower_ecommerce/Features/orders/presentation/widgets/build_one_order.dart';
import 'package:flutter/material.dart';

import '../../data/model/user_orders.dart';



class BuildOrderList extends StatelessWidget {
  BuildOrderList({required this.orderDetailsList, super.key});

  List<UserOrders> orderDetailsList;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(orderDetailsList.length, (index) {
        return BuildOneOrder(order: orderDetailsList[index]);
      }),
    );
  }
}
