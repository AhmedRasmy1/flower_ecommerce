import 'package:injectable/injectable.dart';

import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager/api_manager.dart';
import '../../../../core/common/api_result.dart';
import '../data_sourses/occasion_datasource.dart';
import '../models/occasion_response/occasion_response.dart';

@Injectable(as: OccasionOnLineDataSource)
class OccasionOnLineDataSourceImpl implements OccasionOnLineDataSource {
  final ApiService _occasionRetrofit;

  // Constructor
  OccasionOnLineDataSourceImpl(
    this._occasionRetrofit,
  );

  @override
  Future<Result<OccasionResponse?>> getOccasions() {
    return executeApi(() async {
      var response = await _occasionRetrofit.getOccasions();
      return response;
    });
  }
}
