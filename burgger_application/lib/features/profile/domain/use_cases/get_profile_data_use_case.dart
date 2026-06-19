import '../../../../core/networking/api_result.dart';
import '../entities/profile_entity.dart';
import '../repositories/profile_repository.dart';

class GetProfileDataUseCase {
  final ProfileRepository repository;

  GetProfileDataUseCase(this.repository);

  Future<ApiResult<ProfileEntity>> call() async {
    return await repository.getProfileData();
  }
}