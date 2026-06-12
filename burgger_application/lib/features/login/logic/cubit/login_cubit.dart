import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/dio_factory.dart';
import '../../data/models/login_reqeust_model.dart';
import '../../data/repo/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(LoginState.loading());

    final response = await loginRepo.login(
      LoginReqeustModel(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    if (isClosed) return;
    response.when(
      success: (loginResponse) async {
        debugPrint("Data from API: ${loginResponse.data?.name}");
        await saveUserToken(loginResponse.data?.token ?? '');
        await saveUserName(loginResponse.data?.name ?? '');

        if (isClosed) return;
        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        if (isClosed) return;
        emit(LoginState.error(errorMessage: error.apiErrorModel.message ?? ''));
      },
    );
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }

  Future<void> saveUserName(String name) async {
    await SharedPrefHelper.setData('userName', name); 
  }
}
