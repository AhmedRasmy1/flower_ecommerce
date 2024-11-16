import 'package:dio/dio.dart';
import 'package:flower_ecommerce/Features/auth/data/models/request/forget_password_request/verify_request.dart';
import 'package:flower_ecommerce/Features/auth/data/models/response/forget_password_response/verify_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../Features/auth/data/models/request/RegisterModelDto.dart';
import '../../../Features/auth/data/models/request/forget_password_request/forget_password_request.dart';
import '../../../Features/auth/data/models/response/RegisterResponseDto.dart';
import '../../../Features/auth/data/models/response/forget_password_response/forget_password_response.dart';
import '../api_constants.dart';
part 'api_manager.g.dart';

@injectable
@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {

  @FactoryMethod()
  factory ApiService(Dio dio) = _ApiService;

  @POST(ApiConstants.signupRoute)
  Future<RegisterResponseDto> signUp(@Body() RegisterModelDto registerModelDto);

  @POST(ApiConstants.forgetPasswordRoute)
  Future<ForgetPasswordResponse> forgetPassword(@Body() ForgetPasswordRequest requestEmail);


  @POST(ApiConstants.verifyResetCode)
  Future<VerifyResponse> verifyPassword(@Body() VerifyRequest requestOtp);

}
