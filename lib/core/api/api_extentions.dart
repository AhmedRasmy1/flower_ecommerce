import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import '../common/api_result.dart';
import '../common/custom_exception.dart';

Future<Result<T>> executeApi<T>(Future<T> Function() apiCall) async {
  try {
    var result = await apiCall.call();
    return Success(result);
  } on TimeoutException catch (_) {
    return Fail(NoInternetError());
  } on DioException catch (ex) {
    // print(ex.response?.data['error']);
    if (ex.response != null) {
      print("Status Code: ${ex.response?.statusCode}");
      print("Response Data: ${ex.response?.data}");
      return Fail(ServerError(
        ex.response?.statusCode,
        ex.response?.data['error'] ?? "Unexpected error",
      ));
    } else {
      print("=====================================");
      print("Request Error: ${ex.message}");
      print("Request Details: ${ex.requestOptions}");
      print(ex.response);
      return Fail(DioHttpException(ex));
    }
  } on IOException catch (_) {
    return Fail(NoInternetError());
  } on Exception catch (ex) {
    return Fail(ex);
  }
}
