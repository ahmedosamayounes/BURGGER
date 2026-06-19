import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/dio_factory.dart';
import '../../domain/use_cases/login_use_case.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase) : super(LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(LoginState.loading());

    final response = await _loginUseCase(
      email: emailController.text,
      password: passwordController.text,
    );

    if (isClosed) return;

    response.when(
      success: (userEntity) async {
        debugPrint("Data from API: ${userEntity.name}");
        await saveUserToken(userEntity.token);
        await saveUserName(userEntity.name);

        if (isClosed) return;
        emit(LoginState.success(userEntity));
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