import '../../data/model/user_orders.dart';

List<UserOrders> activeOrComplete(
    List<UserOrders> listOfOrders, String orderStatus) {
  List<UserOrders> activeOrders = [];
  List<UserOrders> completeOrders = [];

  if (orderStatus == "completed") {
    for (int index = 0; index < listOfOrders.length; index++) {
      if (listOfOrders[index].state == "completed") {
        completeOrders.add(listOfOrders[index]);
      }
    }
    return completeOrders;
  } else if (orderStatus == "active") {
    for (int index = 0; index < listOfOrders.length; index++) {
      if (listOfOrders[index].state != "completed") {
        activeOrders.add(listOfOrders[index]);
      }
    }
    return activeOrders;
  } else {
    return listOfOrders;
  }
}
