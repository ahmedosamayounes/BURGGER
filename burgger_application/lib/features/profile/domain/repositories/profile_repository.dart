import '../../../../core/networking/api_result.dart';
import '../entities/profile_entity.dart';
import '../entities/profile_request_entity.dart';

abstract class ProfileRepository {
  Future<ApiResult<ProfileEntity>> getProfileData();
  Future<ApiResult<ProfileEntity>> updateProfileData(ProfileRequestEntity request);
}