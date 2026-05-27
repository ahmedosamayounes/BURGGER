import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/web_service.dart';
import '../models/signup_request_model.dart';
import '../models/signup_response_model.dart';

class SignupRepo {
  final WebService webService;
  SignupRepo(this.webService);

  Future<ApiResult<SignupResponseModel>> signUp(
    SignupRequestModel signupRequestModel,
  ) async {
    try {
      final response = await webService.signup(signupRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
