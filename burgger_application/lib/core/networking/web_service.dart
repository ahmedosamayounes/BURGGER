import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../features/cart/data/models/add_cart_response_model.dart';
import '../../features/cart/data/models/cart_request_model.dart';
import '../../features/cart/data/models/cart_response_model.dart';
import '../../features/home/data/models/categories/categories_model.dart';
import '../../features/home/data/models/products/products_model.dart';
import '../../features/login/data/models/login_reqeust_model.dart';
import '../../features/login/data/models/login_response_model.dart';
import '../../features/product_details/data/models/product_option/product_option_model.dart';
import '../../features/profile/data/models/profile_request_model.dart';
import '../../features/profile/data/models/profile_response_model.dart';
import '../../features/sign_up/data/models/signup_request_model.dart';
import '../../features/sign_up/data/models/signup_response_model.dart';
import 'api_constans.dart';

part 'web_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class WebService {
  factory WebService(Dio dio, {String baseUrl}) = _WebService;

  // Login Screen
  @POST(ApiConstants.loginEndpoint)
  Future<LoginResponseModel> login(@Body() LoginReqeustModel loginReqeustModel);

  // SignUp Screen
  @POST(ApiConstants.signUpEndpoint)
  Future<SignupResponseModel> signup(
    @Body() SignupRequestModel signupRequestModel,
  );

  //Home Screen (Categories)
  @GET(ApiConstants.categoriesEndpoint)
  Future<CategoriesModel> getCategories();

  // Home Screen (Products)
  @GET(ApiConstants.productsEndpoint)
  Future<ProductsModel> getProducts();

  // Get Product by id
  @GET("${ApiConstants.productsEndpoint}/{id}")
  Future<ProductData> getProductById(@Path("id") int id);

  // Product Deatlies Screen  (Toppings)
  @GET(ApiConstants.toppingsEndpoint)
  Future<ProductOptionModel> getToppings();

  // Product Deatlies Screen (Side Options)
  @GET(ApiConstants.sideOptionsEndpoint)
  Future<ProductOptionModel> getSideOptions();

  // Cart Screen (Add to Cart)
  @POST(ApiConstants.cartEndpoint)
  Future<AddCartResponseModel> addToCart(
    @Body() CartRequestModel cartRequestModel,
  );

  //Cart Screen ( Get Cart Data )
  @GET(ApiConstants.cartdata)
  Future<CartResponseModel> getCart();

  // Cart Screen (deleter from cart)
  @DELETE("${ApiConstants.deleteItemFromCart}/{id}")
  Future<void> deleteFromCart(@Path("id") int id);

  // Profile Screen (Get Profile Data)
  @GET(ApiConstants.profileEndPoint)
  Future<ProfileResponseModel> getProfileData();

  // Profile Screen (Update Profile Data)
  @POST(ApiConstants.profileUpdate)
  Future<ProfileResponseModel> updateProfileData(
    @Body() ProfileRequestModel profileRequestModel,
  );
}
