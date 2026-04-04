import 'package:burgger_application/core/helpers/app_regex.dart';
import 'package:burgger_application/core/shared/app_text_form_field.dart';
import 'package:burgger_application/core/theming/app_colors.dart';
import 'package:burgger_application/features/login/logic/cubit/login_cubit.dart';
import 'package:burgger_application/features/login/ui/widgets/paswword_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class EmailAndPasswordForm extends StatefulWidget {
  const EmailAndPasswordForm({super.key});

  @override
  State<EmailAndPasswordForm> createState() => _EmailAndPasswordFormState();
}

class _EmailAndPasswordFormState extends State<EmailAndPasswordForm> {
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  // final fromKey = GlobalKey<FormState>();
  bool isObscureText = true;
  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            prefixIcon: Icon(
              Icons.email_outlined,
              size: 22,
              color: AppColors.hintColor,
            ),
            text: 'EMAIL OR USERNAME',
            hinttext: 'chef@pureburger.com',
            controller: context.read<LoginCubit>().emailController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          Gap(20.h),
          AppTextFormField(
            text: 'PASSWORD',
            prefixIcon: Icon(Icons.lock_outline , size: 22, color: AppColors.hintColor,),
            hinttext: '********',
            controller: context.read<LoginCubit>().passwordController,
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
                size: 22,
                color: AppColors.hintColor,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
          ),
          Gap(8.h),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Forgot Password?',
              style: TextStyle(color: AppColors.secoundryColor),
            ),
          ),

          Gap(5.h),
          PasswordValidations(
            hasLowerCase: hasLowercase,
            hasUpperCase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
