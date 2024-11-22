import 'package:flower_ecommerce/Features/home/domain/entities/home_entity.dart';
import 'package:flower_ecommerce/core/common/api_result.dart';

abstract class HomeRepo {
  Future<Result<HomeEntity>> getHomeData();
}
