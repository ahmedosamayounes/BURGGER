class ApiConstants {
  static const String apiBaseUrl = 'https://sonic-zdi0.onrender.com/api/';
  static const String loginEndpoint = 'login';
  static const String signUpEndpoint = 'register';
  static const String categoriesEndpoint = 'categories';
  static const String productsEndpoint = 'products';
  static const String toppingsEndpoint = 'toppings';
  static const String productsByIdEndpoint = 'products/';
  static const String sideOptionsEndpoint = 'side-options';
  static const String cartEndpoint = 'cart/add';
  static const String cartdata = 'cart';
  static const String profileEndPoint = 'profile';
    static const String profileUpdate = 'update-profile';



  

}
class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}