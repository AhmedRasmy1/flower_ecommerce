import 'user_order_items.dart';

/// _id : "678a9bb63745562ff48ce07b"
/// user : "678a783d3c3797492747c8e6"
/// orderItems : [{"product":{"_id":"673e1cd711599201718280fb","title":"Wdding Flower","slug":"wdding-flower","description":"This is a Pack of White Widding Flowers","imgCover":"https://flower.elevateegy.com/uploads/fefa790a-f0c1-42a0-8699-34e8fc065812-cover_image.png","images":["https://flower.elevateegy.com/uploads/66c36d5d-c067-46d9-b339-d81be57e0149-image_one.png","https://flower.elevateegy.com/uploads/f27e1903-74cf-4ed6-a42c-e43e35b6dd14-image_three.png","https://flower.elevateegy.com/uploads/500fe197-0e16-4b01-9a0d-031ccb032714-image_two.png"],"price":250,"priceAfterDiscount":100,"quantity":4300,"category":"673c46fd1159920171827c85","occasion":"673b34c21159920171827ae0","createdAt":"2024-11-20T17:31:03.303Z","updatedAt":"2025-02-01T21:27:26.336Z","__v":0,"discount":50,"sold":362,"id":"673e1cd711599201718280fb"},"price":250,"quantity":2,"_id":"678a9bb43c3797492747c9b7"}]
/// totalPrice : 250
/// paymentType : "cash"
/// isPaid : false
/// isDelivered : false
/// state : "inProgress"
/// createdAt : "2025-01-17T18:04:38.730Z"
/// updatedAt : "2025-01-31T21:36:20.921Z"
/// orderNumber : "#123451"
/// __v : 0

class UserOrders {
  UserOrders({
    this.id,
    this.user,
    this.orderItems,
    this.totalPrice,
    this.paymentType,
    this.isPaid,
    this.isDelivered,
    this.state,
    this.createdAt,
    this.updatedAt,
    this.orderNumber,
    this.v,
  });

  UserOrders.fromJson(dynamic json) {
    id = json['_id'];
    user = json['user'];
    if (json['orderItems'] != null) {
      orderItems = [];
      json['orderItems'].forEach((v) {
        orderItems?.add(UserOrderItems.fromJson(v));
      });
    }
    totalPrice = json['totalPrice'];
    paymentType = json['paymentType'];
    isPaid = json['isPaid'];
    isDelivered = json['isDelivered'];
    state = json['state'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    orderNumber = json['orderNumber'];
    v = json['__v'];
  }
  String? id;
  String? user;
  List<UserOrderItems>? orderItems;
  num? totalPrice;
  String? paymentType;
  bool? isPaid;
  bool? isDelivered;
  String? state;
  String? createdAt;
  String? updatedAt;
  String? orderNumber;
  num? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['user'] = user;
    if (orderItems != null) {
      map['orderItems'] = orderItems?.map((v) => v.toJson()).toList();
    }
    map['totalPrice'] = totalPrice;
    map['paymentType'] = paymentType;
    map['isPaid'] = isPaid;
    map['isDelivered'] = isDelivered;
    map['state'] = state;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['orderNumber'] = orderNumber;
    map['__v'] = v;
    return map;
  }
}
