/// after_submit : null
/// shipping_address : null
/// submit : null
/// terms_of_service_acceptance : null

class CustomText {
  CustomText({
      this.afterSubmit, 
      this.shippingAddress, 
      this.submit, 
      this.termsOfServiceAcceptance,});

  CustomText.fromJson(dynamic json) {
    afterSubmit = json['after_submit'];
    shippingAddress = json['shipping_address'];
    submit = json['submit'];
    termsOfServiceAcceptance = json['terms_of_service_acceptance'];
  }
  dynamic afterSubmit;
  dynamic shippingAddress;
  dynamic submit;
  dynamic termsOfServiceAcceptance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['after_submit'] = afterSubmit;
    map['shipping_address'] = shippingAddress;
    map['submit'] = submit;
    map['terms_of_service_acceptance'] = termsOfServiceAcceptance;
    return map;
  }

}