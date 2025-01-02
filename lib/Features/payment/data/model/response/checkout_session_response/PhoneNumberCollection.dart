/// enabled : false

class PhoneNumberCollection {
  PhoneNumberCollection({
      this.enabled,});

  PhoneNumberCollection.fromJson(dynamic json) {
    enabled = json['enabled'];
  }
  bool? enabled;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['enabled'] = enabled;
    return map;
  }

}