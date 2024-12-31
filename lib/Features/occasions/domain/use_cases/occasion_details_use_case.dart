import 'package:injectable/injectable.dart';

import '../repositories/occasion_repo.dart';

@injectable
class OccasionDetailsUseCase {
  OccasionRepo occasionRepo;

  OccasionDetailsUseCase(this.occasionRepo);

  // Future<Result<Occasion?>> invoke(String? id) {

  // return occasionRepo.getOccasionsDetailsById(id);
  // }
}
