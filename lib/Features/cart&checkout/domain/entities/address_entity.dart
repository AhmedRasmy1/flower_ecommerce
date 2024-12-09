class AddressEntity {
  AddressEntity({this.addresses, this.message, this.error});

  List<Address>? addresses;
  String? message;
  String? error;
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
}
