import 'package:flower_ecommerce/Features/orders/presentation/widgets/build_one_order.dart';
import 'package:flutter/material.dart';

import '../useful_classes/my_order_details.dart';


class BuildOrderList extends StatelessWidget {
  BuildOrderList({required this.orderDetailsList, super.key});

  List<MyOrderDetails> orderDetailsList;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(orderDetailsList.length, (index) {
        return BuildOneOrder(order: orderDetailsList[index]);
      }),
    );
  }
}
