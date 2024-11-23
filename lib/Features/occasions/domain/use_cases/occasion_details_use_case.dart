

import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';

import '../../data/models/occasion_response/occasion_response.dart';
import '../../data/models/occasion_response/occasion_detail_response.dart';
import '../repositories/occasion_repo.dart';

@injectable
class OccasionDetailsUseCase {
  OccasionRepo occasionRepo;

  OccasionDetailsUseCase(this.occasionRepo);



 // Future<Result<Occasion?>> invoke(String? id) {

   // return occasionRepo.getOccasionsDetailsById(id);
 // }
}
