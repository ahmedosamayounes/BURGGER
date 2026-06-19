import '../../../home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';

class ProductDetailsPhotoName extends StatelessWidget {
  final ProductEntity product;


  const ProductDetailsPhotoName({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: SizedBox(
            width: 300.w,
            height: 300.h,
            child: Image.network(
              product.image ,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.image_not_supported);
              },
            ),
          ),
        ),

        Gap(5.h),
        Text(
          product.name ,
          style: AppTextStyle.font30WhitelightColorExtraBold,
        ),
        Gap(10.h),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                product.description,
                style: AppTextStyle.font14TextColorMedium,
              ),
            ),
            Gap(10.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$ ${product.price }',
                  style: AppTextStyle.font30PrimaryColorExtraBold,
                ),
                Gap(5.h),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: AppColors.secoundryColor,
                      size: 16.sp,
                    ),
                    Gap(2.w),
                    Text(
                      product.rating,
                      style: TextStyle(color: AppColors.secoundryColor),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
