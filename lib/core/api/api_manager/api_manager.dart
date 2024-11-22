import 'package:dio/dio.dart';
import 'package:flower_ecommerce/Features/auth/data/models/request/forget_password_request/reset_password_request.dart';
import 'package:flower_ecommerce/Features/auth/data/models/request/forget_password_request/verify_request.dart';
import 'package:flower_ecommerce/Features/auth/data/models/response/forget_password_response/reset_password_response.dart';
import 'package:flower_ecommerce/Features/auth/data/models/response/forget_password_response/verify_response.dart';
import 'package:flower_ecommerce/Features/auth/data/models/response/LoginResponseDto.dart';
import 'package:flower_ecommerce/Features/products/data/models/all_products.dart';
import 'package:flower_ecommerce/Features/best_seller/data/model/best_seller_response.dart';

import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../Features/auth/data/models/request/LoginModelDto.dart';
import '../../../Features/auth/data/models/request/RegisterModelDto.dart';
import '../../../Features/auth/data/models/request/forget_password_request/forget_password_request.dart';
import '../../../Features/auth/data/models/response/RegisterResponseDto.dart';
import '../../../Features/auth/data/models/response/forget_password_response/forget_password_response.dart';
import '../../../Features/categories/data/models/response/all_categories.dart';
import '../api_constants.dart';

part 'api_manager.g.dart';

@injectable
@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  @FactoryMethod()
  factory ApiService(Dio dio) =_ApiService;
  @POST(ApiConstants.signupRoute)
  Future<RegisterResponseDto> signUp(@Body() RegisterModelDto registerModelDto);


  @POST(ApiConstants.forgetPasswordRoute)
  Future<ForgetPasswordResponse> forgetPassword(@Body() ForgetPasswordRequest requestEmail);


  @POST(ApiConstants.verifyResetCode)
  Future<VerifyResponse> verifyPassword(@Body() VerifyRequest requestOtp);

  @POST(ApiConstants.loginRoute)
  Future<LoginResponseDto> login(@Body() LoginModelDto loginModelDto);

  @PUT(ApiConstants.resetPasswordRoute)
  Future<ResetPasswordResponse> resetPassword(@Body() ResetPasswordRequest requestOtp);


  @GET(ApiConstants.categories)
  Future<AllCategories> getAllCategories();
  @GET(ApiConstants.products)
  Future<AllProducts> getAllProducts();
  @GET(ApiConstants.bestSellerRoute)
  Future<BestSellerResponse> getBestSeller();

}
