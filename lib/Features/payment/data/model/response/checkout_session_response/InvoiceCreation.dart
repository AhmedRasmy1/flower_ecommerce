import 'InvoiceData.dart';

/// enabled : false
/// invoice_data : {"account_tax_ids":null,"custom_fields":null,"description":null,"footer":null,"issuer":null,"metadata":{},"rendering_options":null}

class InvoiceCreation {
  InvoiceCreation({
      this.enabled, 
      this.invoiceData,});

  InvoiceCreation.fromJson(dynamic json) {
    enabled = json['enabled'];
    invoiceData = json['invoice_data'] != null ? InvoiceData.fromJson(json['invoice_data']) : null;
  }
  bool? enabled;
  InvoiceData? invoiceData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['enabled'] = enabled;
    if (invoiceData != null) {
      map['invoice_data'] = invoiceData?.toJson();
    }
    return map;
  }

}