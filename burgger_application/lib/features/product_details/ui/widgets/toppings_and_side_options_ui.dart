import 'dart:isolate';

import 'package:burgger_application/core/theming/app_colors.dart';
import 'package:burgger_application/core/theming/styles.dart';
import 'package:burgger_application/features/cart/logic/cubit/cart_cubit.dart';
import 'package:burgger_application/features/cart/logic/cubit/cart_state.dart';
import 'package:burgger_application/features/home/logic/cubit/products/products_state.dart';
import 'package:burgger_application/features/product_details/logic/cubit/product_deatlies/product_deatlies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ToppingsAndSideOptionsUi extends StatefulWidget {
  final String name;
  final String image;
  final int id;

  ToppingsAndSideOptionsUi({
    super.key,
    required this.name,
    required this.image,
    required this.id,
  });

  @override
  State<ToppingsAndSideOptionsUi> createState() =>
      _ToppingsAndSideOptionsUiState();
}

class _ToppingsAndSideOptionsUiState extends State<ToppingsAndSideOptionsUi> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ProductDeatliesCubit>();

    final isSelected = cubit.selectedToppings.contains(widget.id);
    final isSelectedSideOptions = cubit.selectedSides.contains(widget.id);
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            width: 110.w,
            height: 130.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.darkGreenColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(widget.name, style: AppTextStyle.font14TextColorWhite),
                  Gap(5),
                  GestureDetector(
                    onTap: () {
                      print("clicked");
                      setState(() {
                        cubit.toggleTopping(widget.id);
                        cubit.sideOptionToggle(widget.id);
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColors.whitelightColor,
                      radius: 12.h,
                      child: isSelected
                          ? Icon(Icons.check, color: Colors.black)
                          : Icon(Icons.add, color: AppColors.backgroundColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            alignment: Alignment.center,
            height: 84.h,
            width: 110.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Image.network(widget.image, width: 80.w),
          ),
        ),
      ],
    );
  }
}
