import '../../../domain/entities/response/address_entity.dart';

class AllAddressesDto {
  AllAddressesDto({
    this.message,
    this.addresses,
  });

  AllAddressesDto.fromJson(dynamic json) {
    message = json['message'];
    if (json['addresses'] != null) {
      addresses = [];
      json['addresses'].forEach((v) {
        addresses?.add(Addresses.fromJson(v));
      });
    }
  }

  String? message;
  List<Addresses>? addresses;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (addresses != null) {
      map['addresses'] = addresses?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  AllAddressEntity toAllAddressesEntity() {
    return AllAddressEntity(
      message: message,
      addresses:
          addresses?.map((address) => address.toAddressEntity()).toList(),
    );
  }
}

class Addresses {
  Addresses({
    this.street,
    this.phone,
    this.city,
    this.id,
  });

  Addresses.fromJson(dynamic json) {
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

  AddressesEntity toAddressEntity() {
    return AddressesEntity(id: id, city: city, street: street);
  }
}
