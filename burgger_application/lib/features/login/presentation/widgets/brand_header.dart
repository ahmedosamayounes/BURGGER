import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/shared/app_logo.dart';
import '../../../../core/theming/styles.dart';

class BrandHeader extends StatelessWidget {
  const BrandHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: AppLogo(isLowerCaseText: false, sizeText: 32),
        ),
        Gap(10),

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
