/// request_three_d_secure : "automatic"

class Card {
  Card({
      this.requestThreeDSecure,});

  Card.fromJson(dynamic json) {
    requestThreeDSecure = json['request_three_d_secure'];
  }
  String? requestThreeDSecure;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['request_three_d_secure'] = requestThreeDSecure;
    return map;
  }

}