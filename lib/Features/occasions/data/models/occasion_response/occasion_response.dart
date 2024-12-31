import 'package:json_annotation/json_annotation.dart';

import 'occasion_detail_response.dart';

part 'occasion_response.g.dart';

@JsonSerializable()
class OccasionResponse {
  OccasionResponse({
    this.metadata,
    this.occasions,
    this.message,
  });

//   OccasionResponse({
//     required this.metadata,
//     required this.occasions,
//     required this.message,
//   });

  factory OccasionResponse.fromJson(Map<String, dynamic> json) =>
      _$OccasionResponseFromJson(json);

  Metadata? metadata;
  List<Occasion>? occasions;
  String? message;

//   Metadata metadata;
//   List<Occasion> occasions;
//   String message;

  Map<String, dynamic> toJson() => _$OccasionResponseToJson(this);
}

class Metadata {
  Metadata({
    required this.numberOfPages,
    required this.limit,
    required this.currentPage,
  });

  int numberOfPages;
  int limit;
  int currentPage;

  factory Metadata.fromJson(Map<dynamic, dynamic> json) => Metadata(
        numberOfPages: json["numberOfPages"],
        limit: json["limit"],
        currentPage: json["currentPage"],
      );

  Map<dynamic, dynamic> toJson() => {
        "numberOfPages": numberOfPages,
        "limit": limit,
        "currentPage": currentPage,
      };
}
