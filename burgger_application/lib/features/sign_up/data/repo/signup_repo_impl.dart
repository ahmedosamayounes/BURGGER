import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/signup_repository.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/web_service.dart';
import '../models/signup_request_model.dart';

class SignupRepoImpl implements SignupRepository {
  final WebService webService;
  SignupRepoImpl(this.webService);

  @override
  Future<ApiResult<UserEntity>> signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
    String? image,
  }) async {
    try {
      final response = await webService.signup(
        SignupRequestModel(
          name: name,
          email: email,
          phone: phone,
          password: password,
          image: image,
        ),
      );
      final userEntity = UserEntity(
        token: response.data?.token ?? '',
        name: response.data?.name ?? '',
        email: response.data?.email ?? '',
        image: response.data?.image ?? '',
      );
      return ApiResult.success(userEntity);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
