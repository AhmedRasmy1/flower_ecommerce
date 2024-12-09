class AllAddressEntity {
  AllAddressEntity({
    this.message,
    this.addresses,
  });

  String? message;
  List<AddressesEntity>? addresses;
}

class AddressesEntity {
  AddressesEntity({
    this.street,
    this.city,
    this.id,
  });

  String? street;
  String? city;
  String? id;

  @override
  String toString() {
    return 'AddressesEntity(street: $street, city: $city, id: $id)';
  }
}
