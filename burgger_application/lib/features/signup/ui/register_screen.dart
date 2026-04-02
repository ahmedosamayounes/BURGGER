import 'package:burgger_application/core/shared/app_logo.dart';
import 'package:burgger_application/core/theming/app_colors.dart';
import 'package:burgger_application/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leadingWidth: 0.0,
        scrolledUnderElevation: 0.0,
        leading: SizedBox.shrink(),
        title: Row(children: [AppLogo(isLowerCaseText: true, sizeText: 24)]),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 32.0),
            child: CircleAvatar(
              backgroundColor: AppColors.darkGreenColor,
              child: Icon(
                Icons.arrow_forward_outlined,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Container(
                      width: 300.w, // مثلاً خلي الـ body 300 وحدة عرض فقط
              color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center, // محتوى داخل
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Join the ',
                            style: AppTextStyle.font40PrimaryColorExtraBold,
                          ),
                
                          TextSpan(
                            text: 'Digital Concierge ',
                
                            style: AppTextStyle.font40WhitelightColorExtraBold,
                          ),
                        ],
                      ),
                    ),
                    Gap(5.h),
                    Text(
                      'Elevate your palette. Unlock exclusive dining experiences and culinary mastery.',
                      style: AppTextStyle.font18WhitelightColorMeduim,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
