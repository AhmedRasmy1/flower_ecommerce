/// enabled : false
/// liability : null
/// status : null

class AutomaticTax {
  AutomaticTax({
      this.enabled, 
      this.liability, 
      this.status,});

  AutomaticTax.fromJson(dynamic json) {
    enabled = json['enabled'];
    liability = json['liability'];
    status = json['status'];
  }
  bool? enabled;
  dynamic liability;
  dynamic status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['enabled'] = enabled;
    map['liability'] = liability;
    map['status'] = status;
    return map;
  }

}