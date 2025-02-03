class AddAddressRequest {
  AddAddressRequest({
    this.street,
    this.phone,
    this.city,
    this.lat,
    this.long,
    this.username,});

  AddAddressRequest.fromJson(dynamic json) {
    street = json['street'];
    phone = json['phone'];
    city = json['city'];
    lat = json['lat'];
    long = json['long'];
    username = json['username'];
  }
  String? street;
  String? phone;
  String? city;
  String? lat;
  String? long;
  String? username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['street'] = street;
    map['phone'] = phone;
    map['city'] = city;
    map['lat'] = lat;
    map['long'] = long;
    map['username'] = username;
    return map;
  }

}