import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';

import '../../data/models/occasion_response/occasion_response.dart';
import '../repositories/occasion_repo.dart';

@injectable
class OccasionUseCase {
  OccasionRepo occasionRepo;

  OccasionUseCase(this.occasionRepo);

  Future<Result<OccasionResponse?>> getOccasions() {
    return occasionRepo.getOccasions();
  }
}
