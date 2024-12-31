import '../../../domain/entities/add_address_entity.dart';

class AddAddressResponse {
  AddAddressResponse({
    this.message,
    this.address,
  });

  AddAddressResponse.fromJson(dynamic json) {
    message = json['message'];
    if (json['address'] != null) {
      address = [];
      json['address'].forEach((v) {
        address?.add(Address.fromJson(v));
      });
    }
  }
  String? message;
  List<Address>? address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (address != null) {
      map['address'] = address?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  AddAddressEntity toAddAddress() {
    return AddAddressEntity(
      message: message,
    );
  }
}

class Address {
  Address({
    this.street,
    this.phone,
    this.city,
    this.id,
  });

  Address.fromJson(dynamic json) {
    street = json['street'];
    phone = json['phone'];
    city = json['city'];
    id = json['_id'];
  }
  String? street;
  String? phone;
  String? city;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['street'] = street;
    map['phone'] = phone;
    map['city'] = city;
    map['_id'] = id;
    return map;
  }
}
