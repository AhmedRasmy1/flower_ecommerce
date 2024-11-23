

import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';

import '../models/occasion_response/occasion_response.dart';
import '../models/occasion_response/occasion_detail_response.dart';

abstract class OccasionOnLineDataSource {

Future<Result<OccasionResponse?>> getOccasions();


}