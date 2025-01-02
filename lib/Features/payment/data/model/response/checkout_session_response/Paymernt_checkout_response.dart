import 'Session.dart';


class PaymentCheckoutResponse {
  PaymentCheckoutResponse({
      this.message, 
      this.session,
    this.error,
  });

  PaymentCheckoutResponse.fromJson(dynamic json) {
    message = json['message'];
    session = json['session'] != null ? Session.fromJson(json['session']) : null;
    error = json['error'];
  }
  String? message;
  Session? session;
  String? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (session != null) {
      map['session'] = session?.toJson();
    }
    map['error'] = error;
    return map;
  }

}