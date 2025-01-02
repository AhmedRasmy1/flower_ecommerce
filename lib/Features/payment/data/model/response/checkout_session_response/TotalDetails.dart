/// amount_discount : 0
/// amount_shipping : 0
/// amount_tax : 0

class TotalDetails {
  TotalDetails({
      this.amountDiscount, 
      this.amountShipping, 
      this.amountTax,});

  TotalDetails.fromJson(dynamic json) {
    amountDiscount = json['amount_discount'];
    amountShipping = json['amount_shipping'];
    amountTax = json['amount_tax'];
  }
  num? amountDiscount;
  num? amountShipping;
  num? amountTax;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount_discount'] = amountDiscount;
    map['amount_shipping'] = amountShipping;
    map['amount_tax'] = amountTax;
    return map;
  }

}