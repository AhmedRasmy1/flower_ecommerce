
class ShippingAddress {
  ShippingAddress({
      this.street,
      this.phone,
      this.city,});

  ShippingAddress.fromJson(dynamic json) {
    street = json['street'];
    phone = json['phone'];
    city = json['city'];
  }
  String? street;
  String? phone;
  String? city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['street'] = street;
    map['phone'] = phone;
    map['city'] = city;
    return map;
  }

}