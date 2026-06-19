import '../../../../core/networking/api_result.dart';
import '../entities/user_entity.dart';

abstract class SignupRepository {
  Future<ApiResult<UserEntity>> signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
    String? image,
  });
}