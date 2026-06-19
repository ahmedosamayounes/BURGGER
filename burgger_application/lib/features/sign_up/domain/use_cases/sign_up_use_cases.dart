import '../../../../core/networking/api_result.dart';
import '../entities/user_entity.dart';
import '../repositories/signup_repository.dart';

class SignupUseCase {
  final SignupRepository repository;

  SignupUseCase(this.repository);

  Future<ApiResult<UserEntity>> call({
    required String name,
    required String email,
    required String phone,
    required String password,
    String? image,
  }) async {
    return await repository.signUp(
      name: name,
      email: email,
      phone: phone,
      password: password,
      image: image,
    );
  }
}
