import 'package:burgger_application/core/theming/app_colors.dart';
import 'package:burgger_application/core/theming/styles.dart';
import 'package:burgger_application/features/home/data/models/products/products_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductDeatliesPhotoName extends StatelessWidget {
  final ProductData product;

  const ProductDeatliesPhotoName({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: SizedBox(
            width: 300,
            height: 300,
            child: Image.network(
              product.image ?? '',
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.image_not_supported);
              },
            ),
          ),
        ),

        Gap(5),
        Text(
          product.name ?? '',
          style: AppTextStyle.font30WhitelightColorExtraBold,
        ),
        Gap(10),
        Row(
          children: [
            Expanded(
              flex: 3, // النص بياخد 3 أجزاء من المساحة
              child: Text(
                product.description ?? 'No description available',
                style: AppTextStyle.font14TextColorMedium,
              ),
            ),
            Gap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$ ${product.price ?? '0.0'}',
                  style: AppTextStyle.font30PrimaryColorExtraBold,
                ),
                Gap(5),
                Row(
                  children: [
                    Icon(Icons.star, color: AppColors.secoundryColor, size: 16),
                    Gap(2),
                    Text(
                      product.rating ?? '0',
                      style: TextStyle(color: AppColors.secoundryColor),
                    ),
                  ],
                ),
              ],
            ),
            Gap(5),
          ],
        ),
      ],
    );
  }
}
