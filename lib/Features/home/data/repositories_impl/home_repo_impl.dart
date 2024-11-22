import 'package:flower_ecommerce/Features/home/data/data_sources/home_data_source.dart';
import 'package:flower_ecommerce/Features/home/domain/entities/home_entity.dart';
import 'package:flower_ecommerce/Features/home/domain/repositories/home_repo.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  HomeDataSource homeDataSource;
  HomeRepoImpl(this.homeDataSource);
  @override
  Future<Result<HomeEntity>> getHomeData() {
    return homeDataSource.getHomeData();
  }
}
