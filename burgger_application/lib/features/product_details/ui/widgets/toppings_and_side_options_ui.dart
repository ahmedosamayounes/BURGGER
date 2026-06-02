import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';
import '../../logic/cubit/product_deatlies/product_deatlies_cubit.dart';

class ToppingsAndSideOptionsUi extends StatefulWidget {
  final String name;
  final String image;
  final int id;
  final bool isTopping;

  const ToppingsAndSideOptionsUi({
    super.key,
    required this.name,
    required this.image,
    required this.id,
    required this.isTopping,
  });

  @override
  State<ToppingsAndSideOptionsUi> createState() =>
      _ToppingsAndSideOptionsUiState();
}

class _ToppingsAndSideOptionsUiState extends State<ToppingsAndSideOptionsUi> {
  @override
  Widget build(BuildContext context) {
    // بنجيب الـ cubit من غير ما نراقبه (read بس) عشان نبعتله الداتا
    final cubit = context.read<ProductDetailsCubit>();

    // بنشوف هل العنصر ده مضاف في القوائم ولا لأ
    final isSelected = widget.isTopping
        ? cubit.selectedToppings.contains(widget.id)
        : cubit.selectedSides.contains(widget.id);

    return Stack(
      children: [
        Padding(
          padding:  EdgeInsets.only(right: 20.r),
          child: Container(
            width: 110.w,
            height: 130.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: AppColors.darkGreenColor,
            ),
            child: Padding(
              padding:  EdgeInsets.all(6.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      widget.name, 
                      style: AppTextStyle.font14TextColorWhite,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Gap(5),
                  GestureDetector(
                    onTap: () {
                      // 👈 بنستخدم setState هنا عشان نريح دماغنا والزرار يقلب فوراً
                      setState(() {
                        if (widget.isTopping) {
                          cubit.toggleTopping(widget.id);
                        } else {
                          cubit.sideOptionToggle(widget.id);
                        }
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColors.whitelightColor,
                      radius: 12.h,
                      child: isSelected
                          ?  Icon(Icons.check, color: Colors.black, size: 16.sp)
                          : Icon(Icons.add, color: AppColors.backgroundColor, size: 16.sp),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(right: 20.r),
          child: Container(
            alignment: Alignment.center,
            height: 84.h,
            width: 110.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Colors.white,
            ),
            child: Image.network(widget.image, width: 80.w),
          ),
        ),
      ],
    );
  }
}