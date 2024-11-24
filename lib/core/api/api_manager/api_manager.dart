import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../Features/auth/data/models/request/login_model_dto.dart';
import '../../../Features/auth/data/models/request/register_model_dto.dart';
import '../../../Features/auth/data/models/request/forget_password_request/forget_password_request.dart';
import '../../../Features/auth/data/models/request/forget_password_request/reset_password_request.dart';
import '../../../Features/auth/data/models/request/forget_password_request/verify_request.dart';
import '../../../Features/auth/data/models/response/login_response_dto.dart';
import '../../../Features/auth/data/models/response/register_response_dto.dart';
import '../../../Features/auth/data/models/response/forget_password_response/forget_password_response.dart';
import '../../../Features/auth/data/models/response/forget_password_response/reset_password_response.dart';
import '../../../Features/auth/data/models/response/forget_password_response/verify_response.dart';
import '../../../Features/best_seller/data/model/best_seller_response.dart';
import '../../../Features/categories/data/models/response/all_categories.dart';
import '../../../Features/home/data/models/home_model.dart';
import '../../../Features/occasions/data/models/occasion_response/occasion_response.dart';
import '../../../Features/products/data/models/all_products.dart';
import '../../../Features/products_details/data/models/response/product_details_dto.dart';
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
  Future<ForgetPasswordResponse> forgetPassword(
      @Body() ForgetPasswordRequest requestEmail);
  @POST(ApiConstants.verifyResetCode)
  Future<VerifyResponse> verifyPassword(@Body() VerifyRequest requestOtp);
  @POST(ApiConstants.loginRoute)
  Future<LoginResponseDto> login(@Body() LoginModelDto loginModelDto);
  @PUT(ApiConstants.resetPasswordRoute)
  Future<ResetPasswordResponse> resetPassword(
      @Body() ResetPasswordRequest requestOtp);
  @GET("${ApiConstants.productDetailsRoute}/{productId}")
  Future<ProductDetailsDto> getProductDetails(
      @Path("productId") String productId);
  @GET(ApiConstants.categories)
  Future<AllCategories> getAllCategories();
  @GET(ApiConstants.products)
  Future<AllProducts> getAllProducts();
  @GET(ApiConstants.bestSellerRoute)
  Future<BestSellerResponse> getBestSeller();
  @GET(ApiConstants.homeEndPointApi)
  Future<HomeModel> getHomeData();
  @GET('https://flower.elevateegy.com/api/v1/occasions')
  Future<OccasionResponse?> getOccasions();
}
