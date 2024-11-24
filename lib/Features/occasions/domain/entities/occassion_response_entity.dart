import '../../../categories/data/models/response/all_categories.dart';
import '../../../home/data/models/occasion.dart';

class OccassionResponseEntity {
  OccassionResponseEntity({
    required this.metadata,
    required this.occasions,
    required this.message,
  });

  Metadata metadata;
  List<Occasion> occasions;
  String message;
}
