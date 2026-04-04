import 'package:burgger_application/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300.w, // مثلاً خلي الـ body 300 وحدة عرض فقط
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Join the ',
                    style: AppTextStyle.font40WhitelightColorExtraBold,
                  ),

                  TextSpan(
                    text: 'Digital Concierge ',

                    style: AppTextStyle.font40PrimaryColorExtraBold,
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
    );
  }
}
