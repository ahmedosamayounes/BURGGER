import 'package:bloc/bloc.dart';
import 'package:burgger_application/core/networking/api_result.dart';
import 'package:burgger_application/core/networking/dio_factory.dart';
import 'package:burgger_application/features/login/data/models/login_reqeust_model.dart';
import 'package:burgger_application/features/login/data/repo/login_repo.dart';
import 'package:burgger_application/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitloginstates() async {

 emit(LoginState.loading());

    final response = await loginRepo.login(
      LoginReqeustModel(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
       
        
    response.when(
      success: (loginResponse) {
        print("TOKEN FROM LOGIN = ${loginResponse.data?.token}");
          DioFactory.setToken(loginResponse.data!.token!); // 👈 هنا

        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        emit(LoginState.error(errorMessage: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
