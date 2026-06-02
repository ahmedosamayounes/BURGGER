// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';

class AppButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;
  final Widget? icon;
  final bool isLoading;

  const AppButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonWidth,
    this.buttonHeight,
    required this.buttonText,
    required this.textStyle,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: isLoading ? null : onPressed,

      label: isLoading
          ? SizedBox(
              height: 20.h,
              width: 20.w,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2.5.w,
              ),
            )
          : Text(buttonText, style: textStyle),

      icon: isLoading
          ? const SizedBox.shrink()
          : (icon ??
                Icon(Icons.arrow_forward, color: Colors.black, size: 16.sp)),

      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 35.r),
          ),
        ),

        backgroundColor: WidgetStatePropertyAll(
          isLoading
              ? (backgroundColor ?? AppColors.primaryColor).withOpacity(0.7)
              : (backgroundColor ?? AppColors.primaryColor),
        ),

        padding: WidgetStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding?.w ?? 12.w,
            vertical: verticalPadding?.w ?? 14.h,
          ),
        ),
        fixedSize: WidgetStatePropertyAll(
          Size(buttonWidth?.w ?? double.maxFinite, buttonHeight ?? 55.h),
        ),
      ),
    );
  }
}
