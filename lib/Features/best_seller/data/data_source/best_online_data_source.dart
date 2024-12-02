import '../../../../../../../core/common/api_result.dart';
import '../../domain/entities/best_seller_entity.dart';

abstract class BestOnLineDataSource {
  Future<Result<List<BestSellerEntity>?>> getBestSeller();
}
