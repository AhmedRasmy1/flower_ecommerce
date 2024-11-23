import '../../../../core/common/api_result.dart';

import '../../data/models/occasion_response/occasion_response.dart';
import '../../data/models/occasion_response/occasion_detail_response.dart';

abstract class OccasionRepo{


  Future<Result<OccasionResponse?>> getOccasions();

 // Future<Result<Occasion?>> getOccasionsDetailsById(String? id);

}