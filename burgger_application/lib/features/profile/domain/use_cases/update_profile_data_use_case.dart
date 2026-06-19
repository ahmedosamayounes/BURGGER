import '../../../../core/networking/api_result.dart';
import '../entities/profile_entity.dart';
import '../entities/profile_request_entity.dart';
import '../repositories/profile_repository.dart';

class UpdateProfileDataUseCase {
  final ProfileRepository repository;

  UpdateProfileDataUseCase(this.repository);

  Future<ApiResult<ProfileEntity>> call(ProfileRequestEntity request) async {
    return await repository.updateProfileData(request);
  }
}