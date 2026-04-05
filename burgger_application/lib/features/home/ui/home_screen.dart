import 'package:burgger_application/core/shared/app_logo.dart';
import 'package:burgger_application/core/theming/app_colors.dart';
import 'package:burgger_application/core/theming/styles.dart';
import 'package:burgger_application/features/home/ui/widgets/categories/categories_bloc_builder.dart';
import 'package:burgger_application/features/home/ui/widgets/categories/categories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0.0,
        leading: Icon(Icons.arrow_back, color: AppColors.primaryColor),
        title: Row(children: [AppLogo(isLowerCaseText: true, sizeText: 24)]),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 32.0),
            child: CircleAvatar(
              backgroundColor: AppColors.darkGreenColor,
              child: Icon(Icons.person, size: 16, color: Colors.white),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Morning, Chef',
                  style: AppTextStyle.font30WhitelightColorExtraBold,
                ),
                Gap(5),
                Text(
                  'Experience the art of the perfect flame-grilled burger.',
                  style: AppTextStyle.font14TextColorMedium,
                ),

                Gap(20),
                CategoriesBlocBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
