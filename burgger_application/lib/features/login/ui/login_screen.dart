import 'package:burgger_application/core/shared/app_button.dart';
import 'package:burgger_application/core/shared/app_text_form_field.dart';
import 'package:burgger_application/core/theming/app_colors.dart';
import 'package:burgger_application/core/theming/styles.dart';
import 'package:burgger_application/features/login/logic/cubit/login_cubit.dart';
import 'package:burgger_application/features/login/logic/cubit/login_state.dart';
import 'package:burgger_application/features/login/ui/widgets/bloc_listener_login.dart';
import 'package:burgger_application/features/login/ui/widgets/brand_header.dart';
import 'package:burgger_application/features/login/ui/widgets/dont_have_account_text.dart';
import 'package:burgger_application/features/login/ui/widgets/email_and_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BrandHeader(),
                  Gap(60.h),

                  EmailAndPasswordForm(),
                  Gap(30.h),
                  AppButton(
                    icon: SizedBox.shrink(),
                    buttonText: 'Log in',
                    textStyle: AppTextStyle.font18TextColorReqular,
                    onPressed: () {
                      checkIfValidThenLogin(context);
                    },
                    
                  ),
                  Gap(20.h),
                  DontHaveAccountText(),
                  BlocListenerLogin(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void checkIfValidThenLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitloginstates();
    }
  }
}
