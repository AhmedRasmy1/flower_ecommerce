
class Metadata {
  Metadata({
      this.city, 
      this.phone, 
      this.street,});

  Metadata.fromJson(dynamic json) {
    city = json['city'];
    phone = json['phone'];
    street = json['street'];
  }
  String? city;
  String? phone;
  String? street;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city'] = city;
    map['phone'] = phone;
    map['street'] = street;
    return map;
  }

}