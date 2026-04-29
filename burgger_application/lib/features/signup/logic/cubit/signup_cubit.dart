import 'package:bloc/bloc.dart';
import 'package:burgger_application/core/networking/api_result.dart';
import 'package:burgger_application/features/signup/data/models/signup_request_model.dart';
import 'package:burgger_application/features/signup/data/models/signup_response_model.dart';
import 'package:burgger_application/features/signup/data/repo/signup_repo.dart';
import 'package:burgger_application/features/signup/logic/cubit/sign_up_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class SignupCubit extends Cubit<SignUpState> {
  final SignupRepo signupRepo;

  SignupCubit(this.signupRepo) : super(SignUpState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignupStates() async {
    emit(const SignUpState.signupLoading());

    final response = await signupRepo.signUp(
      SignupRequestModel(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
      ),
    );

    response.when(
      success: (signupResponseModel) {
        emit(SignUpState.signupSuccess(signupResponseModel));
      },
      failure: (error) {
        emit(SignUpState.signupError(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
