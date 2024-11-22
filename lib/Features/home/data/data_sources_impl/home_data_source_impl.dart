import 'package:flower_ecommerce/Features/home/data/data_sources/home_data_source.dart';
import 'package:flower_ecommerce/Features/home/domain/entities/home_entity.dart';
import 'package:flower_ecommerce/core/api/api_extentions.dart';
import 'package:flower_ecommerce/core/api/api_manager/api_manager.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeDataSource)
class HomeDataSourceImpl implements HomeDataSource {
  ApiService apiService;
  HomeDataSourceImpl(this.apiService);
  @override
  Future<Result<HomeEntity>> getHomeData() {
    return executeApi(() async {
      var response = await apiService.getHomeData();
      var data = response.toHomeEntity();
      return data;
    });
  }
}
