import 'package:dio/dio.dart';
import 'package:flower_ecommerce/Features/address/saved_address/data/models/response/address_dto.dart';
import 'package:flower_ecommerce/Features/cart&checkout/data/models/request/update_quantity_request.dart';
import 'package:flower_ecommerce/Features/cart&checkout/data/models/response/checkout/address_response.dart';
import 'package:flower_ecommerce/Features/cart&checkout/data/models/response/delete_product_response/delete_product_response.dart';
import 'package:flower_ecommerce/Features/cart&checkout/data/models/response/fetch_user_cart_response/fetch_user_cart_response.dart';
import 'package:flower_ecommerce/Features/cart&checkout/data/models/response/update_product_quantity/update_product_quantity.dart';
import 'package:flower_ecommerce/core/common/add_to_cart/data/models/request/add_to_cart_req_body.dart';
import 'package:flower_ecommerce/core/common/add_to_cart/data/models/response/add_to_product_res_model/add_to_product_res_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../Features/add_address/data/models/request/add_address_model.dart';
import '../../../Features/add_address/data/models/response/AddAddressResponse.dart';
import '../../../Features/auth/data/models/request/forget_password_request/forget_password_request.dart';
import '../../../Features/auth/data/models/request/forget_password_request/reset_password_request.dart';
import '../../../Features/auth/data/models/request/forget_password_request/verify_request.dart';
import '../../../Features/auth/data/models/request/login_model_dto.dart';
import '../../../Features/auth/data/models/request/register_model_dto.dart';
import '../../../Features/auth/data/models/response/forget_password_response/forget_password_response.dart';
import '../../../Features/auth/data/models/response/forget_password_response/reset_password_response.dart';
import '../../../Features/auth/data/models/response/forget_password_response/verify_response.dart';
import '../../../Features/auth/data/models/response/login_response_dto.dart';
import '../../../Features/auth/data/models/response/logout_response_dto.dart';
import '../../../Features/auth/data/models/response/register_response_dto.dart';
import '../../../Features/best_seller/data/model/best_seller_response.dart';
import '../../../Features/categories/data/models/response/all_categories.dart';
import '../../../Features/edit_profile/data/models/edit_profile.dart';
import '../../../Features/home/data/models/home_model.dart';
import '../../../Features/occasions/data/models/occasion_response/occasion_response.dart';
import '../../../Features/products/data/models/all_products.dart';
import '../../../Features/products_details/data/models/response/product_details_dto.dart';
import '../../../Features/profile/data/model/profile_response.dart';
import '../../../Features/profile_reset_password/data/model/change_password_request.dart';
import '../../../Features/profile_reset_password/data/model/change_password_response.dart';
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

  @GET(ApiConstants.logoutRoute)
  Future<LogoutResponseDto> logout(@Header("Authorization") String token);

  @PATCH(ApiConstants.changePasswordRoute)
  Future<ChangePasswordResponse> changePassword(
      @Body() ChangePasswordRequest changePasswordRequest,
      @Header("Authorization") String token);

  @GET("https://flower.elevateegy.com/api/v1/auth/profile-data")
  Future<ProfileResponse?> getProfileData(
      @Header("Authorization") String token);

  @PUT(ApiConstants.editProfileRoute)
  Future<EditProfile> editProfile(
    @Header("Authorization") String token,
    @Field("firstName") String? firstName,
    @Field("lastName") String? lastName,
    @Field("email") String? email,
    @Field("phone") String? phone,
  );

  @GET(ApiConstants.cartEndPoint)
  Future<FetchUserCartResponse?> fetchUserCart(
    @Header("Authorization") String token,
  );

  @PUT("${ApiConstants.cartEndPoint}/{productId}")
  Future<UpdateProductQuantityResponse?> updateProductQuantity(
    @Body() UpdateQuantityRequest updateQuantityRequest,
    @Path() String productId,
    @Header("Authorization") String token,
  );

  @DELETE("${ApiConstants.cartEndPoint}/{productId}")
  Future<DeleteProductResponse?> deleteProductFromCart(
    @Path() String productId,
    @Header("Authorization") String token,
  );

  @PATCH(ApiConstants.addressesEndPoint)
  Future<AddAddressResponse?> addAddress(
    @Body() AddAddressRequest addAddressRequest,
    @Header("Authorization") String token,
  );

  @GET(ApiConstants.addressEndPoint)
  Future<AllAddressesDto> getAddresses(
    @Header("Authorization") String token,
  );

  @DELETE("${ApiConstants.addressEndPoint}/{addressId}")
  Future<AllAddressesDto> removeAddress(
    @Header("Authorization") String token,
    @Path() String addressId,
  );
  @POST(ApiConstants.cartEndPoint)
  Future<AddToCartResModel?> addProductToCart(
    @Body() AddToCartReqBody addToCartBody,
    @Header("Authorization") String token,
  );
  @GET(ApiConstants.addressesEndPoint)
  Future<AddressResponse?> getUserAddresses(
    @Header("Authorization") String token,
  );
}
