import 'widgets/home_header.dart';

import '../../../core/theming/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/helpers/extensions.dart';
import '../../../core/routing/routes_string.dart';
import '../../../core/shared/app_bar.dart';
import 'widgets/categories/categories_bloc_builder.dart';
import 'widgets/products/products_bloc_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        iconAction: Icon(
          CupertinoIcons.cart_fill,
          color: Colors.white,
          size: 18.sp,
        ),
        onTap: () => context.pushNamed(RoutesString.cart),
        leading: Icon(Icons.arrow_back, color: AppColors.primaryColor),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeHeader(),
                Gap(20.h),
                const CategoriesBlocBuilder(),
                Gap(20.h),
                const ProductsBlocBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
