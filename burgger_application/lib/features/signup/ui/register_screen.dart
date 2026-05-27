import '../../../core/shared/app_bar.dart';
import '../../../core/shared/app_button.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/styles.dart';
import '../logic/cubit/signup_cubit.dart';
import 'widgets/already_have_account_text.dart';
import 'widgets/header.dart';
import 'widgets/register_form.dart';
import 'widgets/sign_up_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBarr(
          leading: Icon(
            Icons.arrow_back,
            color: AppColors.whitelightColor,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Header(),
                  Gap(20),

                  RegisterForm(),
                  Gap(20),

                  AppButton(
                    buttonText: 'Create Account',
                    textStyle: AppTextStyle.font18TextColorReqular,
                    onPressed: () {
                      validateThenDoSignup(context);
                    },
                  ),
                  Gap(20),
                  Align(
                    alignment: Alignment.center,
                    child: AlreadyHaveAccountText(),
                  ),
                  SignupBlocListener(),
                  Gap(20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }
}
