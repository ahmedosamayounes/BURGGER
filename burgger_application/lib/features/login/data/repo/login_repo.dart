import 'package:burgger_application/core/networking/api_error_handler.dart';
import 'package:burgger_application/core/networking/api_result.dart';
import 'package:burgger_application/core/networking/web_service.dart';
import 'package:burgger_application/features/login/data/models/login_reqeust_model.dart';
import 'package:burgger_application/features/login/data/models/login_response_model.dart';

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
