
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/routing/routes_string.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../data/models/products/products_model.dart';

class ProductsList extends StatefulWidget {
  final List<ProductData?> products;

   const ProductsList({super.key, required this.products});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {

  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.h,
      width: double.infinity,
      child: GridView.builder(
        shrinkWrap: true,

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 25.w,
          mainAxisSpacing: 25.h,
          childAspectRatio: 1 / 2.2.w,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                      // when i click go to product deatiles

                      Navigator.pushNamed(
                        context,
                        RoutesString.productDetail,
                        arguments: widget.products[index],
                      );
                    },
            child: Container(
              width: 195.w,
              decoration: BoxDecoration(
                color: AppColors.backgroundColor2,
            
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Padding(
                padding:  EdgeInsets.only(left: 10.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                        width: 140.w,
                        height: 150.h,
                        child: Image.network(widget.products[index]!.image ?? ''),
                      ),
                    ),
                    Gap(8),
                    Text(
                      widget.products[index]!.name ?? '',
            
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor,
                      ),
                      maxLines: 2,
                    ),
                    Gap(20),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColors.secoundryColor,
                          size: 12.sp,
                        ),
                        Gap(5),
                        Text(
                          widget.products[index]!.rating ?? '',
                          style: TextStyle(
                            color: AppColors.secoundryColor,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                    Gap(10),
                    Row(
                      children: [
                        Gap(5),
                        Row(
                          children: [
                            Text(
                              '\$${widget.products[index]!.price.toString()}',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            Gap(20),
                            CircleAvatar(
                              backgroundColor: AppColors.primaryColor,
                              child: Icon(
                                Icons.keyboard_double_arrow_right,
                                color: AppColors.buttonTextColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: widget.products.length,
      ),
    );
  }
}
