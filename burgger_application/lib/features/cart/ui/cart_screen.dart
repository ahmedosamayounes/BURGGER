import 'visa.dart';

import '../../../core/shared/app_bar.dart';
import '../../../core/shared/app_button.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/styles.dart';
import '../logic/cubit/cart_cubit.dart';
import '../logic/cubit/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    context.read<CartCubit>().getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          leading: Icon(Icons.arrow_back, color: AppColors.primaryColor),
        ),

        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return state.maybeWhen(
              cartSuccess: (data) {
                final items = data.data?.items ?? [];

                if (items.isEmpty) {
                  return Center(
                    child: Text(
                      "Cart is empty",
                      style: AppTextStyle.font16PrimaryColorBold,
                    ),
                  );
                }
                num calculatedTotalPrice = 0;

                for (dynamic item in items) {
                  final doubleItemPrice =
                      double.tryParse(item.price?.toString() ?? '0') ?? 0.0;

                  calculatedTotalPrice += doubleItemPrice;
                }
                return Scaffold(
                  body: SafeArea(
                    child: items.isEmpty
                        ? const Center(child: Text("Cart is empty"))
                        : ListView.builder(
                            padding: EdgeInsets.symmetric(
                              vertical: 20.h,
                              horizontal: 20.w,
                            ),
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              final item = items[index];

                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0.h),
                                child: Container(
                                  width: 370.w,
                                  height: 430.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Image.network(
                                          item.image ?? '',
                                          width: 160.w,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 15.r,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: Text(
                                                item.name ?? '',
                                                style:
                                                    AppTextStyle.font20RedBold,
                                              ),
                                            ),
                                            const Gap(30),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Toppings : ",
                                                  style: AppTextStyle
                                                      .font14BalackColorBold,
                                                ),
                                                Expanded(
                                                  child: Wrap(
                                                    children: (item.toppings ?? [])
                                                        .map(
                                                          (t) => Padding(
                                                            padding:
                                                                EdgeInsets.symmetric(
                                                                  horizontal:
                                                                      5.r,
                                                                ),
                                                            child: CircleAvatar(
                                                              backgroundColor:
                                                                  AppColors
                                                                      .whitelightColor,
                                                              child:
                                                                  Image.network(
                                                                    t.image ??
                                                                        '',
                                                                    width: 35.w,
                                                                  ),
                                                            ),
                                                          ),
                                                        )
                                                        .toList(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Gap(20),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Side Options:",
                                                  style: AppTextStyle
                                                      .font14BalackColorBold,
                                                ),
                                                Expanded(
                                                  child: Wrap(
                                                    children: (item.sideOptions ?? [])
                                                        .map(
                                                          (t) => Padding(
                                                            padding:
                                                                EdgeInsets.symmetric(
                                                                  horizontal:
                                                                      2.r,
                                                                ),
                                                            child: CircleAvatar(
                                                              backgroundColor:
                                                                  AppColors
                                                                      .whitelightColor,
                                                              child:
                                                                  Image.network(
                                                                    t.image ??
                                                                        '',
                                                                    width: 35.w,
                                                                  ),
                                                            ),
                                                          ),
                                                        )
                                                        .toList(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Gap(30),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 100.w,
                                                  height: 50.h,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          20.r,
                                                        ),
                                                    color: AppColors
                                                        .secoundryColor,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "\$${item.price ?? 0}",
                                                      style: AppTextStyle
                                                          .font14PriceColorBold,
                                                    ),
                                                  ),
                                                ),
                                                const Spacer(),
                                                AppButton(
                                                  icon: Icon(
                                                    Icons.remove_circle_outline,
                                                    color: AppColors
                                                        .darkGreenColor,
                                                  ),
                                                  buttonHeight: 50.h,
                                                  buttonWidth: 120.w,
                                                  buttonText: "Remove",
                                                  textStyle: AppTextStyle
                                                      .font14BalackColorBold,
                                                  onPressed: () {
                                                    context
                                                        .read<CartCubit>()
                                                        .deleteFromCart(
                                                          item.itemId ?? 0,
                                                        );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),

                  bottomNavigationBar: items.isEmpty
                      ? null
                      : Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.w,
                            vertical: 15.h,
                          ),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total Price",
                                    style: AppTextStyle.font24PrimaryColorBold,
                                  ),
                                  const Gap(5),
                                  Text(
                                    "\$$calculatedTotalPrice",
                                    style: AppTextStyle.font22WhiteColorBold,
                                  ),
                                ],
                              ),
                              AppButton(
                                buttonText: "Checkout",
                                icon: Icon(
                                  Icons.shopping_cart_checkout_outlined,
                                  color: Colors.black,
                                  size: 23.sp,
                                ),
                                buttonWidth: 150.w,
                                buttonHeight: 50.h,
                                textStyle: AppTextStyle.font17BalackColorBold,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Visa(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                );
              },
              cartLoading: () => const Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              ),
              orElse: () => const SizedBox(),
              cartError: (e) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: AppColors.errorColor,
                        size: 50,
                      ),

                      const SizedBox(height: 10),

                      Text(
                        e,
                        style: AppTextStyle.font16ErrorColorBold,
                        textAlign: TextAlign.center,
                      ),
                    ],
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
