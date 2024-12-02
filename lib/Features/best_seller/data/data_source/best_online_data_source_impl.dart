import 'package:injectable/injectable.dart';

import '../../../../../../../core/api/api_extentions.dart';
import '../../../../../../../core/api/api_manager/api_manager.dart';
import '../../../../../../../core/common/api_result.dart';
import '../../domain/entities/best_seller_entity.dart';
import 'best_online_data_source.dart';

@Injectable(as: BestOnLineDataSource)
class BestOnLineDataSourceImpl implements BestOnLineDataSource {
  final ApiService _homeRetrofit;

  BestOnLineDataSourceImpl(this._homeRetrofit);

  @override
  Future<Result<List<BestSellerEntity>?>> getBestSeller() {
    return executeApi(() async {
      var response = await _homeRetrofit.getBestSeller();
      var listOfBestSeller = response.bestSeller;
      List<BestSellerEntity>? listBestSellerEntity = listOfBestSeller
          ?.map((itemBestSeller) => itemBestSeller.toBestSellerEntity())
          .toList();

      return listBestSellerEntity;
    });
  }
}
