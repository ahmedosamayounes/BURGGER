import 'package:burgger_application/core/theming/app_colors.dart';
import 'package:burgger_application/core/theming/font_weight_helper.dart';
import 'package:burgger_application/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLogo extends StatelessWidget {
  final bool isLowerCaseText;
  final int sizeText;

  const AppLogo({
    super.key,
    required this.isLowerCaseText,
    required this.sizeText,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      isLowerCaseText ? 'PureBurger' : 'PureBurger'.toUpperCase(),
      style: TextStyle(
        fontSize: sizeText.sp,
        fontWeight: FontWeightHelper.extraBold,
        color: AppColors.primaryColor,
        fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
