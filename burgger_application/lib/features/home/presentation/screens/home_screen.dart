import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes_string.dart';
import '../../../../core/shared/app_bar.dart';
import '../widgets/categories/categories_bloc_builder.dart';
import '../widgets/home_header.dart';
import '../widgets/products/products_bloc_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
        // tell page view do not remove
        with
        AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: CustomAppBar(
        iconAction: Icon(
          CupertinoIcons.cart_fill,
          color: Colors.white,
          size: 18.sp,
        ),
        onTap: () => context.pushNamed(RoutesString.cart),
        onLeadingTap: () {},
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
