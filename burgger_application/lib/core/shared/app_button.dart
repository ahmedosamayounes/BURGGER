import 'package:burgger_application/core/theming/app_colors.dart';
import 'package:burgger_application/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback
  onPressed; // to handle button press events , function that takes no arguments and returns void
  final Widget? icon;
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
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      label: Text(buttonText, style: textStyle),
      icon: icon ?? Icon(Icons.arrow_forward, color: Colors.black , size: 16.sp,),

      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 35),
          ),
        ),

        backgroundColor: WidgetStatePropertyAll(
          backgroundColor ?? AppColors.primaryColor,
        ),

        padding: WidgetStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding?.w ?? 12.w,
            vertical: verticalPadding?.w ?? 14.h,
          ),
        ),
        fixedSize: WidgetStatePropertyAll(
          Size(buttonWidth?.w ?? double.maxFinite, buttonHeight ?? 60.h),
          // to make the button take the full width of its parent by default
        ),
      ),
    );
  }
}
