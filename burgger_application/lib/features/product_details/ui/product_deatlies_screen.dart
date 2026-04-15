import 'package:burgger_application/core/routing/routes_string.dart';
import 'package:burgger_application/core/shared/app_button.dart';
import 'package:burgger_application/core/shared/app_logo.dart';
import 'package:burgger_application/core/theming/app_colors.dart';
import 'package:burgger_application/core/theming/styles.dart';
import 'package:burgger_application/features/cart/data/models/cart_request_model.dart';
import 'package:burgger_application/features/cart/logic/cubit/cart_cubit.dart';
import 'package:burgger_application/features/home/data/models/products/products_model.dart';
import 'package:burgger_application/features/product_details/logic/cubit/product_deatlies/product_deatlies_cubit.dart';
import 'package:burgger_application/features/home/logic/cubit/products/products_state.dart';
import 'package:burgger_application/features/product_details/ui/widgets/product_deatlies_photo_name.dart';
import 'package:burgger_application/features/product_details/ui/widgets/side_options_list.dart';
import 'package:burgger_application/features/product_details/ui/widgets/toppings_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            child: BlocBuilder<ProductDeatliesCubit, ProductsState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return const SizedBox.shrink();
                  },
                  error: (errorHandler) => const SizedBox.shrink(),

                  initial: () => const SizedBox.shrink(),
                  loading: () => Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  productDetailsSuccess: (productsdata) {
                    return Column(
                      children: [
                        ProductDeatliesPhotoName(product: product),
                        Gap(20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Toppings',
                              style: AppTextStyle.font20whitelightColorBold,
                            ),
                            Gap(12),

                            ToppingsList(),
                          ],
                        ),
                        Gap(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              'Side Options',
                              style: AppTextStyle.font20whitelightColorBold,
                            ),
                            Gap(10),
                            SideOptionsList(),
                          ],
                        ),
                        Gap(20),
                        AppButton(
                          buttonText: 'Add to Cart',
                          textStyle: AppTextStyle.font18TextColorReqular,
                          onPressed: () async {
                            final productCubit = context
                                .read<ProductDeatliesCubit>();
                            final cartCubit = context.read<CartCubit>();

                            if (product.id == null) return;

                            final model = CartRequestModel(
                              items: [
                                CartItem(
                                  productId: product.id!,
                                  quantity: 1,
                                  spicy: 0.1,
                                  toppings: productCubit.selectedToppings,
                                  sideOptions: productCubit.selectedSides,
                                ),
                              ],
                            );

                            cartCubit.addToCart(model);
                            if (context.mounted) {
                              Navigator.pushNamed(context, RoutesString.cart);
                            }
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
