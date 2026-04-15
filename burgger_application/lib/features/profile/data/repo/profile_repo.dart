import 'package:burgger_application/core/networking/api_error_handler.dart';
import 'package:burgger_application/core/networking/api_result.dart';
import 'package:burgger_application/core/networking/web_service.dart';
import 'package:burgger_application/features/profile/data/models/profile_request_model.dart';
import 'package:burgger_application/features/profile/data/models/profile_response_model.dart';

class ProfileRepo {
  final WebService webService;
  ProfileRepo(this.webService);

  Future<ApiResult<ProfileResponseModel>> getProfileData() async {
    try {
      final response = await webService.getProfileData();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ProfileResponseModel>> updateProfileData(
    ProfileRequestModel profileRequestModel,
  ) async {
    try {
      final response = await webService.updateProfileData(profileRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
