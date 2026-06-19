import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/web_service.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/entities/profile_request_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import '../models/profile_request_model.dart';

class ProfileRepoImpl implements ProfileRepository {
  final WebService webService;

  ProfileRepoImpl(this.webService);

  // Get Profile
  @override
  Future<ApiResult<ProfileEntity>> getProfileData() async {
    try {
      final response = await webService.getProfileData();
      final profileData = response.data;
      final entity = ProfileEntity(
        name: profileData?.name ?? '',
        email: profileData?.email ?? '',
        address: profileData?.address ?? '',
        image: profileData?.image ?? '',
        visa: profileData?.visa,
      );
      return ApiResult.success(entity);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  // Update Profile
  @override
  Future<ApiResult<ProfileEntity>> updateProfileData(
    ProfileRequestEntity request,
  ) async {
    try {
      final requestModel = ProfileRequestModel(
        name: request.name,
        email: request.email,
        address: request.address,
        image: request.image,
        visa: request.visa,
        phone: request.phone,
      );
      final response = await webService.updateProfileData(requestModel);
      final profileData = response.data;
      final entity = ProfileEntity(
        name: profileData?.name ?? '',
        email: profileData?.email ?? '',
        address: profileData?.address ?? '',
        image: profileData?.image ?? '',
        visa: profileData?.visa,
      );
      
      return ApiResult.success(entity);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
