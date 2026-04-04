import 'package:burgger_application/core/helpers/app_regex.dart';
import 'package:burgger_application/core/shared/app_text_form_field.dart';
import 'package:burgger_application/core/theming/app_colors.dart';
import 'package:burgger_application/features/login/ui/widgets/paswword_validations.dart';
import 'package:burgger_application/features/signup/logic/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignupCubit>().passwordController;
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
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<SignupCubit>().nameController,
            text: 'Full Name',
            hinttext: 'Julian Vane',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
            },
            backgroundColor: AppColors.darkGreenColor,
            prefixIcon: Icon(
              Icons.person_2_outlined,
              size: 22,
              color: AppColors.hintColor,
            ),
          ),
          Gap(20.h),
          AppTextFormField(
            controller: context.read<SignupCubit>().emailController,
            text: 'Email Address',
            hinttext: 'concierge@pureburger.com',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email address';
              }
            },
            backgroundColor: AppColors.darkGreenColor,
            prefixIcon: Icon(
              Icons.email_outlined,
              size: 22,
              color: AppColors.hintColor,
            ),
          ),
          Gap(20.h),
          AppTextFormField(
            controller: context.read<SignupCubit>().phoneController,
            text: 'Phone',
            hinttext: '+1 (555) 000-1234',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone number';
              }
            },
            backgroundColor: AppColors.darkGreenColor,
            prefixIcon: Icon(Icons.phone, size: 22, color: AppColors.hintColor),
          ),
          Gap(20.h),
          AppTextFormField(
            controller: context.read<SignupCubit>().passwordController,
            text: 'Password',
            hinttext: '••••••••••••',
            isObscureText: isPasswordObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),

            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
            backgroundColor: AppColors.darkGreenColor,
            prefixIcon: Icon(Icons.lock, size: 22, color: AppColors.hintColor),
          ),
          Gap(24.h),
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
}
