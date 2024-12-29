import 'package:json_annotation/json_annotation.dart';

import 'AdaptivePricing.dart';
import 'AutomaticTax.dart';
import 'CustomText.dart';
import 'CustomerDetails.dart';
import 'InvoiceCreation.dart';
import 'Metadata.dart';
import 'PaymentMethodConfigurationDetails.dart';
import 'PaymentMethodOptions.dart';
import 'PhoneNumberCollection.dart';
import 'TotalDetails.dart';

part 'Session.g.dart';

@JsonSerializable()

class Session {
  Session({
      this.id, 
      this.object, 
      this.adaptivePricing, 
      this.afterExpiration, 
      this.allowPromotionCodes, 
      this.amountSubtotal, 
      this.amountTotal, 
      this.automaticTax, 
      this.billingAddressCollection, 
      this.cancelUrl, 
      this.clientReferenceId, 
      this.clientSecret, 
      this.consent, 
      this.consentCollection, 
      this.created, 
      this.currency, 
      this.currencyConversion, 
      this.customFields, 
      this.customText, 
      this.customer, 
      this.customerCreation, 
      this.customerDetails, 
      this.customerEmail, 
      this.expiresAt, 
      this.invoice, 
      this.invoiceCreation, 
      this.livemode, 
      this.locale, 
      this.metadata, 
      this.mode, 
      this.paymentIntent, 
      this.paymentLink, 
      this.paymentMethodCollection, 
      this.paymentMethodConfigurationDetails, 
      this.paymentMethodOptions, 
      this.paymentMethodTypes, 
      this.paymentStatus, 
      this.phoneNumberCollection, 
      this.recoveredFrom, 
      this.savedPaymentMethodOptions, 
      this.setupIntent, 
      this.shippingAddressCollection, 
      this.shippingCost, 
      this.shippingDetails, 
      this.shippingOptions, 
      this.status, 
      this.submitType, 
      this.subscription, 
      this.successUrl, 
      this.totalDetails, 
      this.uiMode, 
      this.url,});

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  String? id;
  String? object;
  AdaptivePricing? adaptivePricing;
  dynamic afterExpiration;
  dynamic allowPromotionCodes;
  num? amountSubtotal;
  num? amountTotal;
  AutomaticTax? automaticTax;
  dynamic billingAddressCollection;
  String? cancelUrl;
  String? clientReferenceId;
  dynamic clientSecret;
  dynamic consent;
  dynamic consentCollection;
  num? created;
  String? currency;
  dynamic currencyConversion;
  List<dynamic>? customFields;
  CustomText? customText;
  dynamic customer;
  String? customerCreation;
  CustomerDetails? customerDetails;
  String? customerEmail;
  num? expiresAt;
  dynamic invoice;
  InvoiceCreation? invoiceCreation;
  bool? livemode;
  dynamic locale;
  Metadata? metadata;
  String? mode;
  dynamic paymentIntent;
  dynamic paymentLink;
  String? paymentMethodCollection;
  PaymentMethodConfigurationDetails? paymentMethodConfigurationDetails;
  PaymentMethodOptions? paymentMethodOptions;
  List<String>? paymentMethodTypes;
  String? paymentStatus;
  PhoneNumberCollection? phoneNumberCollection;
  dynamic recoveredFrom;
  dynamic savedPaymentMethodOptions;
  dynamic setupIntent;
  dynamic shippingAddressCollection;
  dynamic shippingCost;
  dynamic shippingDetails;
  List<dynamic>? shippingOptions;
  String? status;
  dynamic submitType;
  dynamic subscription;
  String? successUrl;
  TotalDetails? totalDetails;
  String? uiMode;
  String? url;

  Map<String, dynamic> toJson() => _$SessionToJson(this);

}