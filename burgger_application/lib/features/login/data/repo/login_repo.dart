import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/web_service.dart';
import '../models/login_reqeust_model.dart';
import '../models/login_response_model.dart';

class LoginRepo {
  final WebService webService;
  LoginRepo(this.webService);

  Future<ApiResult<LoginResponseModel>> login(
    LoginReqeustModel loginRequestModel,
  ) async {
    try {
      final response = await webService.login(loginRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
