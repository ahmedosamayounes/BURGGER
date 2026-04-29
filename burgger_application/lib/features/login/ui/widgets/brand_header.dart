import 'package:burgger_application/core/shared/app_logo.dart';
import 'package:burgger_application/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class BrandHeader extends StatelessWidget {
  const BrandHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: AppLogo(isLowerCaseText: false, sizeText: 32),
        ),
        Gap(10.h),

        Text('Welcome Back', style: AppTextStyle.font30WhitelightColorNormal),
        Gap(10),
        Text(
          'Save the moment, sign in to order.',
          style: AppTextStyle.font16TextColorMedium,
        ),
      ],
    );
  }
}
