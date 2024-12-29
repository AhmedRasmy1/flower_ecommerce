import 'order.dart';

/// message : "success"
/// order : {"user":"675f4a747d0d3485780e894f","orderItems":[{"product":{"_id":"673e1cd711599201718280fb","title":"Wdding Flower","slug":"wdding-flower","description":"This is a Pack of White Widding Flowers","imgCover":"https://flower.elevateegy.com/uploads/fefa790a-f0c1-42a0-8699-34e8fc065812-cover_image.png","images":["https://flower.elevateegy.com/uploads/66c36d5d-c067-46d9-b339-d81be57e0149-image_one.png","https://flower.elevateegy.com/uploads/f27e1903-74cf-4ed6-a42c-e43e35b6dd14-image_three.png","https://flower.elevateegy.com/uploads/500fe197-0e16-4b01-9a0d-031ccb032714-image_two.png"],"price":250,"priceAfterDiscount":100,"quantity":59,"category":"673c46fd1159920171827c85","occasion":"673b34c21159920171827ae0","createdAt":"2024-11-20T17:31:03.303Z","updatedAt":"2024-12-23T16:47:59.198Z","__v":0,"discount":50,"sold":161,"id":"673e1cd711599201718280fb"},"price":250,"quantity":1,"_id":"676993871d7443525c6fd587"}],"totalPrice":125,"paymentType":"cash","isPaid":false,"isDelivered":false,"_id":"676998281d7443525c6fd6f7","createdAt":"2024-12-23T17:04:40.382Z","updatedAt":"2024-12-23T17:04:40.382Z","__v":0}

class CashOrderResponse {
  CashOrderResponse({
      this.message, 
      this.order,});

  CashOrderResponse.fromJson(dynamic json) {
    message = json['message'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
  }
  String? message;
  Order? order;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (order != null) {
      map['order'] = order?.toJson();
    }
    return map;
  }

}