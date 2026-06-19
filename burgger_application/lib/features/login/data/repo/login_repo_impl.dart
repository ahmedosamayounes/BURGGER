import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/web_service.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/login_repository.dart';
import '../models/login_reqeust_model.dart';

class LoginRepoImpl implements LoginRepository {
  final WebService webService;
  LoginRepoImpl(this.webService);

  @override
  Future<ApiResult<UserEntity>> login({required String email, required String password}) 
    async {
    try {
      final response = await webService.login(LoginReqeustModel(email: email , password: password));
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

  

