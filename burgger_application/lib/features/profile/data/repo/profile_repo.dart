import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/web_service.dart';
import '../models/profile_request_model.dart';
import '../models/profile_response_model.dart';

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
