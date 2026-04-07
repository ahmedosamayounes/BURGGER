import 'package:burgger_application/core/shared/app_logo.dart';
import 'package:burgger_application/core/theming/app_colors.dart';
import 'package:burgger_application/core/theming/styles.dart';
import 'package:burgger_application/features/home/data/models/products/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProductDeatlies extends StatelessWidget {
  final ProductData product;
  const ProductDeatlies({super.key, required this.product});

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
                Center(
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: Image.network(product.image ?? ''),
                  ),
                ),

                Gap(5),
                Text(
                  product.name ?? '' ,
                  style: AppTextStyle.font30WhitelightColorExtraBold,
                ),
                Gap(10),
                Row(
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: 200),
                      child: Text(
                        product.description ?? '',
                        
                        style: AppTextStyle.font14TextColorMedium,
                        
                      ),
                    ),
                    Gap(5),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$ ${product.price ?? ''}',
                          style: AppTextStyle.font30PrimaryColorExtraBold,
                        ),
                        Gap(5),
                        Row(
                        
                          children: [
                            Icon(
                              Icons.star,
                              color: AppColors.secoundryColor,
                              size: 16,
                            ),
                            Gap(2),
                            Text(
                               product.rating ?? '',
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
            ),
            
          ),
        ),
      ),
    );
  }
}
