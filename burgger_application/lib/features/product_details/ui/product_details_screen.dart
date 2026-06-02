import 'widgets/add_to_cart_bloc_lisnter.dart';
import '../../../core/shared/app_bar.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/styles.dart';

import '../../home/data/models/products/products_model.dart';
import '../logic/cubit/product_deatlies/product_deatlies_cubit.dart';
import '../../home/logic/cubit/products/products_state.dart';
import 'widgets/product_details_photo_name.dart';
import 'widgets/side_options_list.dart';
import 'widgets/toppings_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProductDetails extends StatelessWidget {
  final ProductData product;

  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: Icon(Icons.arrow_back, color: AppColors.primaryColor),
      ),

      body: SafeArea(
        child: BlocBuilder<ProductDetailsCubit, ProductsState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return const SizedBox.shrink();
              },
              error: (errorHandler) {
                return Center(
                  child: Text(
                    errorHandler.apiErrorModel.message ??
                        'Something went wrong',
                    style: AppTextStyle.font16ErrorColorBold,
                  ),
                );
              },

              initial: () => const SizedBox.shrink(),
              loading: () => Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              ),

              productDetailsSuccess: (productsdata) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
                    ),
                    child: Column(
                      children: [
                        ProductDetailsPhotoName(product: productsdata),
                        Gap(20.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Toppings',
                              style: AppTextStyle.font20whitelightColorBold,
                            ),
                            Gap(12.h),

                            const ToppingsList(),
                          ],
                        ),
                        Gap(10.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              'Side Options',
                              style: AppTextStyle.font20whitelightColorBold,
                            ),
                            Gap(10.h),
                            const SideOptionsList(),
                          ],
                        ),
                        Gap(20.h),
                        AddToCartBlocListener(product: product),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
