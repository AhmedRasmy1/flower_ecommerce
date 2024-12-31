import '../data_sources/home_data_source.dart';
import '../../domain/entities/home_entity.dart';
import '../../domain/repositories/home_repo.dart';
import '../../../../core/common/api_result.dart';
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
