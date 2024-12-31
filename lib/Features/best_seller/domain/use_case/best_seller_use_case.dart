import 'package:injectable/injectable.dart';

import '../../../../../../../core/common/api_result.dart';
import '../entities/best_seller_entity.dart';
import '../repositories/best_repo.dart';

@injectable
class BestSellerUseCase {
  BestRepo bestRepo;

  BestSellerUseCase(this.bestRepo);

  Future<Result<List<BestSellerEntity>?>> invoke() {
    return bestRepo.getBestSeller();
  }
}
