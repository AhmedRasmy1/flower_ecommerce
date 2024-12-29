

import 'package:flower_ecommerce/Features/payment/data/model/request/shipping_address.dart';

class PaymentCheckoutRequest {
  PaymentCheckoutRequest({
    this.shippingAddress,});

  PaymentCheckoutRequest.fromJson(dynamic json) {
    shippingAddress = json['shippingAddress'] != null ? ShippingAddress.fromJson(json['shippingAddress']) : null;
  }
  ShippingAddress? shippingAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (shippingAddress != null) {
      map['shippingAddress'] = shippingAddress?.toJson();
    }
    return map;
  }

}