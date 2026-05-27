import 'package:bloc/bloc.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/models/signup_request_model.dart';
import '../../data/repo/signup_repo.dart';
import 'sign_up_state.dart';
import 'package:flutter/material.dart';

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
    if (isClosed) return;
    response.when(
      success: (signupResponseModel) {
        if (isClosed) return;
        emit(SignUpState.signupSuccess(signupResponseModel));
      },
      failure: (error) {
        if (isClosed) return;
        emit(SignUpState.signupError(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
