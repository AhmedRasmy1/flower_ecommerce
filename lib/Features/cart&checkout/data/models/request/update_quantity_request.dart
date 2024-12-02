// ignore_for_file: public_member_api_docs, sort_constructors_first

class UpdateQuantityRequest {
  final int quantity;

  UpdateQuantityRequest({
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'quantity': quantity,
    };
  }
}
