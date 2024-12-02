import 'package:injectable/injectable.dart';

import '../../../../../../../core/common/api_result.dart';
import '../../domain/entities/best_seller_entity.dart';
import '../../domain/repositories/best_repo.dart';
import '../data_source/best_online_data_source.dart';

@Injectable(as: BestRepo)
class BestRepoImpl implements BestRepo {
  BestOnLineDataSource bestOnLineDataSource;

  BestRepoImpl(
    this.bestOnLineDataSource,
  );

  @override
  Future<Result<List<BestSellerEntity>?>> getBestSeller() {
    return bestOnLineDataSource.getBestSeller();
  }
}
