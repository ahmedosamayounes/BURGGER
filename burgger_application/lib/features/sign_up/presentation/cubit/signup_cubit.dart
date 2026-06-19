import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/networking/api_result.dart';
import '../../domain/use_cases/sign_up_use_cases.dart';
import 'sign_up_state.dart';

class SignupCubit extends Cubit<SignUpState> {
  final SignupUseCase _signupUseCase;

  SignupCubit(this._signupUseCase) : super(SignUpState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignupStates() async {
    emit(const SignUpState.signupLoading());

    final response = await _signupUseCase(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: passwordController.text,
    );
    if (isClosed) return;
    response.when(
      success: (userEntity) {
        if (isClosed) return;
        emit(SignUpState.signupSuccess(userEntity));
      },
      failure: (error) {
        if (isClosed) return;
        emit(SignUpState.signupError(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
