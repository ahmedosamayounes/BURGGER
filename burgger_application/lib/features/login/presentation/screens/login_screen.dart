import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/shared/app_button.dart';
import '../../../../core/theming/styles.dart';
import '../cubit/login_cubit.dart';
import '../widgets/brand_header.dart';
import '../widgets/dont_have_account_text.dart';
import '../widgets/email_and_password_form.dart';
import '../widgets/login_bloc_listener.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const BrandHeader(),
                  Gap(60.h),

                  const EmailAndPasswordForm(),
                  Gap(30.h),
                  AppButton(
                    buttonText: 'Log in',
                    textStyle: AppTextStyle.font18TextColorExtraBold,
                    onPressed: () {
                      _checkIfValidThenLogin(context);
                    },
                  ),
                  Gap(20.h),
                  const DontHaveAccountText(),
                  const LoginBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _checkIfValidThenLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read< LoginCubit>().emitLoginStates();
    }
  }
}
