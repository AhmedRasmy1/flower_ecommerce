import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../../domain/repositories/occasion_repo.dart';
import '../data_sourses/occasion_datasource.dart';

import '../models/occasion_response/occasion_response.dart';

@Injectable(as: OccasionRepo)
class OccasionRepoImpl implements OccasionRepo {
  OccasionOnLineDataSource onLineDataSource;

  OccasionRepoImpl(
    this.onLineDataSource,
  );

  @override
  Future<Result<OccasionResponse?>> getOccasions() {
    return onLineDataSource.getOccasions();
  }

  /* Future<Result<Occasion?>> getOccasionsDetailsById(String? id) {
    return onLineDataSource.getOccasionsDetailsById(id);
  }*/
}
