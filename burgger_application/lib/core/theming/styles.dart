import 'package:burgger_application/core/theming/app_colors.dart';
import 'package:burgger_application/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle font30WhitelightColorNormal = GoogleFonts.plusJakartaSans(
    fontSize: 30.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.whitelightColor,
  );
    static TextStyle font30WhitelightColorExtraBold = GoogleFonts.plusJakartaSans(
    fontSize: 30.sp,
    fontWeight: FontWeightHelper.extraBold,
    color: AppColors.whitelightColor,
  );


  static TextStyle font40PrimaryColorExtraBold = GoogleFonts.plusJakartaSans(
    fontSize: 40.sp,
    fontWeight: FontWeightHelper.extraBold,
    color: AppColors.primaryColor,
  );

  static TextStyle font40WhitelightColorExtraBold = GoogleFonts.plusJakartaSans(
    fontSize: 40.sp,
    fontWeight: FontWeightHelper.extraBold,
    color: AppColors.whitelightColor,
  );
  static TextStyle font18WhitelightColorMeduim = GoogleFonts.plusJakartaSans(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.whitelightColor,
  );

  static TextStyle font16TextColorMedium = GoogleFonts.plusJakartaSans(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.textColor,
  );

  static TextStyle font14TextColorMedium = GoogleFonts.plusJakartaSans(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.textColor,
  );
  static TextStyle font14BalackColorBold = GoogleFonts.plusJakartaSans(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );

  static TextStyle font16PrimaryColorBold = GoogleFonts.plusJakartaSans(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.primaryColor,
  );

  static TextStyle font16TextColorReqular = GoogleFonts.plusJakartaSans(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.hintColor,
  );
  static TextStyle font18TextColorReqular = GoogleFonts.plusJakartaSans(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.extraBold,
    color: AppColors.buttonTextColor,
  );

  static TextStyle font14TextColorReqular = GoogleFonts.plusJakartaSans(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.hintColor,
  );
  static TextStyle font16LightGreenReqular = GoogleFonts.plusJakartaSans(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.lightGreenColor,
  );
  static TextStyle font17PrimaryColorBold = GoogleFonts.plusJakartaSans(
    fontSize: 17.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.primaryColor,
  );
}
