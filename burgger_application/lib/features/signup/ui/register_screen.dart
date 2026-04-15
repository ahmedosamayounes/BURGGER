import 'package:burgger_application/core/shared/app_button.dart';
import 'package:burgger_application/core/shared/app_logo.dart';
import 'package:burgger_application/core/theming/app_colors.dart';
import 'package:burgger_application/core/theming/styles.dart';
import 'package:burgger_application/features/signup/logic/cubit/signup_cubit.dart';
import 'package:burgger_application/features/signup/ui/widgets/already_have_account_text.dart';
import 'package:burgger_application/features/signup/ui/widgets/header.dart';
import 'package:burgger_application/features/signup/ui/widgets/register_form.dart';
import 'package:burgger_application/features/signup/ui/widgets/sign_up_bloc_listener.dart';
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
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
          leadingWidth: 0.0,
          scrolledUnderElevation: 0.0,
          leading: SizedBox.shrink(),
          title: Row(children: [AppLogo(isLowerCaseText: true, sizeText: 24)]),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 32.0),
              child: CircleAvatar(
                backgroundColor: AppColors.darkGreenColor,
                child: Icon(
                  Icons.arrow_forward_outlined,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
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
                  Gap(20.h),

                  AppButton(
                    buttonText: 'Create Account',
                    textStyle: AppTextStyle.font18TextColorReqular,
                    onPressed: () {
                      validateThenDoSignup(context);
                    },
                  ),
                  Gap(20.h),
                  Align(
                    alignment: Alignment.center,
                    child: AlreadyHaveAccountText(),
                  ),
                  SignupBlocListener(),
                  Gap(20.h),
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
