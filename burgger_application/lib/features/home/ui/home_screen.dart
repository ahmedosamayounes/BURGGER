import 'package:burgger_application/features/home/ui/widgets/home_header.dart';

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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBarr(iconAction: Icon(CupertinoIcons.cart_fill , color: Colors.white, size: 18,), onTap: () => context.pushNamed(RoutesString.cart) ,         leading: Icon(Icons.arrow_back, color: AppColors.primaryColor),),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              HomeHeader(),
                Gap(20),
                CategoriesBlocBuilder(),
                Gap(20),
                ProductsBlocBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
