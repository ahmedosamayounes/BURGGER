import 'package:burgger_application/core/theming/app_colors.dart';
import 'package:burgger_application/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AppTextFormField extends StatelessWidget {
  final String? text;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final String hinttext;
  final TextStyle? hintStyle;
  final Color? backgroundColor;
  final Widget? suffixIcon;
  final bool? isObscureText;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final Function(String?) validator;

  const AppTextFormField({
    super.key,
    this.text,
    required this.hinttext,
    this.hintStyle,
    this.backgroundColor,
    this.controller,
    this.suffixIcon,
    required this.validator,
    this.focusedBorder,
    this.enabledBorder,
    this.prefixIcon,
    this.isObscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text ?? '',
          style: AppTextStyle.font14TextColorMedium.copyWith(letterSpacing: 1.5), 
        ),
        Gap(10.h),
        TextFormField(
          cursorColor: Colors.black,
          cursorHeight: 20.h,

          validator: (value) {
            return validator(value);
          },

          controller: controller,
          obscureText: isObscureText ?? false,
          decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: hintStyle ?? AppTextStyle.font16TextColorReqular,
            fillColor: backgroundColor ?? AppColors.whitelightColor,
            filled: true,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,

            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 40.w,
              vertical: 20.h,
            ),
            enabledBorder:
                enabledBorder ??
                OutlineInputBorder(borderRadius: BorderRadius.circular(35.r)),
            focusedBorder:
                focusedBorder ??
                OutlineInputBorder(borderRadius: BorderRadius.circular(35.r)),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1.3),
              borderRadius: BorderRadius.circular(16.r),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1.3),
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
        ),
      ],
    );
  }
}
