/// address : null
/// email : "ahmedmutti2@gmail.com"
/// name : null
/// phone : null
/// tax_exempt : "none"
/// tax_ids : null

class CustomerDetails {
  CustomerDetails({
      this.address, 
      this.email, 
      this.name, 
      this.phone, 
      this.taxExempt, 
      this.taxIds,});

  CustomerDetails.fromJson(dynamic json) {
    address = json['address'];
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    taxExempt = json['tax_exempt'];
    taxIds = json['tax_ids'];
  }
  dynamic address;
  String? email;
  dynamic name;
  dynamic phone;
  String? taxExempt;
  dynamic taxIds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = address;
    map['email'] = email;
    map['name'] = name;
    map['phone'] = phone;
    map['tax_exempt'] = taxExempt;
    map['tax_ids'] = taxIds;
    return map;
  }

}