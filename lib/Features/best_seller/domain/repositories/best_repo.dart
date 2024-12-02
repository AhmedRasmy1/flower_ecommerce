import '../../../../../../../core/common/api_result.dart';
import '../entities/best_seller_entity.dart';

abstract class BestRepo {
  Future<Result<List<BestSellerEntity>?>> getBestSeller();
}
