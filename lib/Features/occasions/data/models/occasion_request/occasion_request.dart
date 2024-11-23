import 'package:json_annotation/json_annotation.dart';

part 'occasion_request.g.dart';

@JsonSerializable()
class OccasionRequest {
  OccasionRequest({
    this.id,
  });

  factory OccasionRequest.fromJson(Map<String, dynamic> json) =>
      _$OccasionRequestFromJson(json);

  String? id;

  Map<String, dynamic> toJson() => _$OccasionRequestToJson(this);
}
