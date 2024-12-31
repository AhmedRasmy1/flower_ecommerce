import '../../../../core/common/api_result.dart';

import '../models/occasion_response/occasion_response.dart';

abstract class OccasionOnLineDataSource {
  Future<Result<OccasionResponse?>> getOccasions();
}
