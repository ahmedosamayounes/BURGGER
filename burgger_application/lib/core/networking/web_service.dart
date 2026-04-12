import 'package:burgger_application/core/networking/api_constans.dart';
import 'package:burgger_application/features/cart/data/models/cart_request_model.dart';
import 'package:burgger_application/features/cart/data/models/cart_response_model.dart';
import 'package:burgger_application/features/home/data/models/categories/categories_model.dart';
import 'package:burgger_application/features/home/data/models/products/products_model.dart';
import 'package:burgger_application/features/login/data/models/login_reqeust_model.dart';
import 'package:burgger_application/features/login/data/models/login_response_model.dart';
import 'package:burgger_application/features/product_details/data/models/product_option/product_option_model.dart';
import 'package:burgger_application/features/signup/data/models/signup_request_model.dart';
import 'package:burgger_application/features/signup/data/models/signup_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

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
  @GET(ApiConstants.productsEndpoint + "/{id}")
  Future<ProductData> getProductById(@Path("id") int id);

  // Product Deatlies (Toppings)
  @GET(ApiConstants.toppingsEndpoint) 
  Future<ProductOptionModel> getToppings();

  // Product Deatlies (Side Options)
  @GET(ApiConstants.sideOptionsEndpoint) 
  Future<ProductOptionModel> getSideOptions();

  // Add to Cart Screen 
  @POST(ApiConstants.cartEndpoint)
  Future<AddCartResponseModel> addToCart(@Body() CartRequestModel cartRequestModel);




}
