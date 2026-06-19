import '../../../../core/networking/api_result.dart';
import '../entities/user_entity.dart';
import '../repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  Future<ApiResult<UserEntity>> call({
    required String email,
    required String password,
  }) async {
    return await repository.login(email: email, password: password);
  }
}