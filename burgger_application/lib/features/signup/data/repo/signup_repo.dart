import 'package:burgger_application/core/networking/api_error_handler.dart';
import 'package:burgger_application/core/networking/api_result.dart';
import 'package:burgger_application/core/networking/web_service.dart';
import 'package:burgger_application/features/signup/data/models/signup_request_model.dart';
import 'package:burgger_application/features/signup/data/models/signup_response_model.dart';

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
