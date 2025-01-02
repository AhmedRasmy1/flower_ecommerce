// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json) => Session(
      id: json['id'] as String?,
      object: json['object'] as String?,
      adaptivePricing: json['adaptivePricing'] == null
          ? null
          : AdaptivePricing.fromJson(json['adaptivePricing']),
      afterExpiration: json['afterExpiration'],
      allowPromotionCodes: json['allowPromotionCodes'],
      amountSubtotal: json['amountSubtotal'] as num?,
      amountTotal: json['amountTotal'] as num?,
      automaticTax: json['automaticTax'] == null
          ? null
          : AutomaticTax.fromJson(json['automaticTax']),
      billingAddressCollection: json['billingAddressCollection'],
      cancelUrl: json['cancelUrl'] as String?,
      clientReferenceId: json['clientReferenceId'] as String?,
      clientSecret: json['clientSecret'],
      consent: json['consent'],
      consentCollection: json['consentCollection'],
      created: json['created'] as num?,
      currency: json['currency'] as String?,
      currencyConversion: json['currencyConversion'],
      customFields: json['customFields'] as List<dynamic>?,
      customText: json['customText'] == null
          ? null
          : CustomText.fromJson(json['customText']),
      customer: json['customer'],
      customerCreation: json['customerCreation'] as String?,
      customerDetails: json['customerDetails'] == null
          ? null
          : CustomerDetails.fromJson(json['customerDetails']),
      customerEmail: json['customerEmail'] as String?,
      expiresAt: json['expiresAt'] as num?,
      invoice: json['invoice'],
      invoiceCreation: json['invoiceCreation'] == null
          ? null
          : InvoiceCreation.fromJson(json['invoiceCreation']),
      livemode: json['livemode'] as bool?,
      locale: json['locale'],
      metadata:
          json['metadata'] == null ? null : Metadata.fromJson(json['metadata']),
      mode: json['mode'] as String?,
      paymentIntent: json['paymentIntent'],
      paymentLink: json['paymentLink'],
      paymentMethodCollection: json['paymentMethodCollection'] as String?,
      paymentMethodConfigurationDetails:
          json['paymentMethodConfigurationDetails'] == null
              ? null
              : PaymentMethodConfigurationDetails.fromJson(
                  json['paymentMethodConfigurationDetails']),
      paymentMethodOptions: json['paymentMethodOptions'] == null
          ? null
          : PaymentMethodOptions.fromJson(json['paymentMethodOptions']),
      paymentMethodTypes: (json['paymentMethodTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      paymentStatus: json['paymentStatus'] as String?,
      phoneNumberCollection: json['phoneNumberCollection'] == null
          ? null
          : PhoneNumberCollection.fromJson(json['phoneNumberCollection']),
      recoveredFrom: json['recoveredFrom'],
      savedPaymentMethodOptions: json['savedPaymentMethodOptions'],
      setupIntent: json['setupIntent'],
      shippingAddressCollection: json['shippingAddressCollection'],
      shippingCost: json['shippingCost'],
      shippingDetails: json['shippingDetails'],
      shippingOptions: json['shippingOptions'] as List<dynamic>?,
      status: json['status'] as String?,
      submitType: json['submitType'],
      subscription: json['subscription'],
      successUrl: json['successUrl'] as String?,
      totalDetails: json['totalDetails'] == null
          ? null
          : TotalDetails.fromJson(json['totalDetails']),
      uiMode: json['uiMode'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'adaptivePricing': instance.adaptivePricing,
      'afterExpiration': instance.afterExpiration,
      'allowPromotionCodes': instance.allowPromotionCodes,
      'amountSubtotal': instance.amountSubtotal,
      'amountTotal': instance.amountTotal,
      'automaticTax': instance.automaticTax,
      'billingAddressCollection': instance.billingAddressCollection,
      'cancelUrl': instance.cancelUrl,
      'clientReferenceId': instance.clientReferenceId,
      'clientSecret': instance.clientSecret,
      'consent': instance.consent,
      'consentCollection': instance.consentCollection,
      'created': instance.created,
      'currency': instance.currency,
      'currencyConversion': instance.currencyConversion,
      'customFields': instance.customFields,
      'customText': instance.customText,
      'customer': instance.customer,
      'customerCreation': instance.customerCreation,
      'customerDetails': instance.customerDetails,
      'customerEmail': instance.customerEmail,
      'expiresAt': instance.expiresAt,
      'invoice': instance.invoice,
      'invoiceCreation': instance.invoiceCreation,
      'livemode': instance.livemode,
      'locale': instance.locale,
      'metadata': instance.metadata,
      'mode': instance.mode,
      'paymentIntent': instance.paymentIntent,
      'paymentLink': instance.paymentLink,
      'paymentMethodCollection': instance.paymentMethodCollection,
      'paymentMethodConfigurationDetails':
          instance.paymentMethodConfigurationDetails,
      'paymentMethodOptions': instance.paymentMethodOptions,
      'paymentMethodTypes': instance.paymentMethodTypes,
      'paymentStatus': instance.paymentStatus,
      'phoneNumberCollection': instance.phoneNumberCollection,
      'recoveredFrom': instance.recoveredFrom,
      'savedPaymentMethodOptions': instance.savedPaymentMethodOptions,
      'setupIntent': instance.setupIntent,
      'shippingAddressCollection': instance.shippingAddressCollection,
      'shippingCost': instance.shippingCost,
      'shippingDetails': instance.shippingDetails,
      'shippingOptions': instance.shippingOptions,
      'status': instance.status,
      'submitType': instance.submitType,
      'subscription': instance.subscription,
      'successUrl': instance.successUrl,
      'totalDetails': instance.totalDetails,
      'uiMode': instance.uiMode,
      'url': instance.url,
    };
