
class InvoiceData {
  InvoiceData({
      this.accountTaxIds, 
      this.customFields, 
      this.description, 
      this.footer, 
      this.issuer, 
      this.metadata, 
      this.renderingOptions,});

  InvoiceData.fromJson(dynamic json) {
    accountTaxIds = json['account_tax_ids'];
    customFields = json['custom_fields'];
    description = json['description'];
    footer = json['footer'];
    issuer = json['issuer'];
    metadata = json['metadata'];
    renderingOptions = json['rendering_options'];
  }
  dynamic accountTaxIds;
  dynamic customFields;
  dynamic description;
  dynamic footer;
  dynamic issuer;
  dynamic metadata;
  dynamic renderingOptions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['account_tax_ids'] = accountTaxIds;
    map['custom_fields'] = customFields;
    map['description'] = description;
    map['footer'] = footer;
    map['issuer'] = issuer;
    map['metadata'] = metadata;
    map['rendering_options'] = renderingOptions;
    return map;
  }

}