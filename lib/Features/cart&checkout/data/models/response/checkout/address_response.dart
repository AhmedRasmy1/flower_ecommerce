import 'dart:convert';

AddressResponse addressResponseFromJson(String str) =>
    AddressResponse.fromJson(json.decode(str));

String addressResponseToJson(AddressResponse data) =>
    json.encode(data.toJson());

class AddressResponse {
  AddressResponse({this.addresses, this.message, this.error});

  List<Address>? addresses;
  String? message;
  String? error;

  factory AddressResponse.fromJson(Map<dynamic, dynamic> json) =>
      AddressResponse(
        addresses: List<Address>.from(
            json["addresses"].map((x) => Address.fromJson(x))),
        message: json["message"],
        error: json["error"],
      );

  Map<dynamic, dynamic> toJson() => {
        "addresses": List<dynamic>.from(addresses!.map((x) => x.toJson())),
        "message": message,
        "error": error,
      };
}

class Address {
  Address({
    this.phone,
    this.city,
    this.street,
    this.id,
  });

  String? phone;
  String? city;
  String? street;
  String? id;

  factory Address.fromJson(Map<dynamic, dynamic> json) => Address(
        phone: json["phone"],
        city: json["city"],
        street: json["street"],
        id: json["_id"],
      );

  Map<dynamic, dynamic> toJson() => {
        "phone": phone,
        "city": city,
        "street": street,
        "_id": id,
      };
}
