import '../../../../core/networking/api_result.dart';
import '../entities/user_entity.dart';

abstract class LoginRepository {
  Future<ApiResult<UserEntity>> login({
    required String email,
    required String password,
  });
}