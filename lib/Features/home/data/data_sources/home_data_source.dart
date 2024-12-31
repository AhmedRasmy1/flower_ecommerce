import '../../../../core/common/api_result.dart';
import '../../domain/entities/home_entity.dart';

abstract class HomeDataSource {
  Future<Result<HomeEntity>> getHomeData();
}
